//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.DispatchSemaphore
import enum Smithy.ByteStream
import func CoreFoundation.autoreleasepool
import struct Foundation.Data

public extension S3TransferManager {
    /// Uploads a single object to a S3 bucket.
    ///
    /// Returns a `Task` immediately after function call; upload is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function gets cancelled, all child tasks also get cancelled automatically and any in-progress multipart upload (MPU) gets aborted.
    ///
    /// - Parameters:
    ///   - input: An instance of `UploadObjectInput`, the synthetic input type specific to this operation of `S3TransferManager`.
    /// - Returns: An asynchronous `Task<UploadObjectOutput, Error>` that can be optionally waited on or cancelled as needed.
    ///
    /// This operation does not support uploading a stream payload of unknown length.
    func uploadObject(input: UploadObjectInput) throws -> Task<UploadObjectOutput, Error> {
        return Task {
            let payloadSize = try await resolvePayloadSize(of: input.putObjectInput.body)
            logger.debug(
                "Resolved payload size of \(payloadSize) for the object with key: \"\(input.putObjectInput.key!)\"."
            )

            let s3 = config.s3Client
            let semaphore = await semaphoreManager.getSemaphoreInstance(forBucket: input.putObjectInput.bucket!)

            // If payload is below threshold, just do a single putObject.
            if payloadSize < config.multipartUploadThresholdBytes {
                await wait(semaphore)
                do {
                    let putObjectOutput = try await s3.putObject(input: input.putObjectInput)
                    await signalAndReleaseSemaphore(semaphore, input.putObjectInput.bucket!)
                    logger.debug(
                        "Successfully uploaded the object with key \"\(input.putObjectInput.key!)\" using a single PutObject."
                    )
                    return UploadObjectOutput(putObjectOutput: putObjectOutput)
                } catch {
                    await signalAndReleaseSemaphore(semaphore, input.putObjectInput.bucket!)
                    throw error
                }
            }

            // Otherwise, use MPU.
            let (uploadID, numParts, partSize) = try await prepareMPU(
                s3: s3,
                payloadSize: payloadSize,
                input: input,
                semaphore: semaphore
            )
            logger.debug("Successfully created MPU with the upload ID: \"\(uploadID)\".")

            // Concurrently upload all the parts.
            // If an error is thrown at any point within the do-block, MPU is aborted in catch.
            do {
                let completedParts = try await uploadPartsConcurrently(
                    s3: s3,
                    input: input,
                    uploadID: uploadID,
                    numParts: numParts,
                    partSize: partSize,
                    payloadSize: payloadSize,
                    semaphore: semaphore
                )

                let completeMPUOutput = try await completeMPU(
                    s3: s3,
                    input: input,
                    uploadID: uploadID,
                    completedParts: completedParts,
                    payloadSize: payloadSize,
                    semaphore: semaphore
                )

                return UploadObjectOutput(completeMultipartUploadOutput: completeMPUOutput)
            } catch let originalError {
                do {
                    try await abortMPU(
                        s3: s3,
                        input: input,
                        uploadID: uploadID,
                        originalError: originalError,
                        semaphore: semaphore
                    )
                } catch {
                    // Failed to abort MPU; it's the end of the `uploadObject` operation.
                    // Release semaphore instance & throw error back up.
                    await self.semaphoreManager.releaseSemaphoreInstance(forBucket: input.putObjectInput.bucket!)
                    throw error
                }
                // Aborted MPU successfully; it's the end of the uploadObject operation.
                // Release sempahore instance & throw the originla error back up.
                await self.semaphoreManager.releaseSemaphoreInstance(forBucket: input.putObjectInput.bucket!)
                throw originalError
            }
        }
    }

    internal func resolvePayloadSize(of body: ByteStream?) async throws -> Int {
        switch body {
        case .data(let data):
            return data?.count ?? 0
        case .stream(let stream):
            if let length = stream.length {
                return length
            } else {
                throw S3TMUploadObjectError.streamPayloadOfUnknownLength
            }
        default:
            return 0
        }
    }

    private func prepareMPU(
        s3: S3Client,
        payloadSize: Int,
        input: UploadObjectInput,
        semaphore: DispatchSemaphore
    ) async throws -> (uploadID: String, numParts: Int, partSize: Int) {
        // Determine part size. Division by 10,000 is bc MPU supports 10,000 parts maximum.
        let partSize = max(config.targetPartSizeBytes, payloadSize/10000)
        // Add 1 if there should be a last part smaller than regular part size.
        // E.g., say payloadSize is 103 and partSize is 10. Then we need 11 parts,
        //  where the 11th part is only 3 bytes long.
        let numParts = (payloadSize / partSize) + (payloadSize % partSize == 0 ? 0 : 1)

        let createMPUInput = input.getCreateMultipartUploadInput()

        await wait(semaphore)
        do {
            let createMPUOutput = try await s3.createMultipartUpload(input: createMPUInput)
            semaphore.signal()
            // Upload ID for the MPU is used throughout the MPU process.
            guard let uploadID = createMPUOutput.uploadId else {
                throw S3TMUploadObjectError.failedToCreateMPU
            }
            return (uploadID, numParts, partSize)
        } catch S3TMUploadObjectError.failedToCreateMPU {
            // Missing Upload ID in successful response = end of `uploadObject` operation.
            // Release semaphore instance & bubble up the error.
            await self.semaphoreManager.releaseSemaphoreInstance(forBucket: input.putObjectInput.bucket!)
            throw S3TMUploadObjectError.failedToCreateMPU
        } catch {
            // Failure to create MPU = end of `uploadObject` operation.
            // Signal & release semaphore instance, and bubble up the error.
            await signalAndReleaseSemaphore(semaphore, input.putObjectInput.bucket!)
            throw error
        }
    }

    // Uploads & returns completed parts used to complete MPU.
    private func uploadPartsConcurrently(
        s3: S3Client,
        input: UploadObjectInput,
        uploadID: String,
        numParts: Int,
        partSize: Int,
        payloadSize: Int,
        semaphore: DispatchSemaphore
    ) async throws -> [S3ClientTypes.CompletedPart] {
        return try await withThrowingTaskGroup(
            // Child task returns a completed part that contains S3's checksum & part number.
            of: S3ClientTypes.CompletedPart.self,
            // Task group returns completed parts sorted by the part number.
            returning: [S3ClientTypes.CompletedPart].self
        ) { group in
            for partNumber in 1...numParts {
                // Wait & acquire semaphore before reading part data & adding a new uploadPart task for it.
                await wait(semaphore)
                do {
                    // Using async autorelease to read and return part data ensures temporary things that were created to
                    //   read the part data gets released as expected.
                    let partData = try await autoreleasepoolAsync {
                        let partOffset = (partNumber - 1) * partSize
                        // Either take full part size or remainder (only for the last part).
                        let resolvedPartSize = min(partSize, payloadSize - partOffset)
                        return try await self.readPartData(
                            input: input,
                            partSize: resolvedPartSize,
                            partOffset: partOffset
                        )
                    }

                    try Task.checkCancellation()
                    group.addTask {
                        defer {
                            // Free semaphore the child task was using before returning.
                            semaphore.signal()
                        }

                        let uploadPartInput = input.getUploadPartInput(
                            body: ByteStream.data(partData),
                            partNumber: partNumber,
                            uploadID: uploadID
                        )

                        try Task.checkCancellation()
                        let uploadPartOutput = try await s3.uploadPart(input: uploadPartInput)
                        // Release semaphore usage & return output.
                        await self.semaphoreManager.releaseSemaphoreInstance(forBucket: input.putObjectInput.bucket!)
                        return S3ClientTypes.CompletedPart(
                            checksumCRC32: uploadPartOutput.checksumCRC32,
                            checksumCRC32C: uploadPartOutput.checksumCRC32C,
                            checksumSHA1: uploadPartOutput.checksumSHA1,
                            checksumSHA256: uploadPartOutput.checksumSHA256,
                            eTag: uploadPartOutput.eTag,
                            partNumber: partNumber
                        )
                    }
                } catch {
                    // This is only reached if error is thrown before child task could be added.
                    // I.e., failed to read part, or task was cancelled.
                    // Signal and throw error up.
                    // Releasing semaphore instance is handled by catch block in `uploadObject` function.
                    semaphore.signal()
                    throw error
                }
            }

            var completedParts: [S3ClientTypes.CompletedPart] = []
            for try await part in group {
                completedParts.append(part)
            }
            completedParts.sort { $0.partNumber! < $1.partNumber! }
            return completedParts
        }
    }

    internal func readPartData(
        input: UploadObjectInput,
        partSize: Int,
        partOffset: Int? = nil // Only used for reading from Data; streams should already point to next start.
    ) async throws -> Data {
        var partData: Data?
        if case .data(let data) = input.putObjectInput.body {
            partData = data?[partOffset!..<(partOffset! + partSize)]
        } else if case .stream(let stream) = input.putObjectInput.body {
            partData = try stream.read(upToCount: Int(partSize))
        }

        guard let resolvedPartData = partData else {
            throw S3TMUploadObjectError.failedToReadPart
        }
        return resolvedPartData
    }

    private func completeMPU(
        s3: S3Client,
        input: UploadObjectInput,
        uploadID: String,
        completedParts: [S3ClientTypes.CompletedPart],
        payloadSize: Int,
        semaphore: DispatchSemaphore
    ) async throws -> CompleteMultipartUploadOutput {
        let completeMPUInput = input.getCompleteMultipartUploadInput(
            multipartUpload: S3ClientTypes.CompletedMultipartUpload(parts: completedParts),
            uploadID: uploadID,
            mpuObjectSize: payloadSize
        )
        await wait(semaphore)
        do {
            let completeMPUOutput = try await s3.completeMultipartUpload(input: completeMPUInput)
            // MPU completed successfully; it's the end of the `uploadObject` operation.
            // Signal and release semaphore instance.
            await signalAndReleaseSemaphore(semaphore, input.putObjectInput.bucket!)
            logger.debug("Successfully completed MPU with uploadID: \"\(uploadID)\".")
            return completeMPUOutput
        } catch {
            // If failed to complete MPU, signal semaphore used & throw error back up.
            // Releasing semaphore instance is handled by catch block in `uploadObject` function.
            semaphore.signal()
            throw error
        }
    }

    private func abortMPU(
        s3: S3Client,
        input: UploadObjectInput,
        uploadID: String,
        originalError: Error,
        semaphore: DispatchSemaphore
    ) async throws {
        await wait(semaphore)
        do {
            _ = try await s3.abortMultipartUpload(input: input.getAbortMultipartUploadInput(uploadID: uploadID))
            // MPU aborted successfully; it's the end of the `uploadObject` operation.
            // Signal and release semaphore instance.
            await signalAndReleaseSemaphore(semaphore, input.putObjectInput.bucket!)
            logger.debug("Successfully aborted MPU with the uploadID: \"\(uploadID)\".")
        } catch let abortError {
            // If failed to abort MPU, signal semaphore used & throw error back up.
            // Releasing semaphore instance is handled by catch block in `uploadObject` function.
            semaphore.signal()
            logger.debug("Failed to abort MPU with the uploadID: \"\(uploadID)\".")
            throw S3TMUploadObjectError.failedToAbortMPU(
                errorFromMPUOperation: originalError,
                errorFromFailedAbortMPUOperation: abortError
            )
        }
    }

    // Async wrapper for autoreleasepool.
    // Regular autoreleasepool doesn't allow async operations, hence this wrapper.
    private func autoreleasepoolAsync<T>(_ operation: @escaping () async throws -> T) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            autoreleasepool {
                let _: Task<Void, Never> = Task {
                    do {
                        let result = try await operation()
                        continuation.resume(returning: result)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }

    // Helper function to both signal semaphore & release usage.
    private func signalAndReleaseSemaphore(_ semaphore: DispatchSemaphore, _ bucketName: String) async {
        semaphore.signal()
        await self.semaphoreManager.releaseSemaphoreInstance(forBucket: bucketName)
    }
}

/// A non-exhaustive list of errors that can be thrown by the `uploadObject` operation of `S3TransferManager`.
public enum S3TMUploadObjectError: Error {
    case streamPayloadOfUnknownLength
    case failedToCreateMPU
    case failedToReadPart
    case failedToAbortMPU(errorFromMPUOperation: Error, errorFromFailedAbortMPUOperation: Error)
}
