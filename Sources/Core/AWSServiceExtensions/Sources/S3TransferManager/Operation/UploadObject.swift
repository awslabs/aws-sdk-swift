//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import enum Smithy.ByteStream
import struct Foundation.Data

public extension S3TransferManager {
    /// Uploads a single object to S3.
    ///
    /// Automatically & concurrently uses S3 mutlipart upload (MPU) if payload size exceeds `config.multipartUploadThresholdBytes`.
    /// Returns a `Task` immediately after function call; upload is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically and MPU is safely aborted.
    ///
    /// - Parameters:
    ///   - input: An instance of `UploadObjectInput`, a synthetic input type specific to this operation of the S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<UploadObjectOutput, Error>` that can be waited on or cancelled as needed.
    ///
    /// This operation does not support uploading a stream payload of unknown length.
    func uploadObject(input: UploadObjectInput) throws -> Task<UploadObjectOutput, Error> {
        return Task {
            let payloadSize = try await resolvePayloadSize(of: input.putObjectInput.body)
            logger.debug(
                "Resolved payload size of \(payloadSize) for the object with key: \"\(input.putObjectInput.key!)\"."
            )

            let s3 = config.s3Client

            // If payload is below threshold, just do a single putObject.
            if payloadSize < config.multipartUploadThresholdBytes {
                let putObjectOutput = try await s3.putObject(input: input.putObjectInput)
                logger.debug(
                    "Successfully uploaded the object with key \"\(input.putObjectInput.key!)\" using a single PutObject."
                )
                return UploadObjectOutput(putObjectOutput: putObjectOutput)
            }

            // Otherwise, use MPU.
            let (uploadID, numParts, partSize) = try await prepareMPU(s3: s3, payloadSize: payloadSize, input: input)
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
                    payloadSize: payloadSize
                )

                let completeMPUOutput = try await completeMPU(
                    s3: s3,
                    input: input,
                    uploadID: uploadID,
                    completedParts: completedParts,
                    payloadSize: payloadSize
                )

                return UploadObjectOutput(completeMultipartUploadOutput: completeMPUOutput)
            } catch let originalError {
                try await abortMPU(s3: s3, input: input, uploadID: uploadID, originalError: originalError)
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

    internal func prepareMPU(
        s3: S3Client,
        payloadSize: Int,
        input: UploadObjectInput
    ) async throws -> (uploadID: String, numParts: Int, partSize: Int) {
        // Determine part size. Division by 10,000 is bc MPU supports 10,000 parts maximum.
        let partSize = max(config.targetPartSizeBytes, payloadSize/10000)
        // Add 1 if there should be a last part smaller than regular part size.
        let numParts = (payloadSize / partSize) + (payloadSize % partSize == 0 ? 0 : 1)

        let createMPUInput = input.getCreateMultipartUploadInput()
        let createMPUOutput = try await s3.createMultipartUpload(input: createMPUInput)

        // Upload ID for the MPU is used throughout the MPU process.
        guard let uploadID = createMPUOutput.uploadId else {
            throw S3TMUploadObjectError.failedToCreateMPU
        }
        return (uploadID, numParts, partSize)
    }

    // Returns completed parts used to complete MPU.
    internal func uploadPartsConcurrently(
        s3: S3Client,
        input: UploadObjectInput,
        uploadID: String,
        numParts: Int,
        partSize: Int,
        payloadSize: Int
    ) async throws -> [S3ClientTypes.CompletedPart] {
        try await withThrowingTaskGroup(
            // Child task returns a completed part that contains S3's checksum & part number.
            of: S3ClientTypes.CompletedPart.self,
            // Task group returns completed parts sorted by part number.
            returning: [S3ClientTypes.CompletedPart].self
        ) { group in
            for partNumber in 1...numParts {
                try Task.checkCancellation()
                group.addTask {
                    let partOffset = (partNumber - 1) * partSize
                    // Either take full part size or remainder (only for last part).
                    let resolvedPartSize = min(partSize, payloadSize - partOffset)
                    let partData = try await self.readPartData(
                        input: input,
                        partSize: resolvedPartSize,
                        partOffset: partOffset
                    )

                    let uploadPartInput = input.getUploadPartInput(
                        body: ByteStream.data(partData),
                        partNumber: partNumber,
                        uploadID: uploadID
                    )

                    try Task.checkCancellation()
                    let uploadPartOutput = try await s3.uploadPart(input: uploadPartInput)
                    return S3ClientTypes.CompletedPart(
                        checksumCRC32: uploadPartOutput.checksumCRC32,
                        checksumCRC32C: uploadPartOutput.checksumCRC32C,
                        checksumSHA1: uploadPartOutput.checksumSHA1,
                        checksumSHA256: uploadPartOutput.checksumSHA256,
                        eTag: uploadPartOutput.eTag,
                        partNumber: partNumber
                    )
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

    internal func completeMPU(
        s3: S3Client,
        input: UploadObjectInput,
        uploadID: String,
        completedParts: [S3ClientTypes.CompletedPart],
        payloadSize: Int
    ) async throws -> CompleteMultipartUploadOutput {
        try Task.checkCancellation()
        let completeMPUInput = input.getCompleteMultipartUploadInput(
            multipartUpload: S3ClientTypes.CompletedMultipartUpload(parts: completedParts),
            uploadID: uploadID,
            mpuObjectSize: payloadSize
        )
        let completeMPUOutput = try await s3.completeMultipartUpload(input: completeMPUInput)
        logger.debug("Successfully completed MPU with uploadID: \"\(uploadID)\".")
        return completeMPUOutput
    }

    internal func abortMPU(
        s3: S3Client,
        input: UploadObjectInput,
        uploadID: String,
        originalError: Error
    ) async throws {
        do {
            _ = try await s3.abortMultipartUpload(input: input.getAbortMultipartUploadInput(uploadID: uploadID))
            logger.debug("Successfully aborted MPU with the uploadID: \"\(uploadID)\".")
        } catch let abortError {
            logger.debug("Failed to abort MPU with the uploadID: \"\(uploadID)\".")
            throw S3TMUploadObjectError.failedToAbortMPU(
                errorFromMPUOperation: originalError,
                errorFromFailedAbortMPUOperation: abortError
            )
        }
    }
}

/// A non-exhausive list of errors that can be thrown by the UploadObject operation of S3 Transfer Manager.
public enum S3TMUploadObjectError: Error {
    case streamPayloadOfUnknownLength
    case failedToCreateMPU
    case failedToReadPart
    case failedToAbortMPU(errorFromMPUOperation: Error, errorFromFailedAbortMPUOperation: Error)
}
