//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import struct Foundation.Data
import enum Smithy.ByteStream

/// The Transfer Manager for AWS S3. S3TM for short.
/// The S3TM is an out-of-the-box solution for performant uploads & downloads for both single and multiple files (directory / bucket).
///
/// The AWS S3 Transfer Manager (S3TM) supports the following features:
///  - Upload a single object to S3
///  - Download a single object from S3
///  - Upload a local directory to S3
///  - Download everything in a S3 bucket into a local directory
///  - Track transfer progress for all the operations above
///
/// For uploads, S3TM uses S3's multipart upload & Swift concurrency if object is above the threshold specified in config.
/// For downloads, S3TM uses range GET or part GET as specified in config & uses Swift concurrency for fast downloads.
/// For directory uploads, whether to upload everything in the directory recursively or not is configurable.
public class AWSS3TransferManager {
    let config: AWSS3TransferManagerConfig

    /// Creates the AWS S3 Transfer Manager.
    ///
    /// - Parameters:
    ///   - config: An instance of `AWSS3TransferManagerConfig`. If no value is provided, a default config with a default S3 client config is used.
    public init(
        config: AWSS3TransferManagerConfig? = nil
    ) async throws {
        if let config {
            self.config = config
        } else {
            self.config = try await AWSS3TransferManagerConfig()
        }
    }

    /// Uploads a single object to S3.
    ///
    /// Automatically & concurrently uses S3 mutlipart upload (MPU) if payload size exceeds `config.multipartUploadThresholdBytes`.
    /// Returns a `Task` immediately after function call; upload is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically and MPU is aborted.
    ///
    /// - Parameters:
    ///   - input: An instance of `UploadObjectInput`, a synthetic input type specific to this operation of the AWS S3 Transfer Manager. It must be initialized using an instance of `PutObjectInput`.
    /// - Returns: An asynchronous `Task<UploadObjectOutput, Error>` that can be waited on or cancelled as needed.
    ///
    /// This operation does not support uploading a stream payload of unknown length.
    public func uploadObject(input: UploadObjectInput) throws -> Task<UploadObjectOutput, Error> {
        return Task {
            /*
                Get size of the payload; used to determine PutObject vs. MPU.
                Just using Int for payload size should be fine here because 64-bit Int limit can
                    accommodate up to 9.22 exabytes.
                All apple devices and overwhelming majority of modern PCs / tablets are 64-bit based.
             */
            var payloadSize: Int
            switch input.putObjectInput.body {
            case .data(let data):
                payloadSize = data?.count ?? 0
            case .stream(let stream):
                if let length = stream.length {
                    payloadSize = length
                } else {
                    throw S3TMErrors.StreamPayloadOfUnknownLength
                }
            default:
                payloadSize = 0
            }

            guard payloadSize > 0 else {
                throw S3TMErrors.UploadObjectPayloadIsEmpty
            }

            // Get the S3Client to use for the upload.
            let s3 = config.s3Client

            // If payload size < threshold, just use the good ole' PutObject and return the output, wrapped in UploadObjectOutput.
            if payloadSize < config.multipartUploadThresholdBytes {
                let putObjectOutput = try await s3.putObject(input: input.putObjectInput)
                return UploadObjectOutput(putObjectOutput: putObjectOutput)
            }

            // Otherwise, use MPU.
            // Determine part size. Division by 10,000 is bc MPU supports maximum of 10,000 parts.
            let partSize = max(config.targetPartSizeBytes, payloadSize/10000)
            // Determine number of parts. Add 1 if there should be a last part with size smaller than partSize.
            let numParts = (payloadSize / partSize) + (payloadSize % partSize == 0 ? 0 : 1)

            // Create MPU input & create MPU.
            let createMPUInput = input.getCreateMultipartUploadInput()
            let createMPUOutput = try await s3.createMultipartUpload(input: createMPUInput)
            // Get upload ID from create MPU output; this is used throughout the MPU process.
            guard let uploadID = createMPUOutput.uploadId else {
                throw S3TMErrors.FailedToCreateMPU
            }

            // Concurrently upload all the parts using a throwing task group.
            // If an error is thrown at any point within the do-block, abort MPU in catch.
            do {
                let completedParts = try await withThrowingTaskGroup(
                    of: S3ClientTypes.CompletedPart.self,
                    returning: [S3ClientTypes.CompletedPart].self
                ) { group in
                    var results: [S3ClientTypes.CompletedPart] = []

                    // For each upload part, create and add task to the task group.
                    for partNumber in 1...numParts {
                        _ = group.addTaskUnlessCancelled {
                            // Offset to start of the new part.
                            let partOffset = (partNumber - 1) * partSize
                            // Either take full part size or remainder of payload for the last part.
                            let chunkSize = min(partSize, payloadSize - partOffset)
                            // Read part.
                            var partData = Data()
                            if case .data(let data) = input.putObjectInput.body {
                                partData = data?[partOffset..<(partOffset + chunkSize)] ?? Data()
                            } else if case .stream(let stream) = input.putObjectInput.body {
                                partData = try stream.read(upToCount: Int(chunkSize)) ?? Data()
                            }
                            guard partData.count > 0 else {
                                throw S3TMErrors.FailedToReadPart
                            }
                            // Construct upload part input.
                            let uploadPartInput = input.getUploadPartInput(
                                body: ByteStream.data(partData),
                                partNumber: partNumber,
                                uploadID: uploadID
                            )

                            // Check cancellation before calling uploadPart.
                            try Task.checkCancellation()

                            // Return result of UploadPart in the format used for calling complete MPU.
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

                    // Collect results of child tasks and return.
                    for try await result in group {
                        results.append(result)
                    }
                    return results
                }

                // Check cancellation before calling completeMPU.
                try Task.checkCancellation()

                // Complete MPU.
                let completeMPUInput = input.getCompleteMultipartUploadInput(
                    multipartUpload: S3ClientTypes.CompletedMultipartUpload(parts: completedParts),
                    uploadID: uploadID,
                    mpuObjectSize: String(payloadSize)
                )
                let completeMPUOutput = try await s3.completeMultipartUpload(input: completeMPUInput)
                return UploadObjectOutput(completeMultipartUploadOutput: completeMPUOutput)
            } catch let originalError {
                // Either task was cancelled by the user, uploadPart failed, or complete MPU failed,
                //  or we failed to read part.
                // First, abort the MPU operation. Then bubble up the original error back to the scaller.
                do {
                    _ = try await s3.abortMultipartUpload(
                        input: input.getAbortMultipartUploadInput(uploadID: uploadID)
                    )
                } catch let abortError {
                    // If failed to abort, bubble up both the original error & the abort error.
                    throw S3TMErrors.FailedToAbortMPU(originalError: originalError, abortError: abortError)
                }
                throw originalError
            }
        }
    }

    // TODO
//    public func downloadObject(input: DownloadObjectInput) throws -> Task<DownloadObjectOutput, Error> {}
//
//    public func uploadDirectory(input: UploadDirectoryInput) throws -> Task<UploadDirectoryOutput, Error> {}
//
//    public func downloadBucket(input: DownloadBucketInput) throws -> Task<DownloadBucketOutput, Error> {}
}

public enum S3TMErrors: Error {
    // UploadObject errors
    case StreamPayloadOfUnknownLength
    case UploadObjectPayloadIsEmpty
    case FailedToCreateMPU
    case FailedToReadPart
    case FailedToAbortMPU(originalError: Error, abortError: Error)
}
