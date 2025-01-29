//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.FileHandle
import class Foundation.FileManager
import class Foundation.OutputStream
import class SmithyStreams.BufferedStream
import class SmithyStreams.FileStream
import struct Foundation.Data
import struct Foundation.URL
import struct Smithy.SwiftLogger
import enum Smithy.ByteStream

/// The Transfer Manager for AWS S3. S3TM for short.
/// The S3TM is an out-of-the-box solution for performant uploads & downloads for both single and multiple files (local directory / S3 bucket).
///
/// The AWS S3 Transfer Manager (S3TM) for Swift supports the following features:
///  - Upload a single object to S3
///  - Download a single object from S3
///  - Upload a local directory to S3
///  - Download everything in a S3 bucket into a local directory
///  - Track transfer progress for all the operations above
///
/// For object(s) bigger than the threshold size specified in the config:
///  - For uploads, S3TM uses S3's multipart upload & Swift concurrency.
///  - For downloads, S3TM uses range GET or part GET as specified in config & Swift concurrency.
/// For directory uploads, you can configure whether to upload everything in the directory recursively or not.
///
/// All operations return immediately with a `Task` that can be optionally waited on for the operation result.
public class AWSS3TransferManager {
    let config: AWSS3TransferManagerConfig
    let logger: SwiftLogger

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
        // The logger instance used by the S3TM.
        logger = SwiftLogger(label: "S3TransferManager")
    }

    /// Uploads a single object to S3.
    ///
    /// Automatically & concurrently uses S3 mutlipart upload (MPU) if payload size exceeds `config.multipartUploadThresholdBytes`.
    /// Returns a `Task` immediately after function call; upload is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically and MPU is safely aborted.
    ///
    /// - Parameters:
    ///   - input: An instance of `UploadObjectInput`, a synthetic input type specific to this operation of the AWS S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<UploadObjectOutput, Error>` that can be waited on or cancelled as needed.
    ///
    /// This operation does not support uploading a stream payload of unknown length.
    public func uploadObject(input: UploadObjectInput) throws -> Task<UploadObjectOutput, Error> {
        return Task {
            // Get size of the payload; used to determine a single PutObject call vs. MPU.
            // Just using `Int` for payload size should be fine here because 64-bit Int limit is 9.22 exabytes.
            // All apple devices (since 2017) and overwhelming majority of modern PCs / tablets are 64-bit based.
            var payloadSize: Int
            switch input.putObjectInput.body {
            case .data(let data):
                payloadSize = data?.count ?? 0
            case .stream(let stream):
                if let length = stream.length {
                    payloadSize = length
                } else {
                    throw S3TMUploadObjectError.StreamPayloadOfUnknownLength
                }
            default:
                payloadSize = 0
            }

            logger.debug(
                "Resolved payload size of \(payloadSize) for uploading objec with key \"\(input.putObjectInput.key!)\""
            )

            // Get the S3Client to use for the upload.
            let s3 = config.s3Client

            // If payload size < threshold, just use a single PutObject and return the output wrapped in `UploadObjectOutput`.
            if payloadSize < config.multipartUploadThresholdBytes {
                let putObjectOutput = try await s3.putObject(input: input.putObjectInput)
                logger.debug("Successfully uploaded the object using a single PutObject.")
                return UploadObjectOutput(putObjectOutput: putObjectOutput)
            }

            // Otherwise, use MPU.
            // Determine part size. Division by 10,000 is bc MPU supports 10,000 parts maximum.
            let partSize = max(config.targetPartSizeBytes, payloadSize/10000)
            // Determine the number of parts. Add 1 if there should be a last part, smaller than partSize.
            let numParts = (payloadSize / partSize) + (payloadSize % partSize == 0 ? 0 : 1)

            // Create MPU input & create MPU.
            let createMPUInput = input.getCreateMultipartUploadInput()
            let createMPUOutput = try await s3.createMultipartUpload(input: createMPUInput)
            // Get upload ID from create MPU output; this is used throughout the MPU process.
            guard let uploadID = createMPUOutput.uploadId else {
                throw S3TMUploadObjectError.FailedToCreateMPU
            }

            logger.debug("Successfully created MPU with the uploadID \"\(uploadID)\".")

            // Concurrently upload all the parts using a throwing task group.
            // If an error is thrown at any point within the do-block, MPU is aborted in catch.
            do { // MPU do block.
                let completedParts = try await withThrowingTaskGroup(
                    // Each child task returns a completed part. It contains S3's checksum & part number.
                    of: (S3ClientTypes.CompletedPart).self,
                    // Then, the task group returns completed parts, sorted by the part number for correct ordering.
                    // This array of completed parts are required to call complete MPU.
                    returning: [S3ClientTypes.CompletedPart].self
                ) { group in
                    // Return value of task group, initially empty.
                    var results: [S3ClientTypes.CompletedPart] = []

                    // Create and add upload part child tasks to the task group.
                    for partNumber in 1...numParts {
                        // Check for cancellation before adding child task.
                        // If it were cancelled, CancellationError is thrown, caught by catch, and MPU is aborted.
                        try Task.checkCancellation()
                        group.addTask {
                            // Get the offset to start of the new part.
                            let partOffset = (partNumber - 1) * partSize
                            // Either take full part size or remainder of payload for the last part.
                            let chunkSize = min(partSize, payloadSize - partOffset + 1)
                            // Read part.
                            var partData: Data?
                            if case .data(let data) = input.putObjectInput.body {
                                partData = data?[partOffset..<(partOffset + chunkSize)]
                            } else if case .stream(let stream) = input.putObjectInput.body {
                                partData = try stream.read(upToCount: Int(chunkSize))
                            }
                            // Throw error if couldn't read part.
                            guard let resolvedPartData = partData else {
                                throw S3TMUploadObjectError.FailedToReadPart
                            }
                            // Construct upload part input.
                            let uploadPartInput = input.getUploadPartInput(
                                body: ByteStream.data(resolvedPartData),
                                partNumber: partNumber,
                                uploadID: uploadID
                            )

                            // Check for cancellation before calling uploadPart.
                            try Task.checkCancellation()
                            // Call & return result of UploadPart in `S3ClientTypes.CompletedPart` format.
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
                    } // End upload part child task for-loop.

                    // Collect the results of upload part child tasks.
                    for try await result in group {
                        guard let partNumber = result.partNumber else {
                            throw S3TMUploadObjectError.UploadPartOutputIsMissingPartNumber
                        }
                        logger.debug(
                            "Successfully uploaded part #\(partNumber) for MPU with uploadID \"\(uploadID)\"."
                        )
                        results.append(result)
                    }
                    // Sort completed parts by their partNumber.
                    results.sort { return $0.partNumber! < $1.partNumber! }
                    return results
                } // End throwing task group.

                // Check for cancellation before calling completeMPU.
                try Task.checkCancellation()
                // Complete the MPU.
                let completeMPUInput = input.getCompleteMultipartUploadInput(
                    multipartUpload: S3ClientTypes.CompletedMultipartUpload(parts: completedParts),
                    uploadID: uploadID,
                    mpuObjectSize: String(payloadSize)
                )
                let completeMPUOutput = try await s3.completeMultipartUpload(input: completeMPUInput)
                logger.debug("Successfully uploaded the object using MPU with the uploadID \"\(uploadID)\".")
                return UploadObjectOutput(completeMultipartUploadOutput: completeMPUOutput)
            } catch let originalError { // MPU catch block.
                // Catch block is reached when: task was cancelled by the user, an uploadPart failed,
                //   the complete MPU failed, or reading the part data failed.
                // First, abort the MPU operation. Then, bubble up the original error back to the caller.
                do {
                    _ = try await s3.abortMultipartUpload(
                        input: input.getAbortMultipartUploadInput(uploadID: uploadID)
                    )
                    logger.debug("Successfully aborted MPU with the uploadID \"\(uploadID)\".")
                } catch let abortError {
                    logger.debug("Failed to abort MPU with the uploadID \"\(uploadID)\".")
                    // If failed to abort, bubble up both the original error & the abort error.
                    throw S3TMUploadObjectError.FailedToAbortMPU(
                        errorFromMPUOperation: originalError,
                        errorFromFailedAbortMPUOperation: abortError
                    )
                }
                throw originalError
            } // End do-catch MPU block.
        } // End root Task block.
    } // End uploadObject.

    /// Downloads a single object to S3.
    ///
    /// Returns a `Task` immediately after function call; download is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `DownloadObjectInput`, a synthetic input type specific to this operation of the AWS S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<DownloadObjectOutput, Error>` that can be waited on or cancelled as needed.
    public func downloadObject(input: DownloadObjectInput) throws -> Task<DownloadObjectOutput, Error> {
        return Task {
            // Get the S3Client to use for the download.
            let s3 = config.s3Client

            /*
             Note:
                The logic below is handled in 5 separate but exhaustive if-blocks rather than using
                nested if-else blocks for readability.
             */

            // Case 0: partNumber is provided by user.
            // If the provided input has partNumber, that means user wants that single, specific part.
            // Do a single getObject and return output.
            if let partNumber = input.getObjectInput.partNumber {
                logger.debug("Fetching specific part, using provided part number: \(partNumber).")
                return try await DownloadObjectOutput(
                    getObjectOutput: performSingleGetObject(s3, input.getObjectInput, input.outputStream)
                )
            }

            // Case 1: Config is part GET & but user provided range only.
            if let range = input.getObjectInput.range, config.multipartDownloadType == .part {
                // User provided a specific range; we can't do part GET download using range;
                //  so just do a single get instead.
                logger.debug("Fetching specific range, using provided range: \(range).")
                return try await DownloadObjectOutput(
                    getObjectOutput: performSingleGetObject(s3, input.getObjectInput, input.outputStream)
                )
            }

            // Case 2: Config is part GET & user did not provide range nor partNumber.
            if (config.multipartDownloadType == .part && input.getObjectInput.range == nil) {
                // We start with a single part get, and base the number of subsequent calls on that first
                //  GetObjectOutput's partsCount field. Send the first GetObject with partNumber set to 1.
                let firstGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(partNumber: 1)
                let firstGetObjectOutput = try await performSingleGetObject(
                    s3, firstGetObjectInput, input.outputStream
                )
                logger.debug("Fetched first part.")

                // If GetObjectOutput.partsCount is nil or 1, return output.
                guard let partsCount = firstGetObjectOutput.partsCount, partsCount > 1 else {
                    return DownloadObjectOutput(getObjectOutput: firstGetObjectOutput)
                }

                // Otherwise, proceed to retrieving the entire object.
                logger.debug("Total parts count is \(partsCount). Making more part GET calls...")

                // Fetch response ByteStreams for all range GETs using throwing task group.
                let byteStreams = try await withThrowingTaskGroup(
                    // Each child task returns a tuple of partNumber mapped to corresponding the ByteStream.
                    of: (Int, ByteStream).self,
                    // Then, TaskGroup sorts the ByteStreams by part number and returns them in sorted order.
                    returning: [ByteStream].self
                ) { group in
                    // Return value of task group.
                    var results: [(Int, ByteStream)] = []

                    for partNumber in 2...partsCount {
                        // Check cancellation before adding part GET child task.
                        try Task.checkCancellation()
                        group.addTask {
                            let partGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(
                                partNumber: partNumber
                            )
                            let partGetObjectOutput = try await s3.getObject(input: partGetObjectInput)
                            return (partNumber, partGetObjectOutput.body!)
                        }
                    }

                    // Collect results of child tasks.
                    for try await result in group {
                        logger.debug("Successfully fetched part #\(result.0).")
                        results.append(result)
                    }
                    // Sort downloaded parts by their part number.
                    results.sort { return $0.0 < $1.0 }
                    // Return only the ByteStreams, now in sorted order by their part number.
                    return results.map { $0.1 }
                }

                // Read each response byte stream and write to the destination output stream.
                for byteStream in byteStreams {
                    guard let data = try await byteStream.readData() else {
                        throw S3TMDownloadObjectError.FailedToReadResponseBody
                    }
                    try writeToOutputStream(
                        data: data,
                        outputStream: input.outputStream
                    )
                }

                // Return the first GetObject call's output wrapped in DownloadObjectOutput.
                // This aligns with S3 multipart download behavior in both Java & CRT.
                return DownloadObjectOutput(getObjectOutput: firstGetObjectOutput)
            }

            // Case 3: Config is range GET & user provided range.
            if let range = input.getObjectInput.range, config.multipartDownloadType == .range {
                // Treat provided range as a whole object & calculate range (part size) for each range GET.
                // Call concurrent range GETs to retrieve object if needed.
                let (start, end) = try parseBytesRange(str: range)

                // Case 3A: Provided range is in "bytes=<start>-<end>" format.
                if let end {
                    // + 1 is needed because HTTP range's end is inclusive. E.g., 0-99 is 100 bytes in length.
                    let objectSize = end - start + 1

                    // Call single GetObject and return if objectSize is at or below minimum part size.
                    if objectSize <= config.targetPartSizeBytes {
                        return try await DownloadObjectOutput(
                            getObjectOutput: performSingleGetObject(s3, input.getObjectInput, input.outputStream)
                        )
                    }

                    // Otherwise, proceed with concurrent range GETs.
                    // Get number of requests needed to get the entire object.
                    var numRequests = (objectSize / config.targetPartSizeBytes)
                    numRequests += objectSize % config.targetPartSizeBytes == 0 ? 0 : 1

                    let getObjectOutputs = try await withThrowingTaskGroup(
                        // Each child task returns a tuple of request number & GetObjectOutput.
                        of: (Int, GetObjectOutput).self,
                        // Then, the task group returns GetObjectOutputs sorted by request number.
                        returning: [GetObjectOutput].self
                    ) { group in
                        // Return value of the task group.
                        var results: [(Int, GetObjectOutput)] = []
                        // Add range GET child tasks for each request number.
                        for numRequest in 0..<numRequests {
                            // Resolve the range of partial range GET.
                            let subRangeStart = start + numRequest * config.targetPartSizeBytes
                            let rangeGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(
                                range: "bytes=\(subRangeStart)-\(subRangeStart + config.targetPartSizeBytes - 1)"
                            )
                            // Check cancellation before calling range GET.
                            try Task.checkCancellation()
                            group.addTask {
                                // Call range GET and return result with request number.
                                let rangeGetObjectOutput = try await s3.getObject(input: rangeGetObjectInput)
                                return (numRequest, rangeGetObjectOutput)
                            }
                        }
                        // Collect results of range GET child tasks.
                        for try await result in group {
                            results.append(result)
                        }
                        // Sort downloaded parts by their request number.
                        results.sort { return $0.0 < $1.0 }
                        // Return only GetObjectOutputs, now sorted by their request number.
                        return results.map { $0.1 }
                    }

                    // Read each byte stream and write to output stream in order.
                    for getObjectOutput in getObjectOutputs {
                        guard let data = try await getObjectOutput.body!.readData() else {
                            throw S3TMDownloadObjectError.FailedToReadResponseBody
                        }
                        try writeToOutputStream(
                            data: data,
                            outputStream: input.outputStream
                        )
                    }
                    // Return the first getObjectOutput by accessing first GetObjectOutput in the array.
                    return DownloadObjectOutput(getObjectOutput: getObjectOutputs[0])

                // Case 3B: Provided range is in "bytes=<start>-" format.
                } else {
                    // First, call getObject with end being start + targetPartSizeBytes - 1.
                    let firstRangeGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(
                        range: "bytes=\(start)-\(start + config.targetPartSizeBytes - 1)"
                    )
                    let firstRangeGetObjectOutput = try await performSingleGetObject(
                        s3, firstRangeGetObjectInput, input.outputStream
                    )
                    // Then, determine full object size from first output's Content-Range header.
                    guard let contentRange = firstRangeGetObjectOutput.contentRange else {
                        throw S3TMDownloadObjectError.FailedToDetermineObjectSize
                    }
                    let objectSize = try getSizeFromContentRangeString(str: contentRange) - start + 1

                    // Just return if objectSize is at or below minimum part size.
                    // That means we already got all data we need to get.
                    if (objectSize <= config.targetPartSizeBytes) {
                        guard let data = try await firstRangeGetObjectOutput.body?.readData() else {
                            throw S3TMDownloadObjectError.FailedToReadResponseBody
                        }
                        try writeToOutputStream(
                            data: data,
                            outputStream: input.outputStream
                        )
                        return DownloadObjectOutput(getObjectOutput: firstRangeGetObjectOutput)
                    }

                    // Otherwise, proceed with concurrent range GETs.
                    // Determine number of requests needed to get the entire object.
                    var numRequests = (objectSize / config.targetPartSizeBytes)
                    // Since we already fetched first ranged part, subtract 1 if there's no remainder.
                    numRequests -= objectSize % config.targetPartSizeBytes == 0 ? 1 : 0

                    let byteStreams = try await withThrowingTaskGroup(
                        // Each child task returns a tuple of request number mapped to corresponding the ByteStream.
                        of: (Int, ByteStream).self,
                        // Then, TaskGroup sorts the ByteStreams by request number and returns them in sorted order.
                        returning: [ByteStream].self
                    ) { group in
                        // Return value of task group.
                        var results: [(Int, ByteStream)] = []
                        for numRequest in 1...numRequests {
                            // Resolve the range of partial range GET.
                            let subRangeStart = start + numRequest * config.targetPartSizeBytes
                            let rangeGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(
                                range: "bytes=\(subRangeStart)-\(subRangeStart + config.targetPartSizeBytes - 1)"
                            )
                            // Check cancellation before calling range GET.
                            try Task.checkCancellation()
                            group.addTask {
                                // Call range GET and return result with request number.
                                let rangeGetObjectOutput = try await s3.getObject(input: rangeGetObjectInput)
                                return (numRequest, rangeGetObjectOutput.body!)
                            }
                        }
                        // Collect results of child tasks.
                        for try await result in group {
                            results.append(result)
                        }
                        // Sort downloaded parts by their request number.
                        results.sort { return $0.0 < $1.0 }
                        // Return only ByteStreams, now sorted by their request number.
                        return results.map { $0.1 }
                    }
                    // Read each byte stream and write to output stream in order.
                    for byteStream in byteStreams {
                        guard let data = try await byteStream.readData() else {
                            throw S3TMDownloadObjectError.FailedToReadResponseBody
                        }
                        try writeToOutputStream(
                            data: data,
                            outputStream: input.outputStream
                        )
                    }
                    // Return the first GetObject output.
                    return DownloadObjectOutput(getObjectOutput: firstRangeGetObjectOutput)
                }
            }

            // Case 4: Config is range GET & user did not provide range.
            if (config.multipartDownloadType == .range && input.getObjectInput.range == nil) {
                // User set config to .range, but didn't provide range.
                // We start with a single range get, and base the number of calls to make from Content-Range response header.
                // Set range to config's part size.
                let firstRangeGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(
                    range: "bytes=0-\(config.targetPartSizeBytes - 1)"
                )
                // Send the first request
                let firstRangeGetObjectOutput = try await performSingleGetObject(
                    s3, firstRangeGetObjectInput, input.outputStream
                )
                // Then, determine object size from first output's Content-Range header.
                guard let contentRange = firstRangeGetObjectOutput.contentRange else {
                    throw S3TMDownloadObjectError.FailedToDetermineObjectSize
                }
                let objectSize = try getSizeFromContentRangeString(str: contentRange)

                // Just return if objectSize is at or below minimum part size.
                // That means we already got all data we need to get.
                if (objectSize <= config.targetPartSizeBytes) {
                    guard let data = try await firstRangeGetObjectOutput.body?.readData() else {
                        throw S3TMDownloadObjectError.FailedToReadResponseBody
                    }
                    try writeToOutputStream(
                        data: data,
                        outputStream: input.outputStream
                    )
                    return DownloadObjectOutput(getObjectOutput: firstRangeGetObjectOutput)
                }

                // Otherwise, proceed with concurrent range GETs.
                // Determine number of requests needed to get the entire object.
                var numRequests = (objectSize / config.targetPartSizeBytes)
                // Since we already fetched first ranged part, subtract 1 if there's no remainder.
                numRequests -= objectSize % config.targetPartSizeBytes == 0 ? 1 : 0
                let byteStreams = try await withThrowingTaskGroup(
                    // Each child task returns a tuple of request number mapped to corresponding the ByteStream.
                    of: (Int, ByteStream).self,
                    // Then, TaskGroup sorts the ByteStreams by request number and returns them in sorted order.
                    returning: [ByteStream].self
                ) { group in
                    // Return value of task group.
                    var results: [(Int, ByteStream)] = []
                    for numRequest in 0..<numRequests {
                        // Resolve the range of partial range GET.
                        let subRangeStart = numRequest * config.targetPartSizeBytes
                        let rangeGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(
                            range: "bytes=\(subRangeStart)-\(subRangeStart + config.targetPartSizeBytes - 1)"
                        )
                        // Check cancellation before calling range GET.
                        try Task.checkCancellation()
                        group.addTask {
                            let rangeGetObjectOutput = try await s3.getObject(input: rangeGetObjectInput)
                            return (numRequest, rangeGetObjectOutput.body!)
                        }
                    }
                    // Collect results of child tasks.
                    for try await result in group {
                        results.append(result)
                    }
                    // Sort downloaded parts by their request number.
                    results.sort { return $0.0 < $1.0 }
                    // Return only ByteStreams, now sorted by their request number.
                    return results.map { $0.1 }
                }
                // Read each byte stream and write to output stream in order.
                for byteStream in byteStreams {
                    guard let data = try await byteStream.readData() else {
                        throw S3TMDownloadObjectError.FailedToReadResponseBody
                    }
                    try writeToOutputStream(
                        data: data,
                        outputStream: input.outputStream
                    )
                }

                // Return the first GetObject output.
                return DownloadObjectOutput(getObjectOutput: firstRangeGetObjectOutput)
            }

            // Cases 0 to 4 above covers all possible cases.
            // Unreachable statement; added to quiet compiler.
            throw S3TMDownloadObjectError.UnreachableStatementWasReached
        } // End root Task block.
    }

    // Helper function that writes given data to given outputstream.
    private func writeToOutputStream(data: Data, outputStream: OutputStream) throws {
        try data.withUnsafeBytes { buffer in
            if let baseAddress = buffer.baseAddress?.assumingMemoryBound(to: UInt8.self) {
                // Write data to the outputstream.
                let bytesWritten = outputStream.write(baseAddress, maxLength: buffer.count)
                if bytesWritten < 0 {
                    throw S3TMDownloadObjectError.FailedToWriteToOutputStream
                }
            }
        }
    }

    // Helper function that performs a single GetObject call & writes fethced data
    //  to user-provided output stream in the input.
    // Returns the `GetObjectOutput` from the call.
    private func performSingleGetObject(
        _ s3: S3Client,
        _ getObjectInput: GetObjectInput,
        _ outputStream: OutputStream
    ) async throws -> GetObjectOutput {
        let getObjectOutput = try await s3.getObject(input: getObjectInput)
        // Write returned data to user-provided output stream & return.
        guard let outputData = try await getObjectOutput.body?.readData() else {
            throw S3TMDownloadObjectError.FailedToReadResponseBody
        }
        try writeToOutputStream(data: outputData, outputStream: outputStream)
        return getObjectOutput
    }

    // Helper function that parses range string in input struct.
    // Supported formats are "bytes=<start>-" and "bytes=<start>-<end>".
    private func parseBytesRange(str: String) throws -> (start: Int, end: Int?) {
        guard str.hasPrefix("bytes=") else {
            throw S3TMDownloadObjectError.InvalidRangeFormat("Range must begin with \"bytes=\".")
        }
        let noPrefix = str.replacingOccurrences(of: "bytes=", with: "")
        guard !noPrefix.hasPrefix("-") else {
            throw S3TMDownloadObjectError.InvalidRangeFormat("Suffix range is not supported at the moment.")
        }
        let parts = noPrefix.split(separator: "-")
        guard let start = Int(parts[0]) else {
            throw S3TMDownloadObjectError.InvalidRangeFormat("Range start couldn't be parsed to Int!")
        }
        if (parts.count == 1) { // bytes=<start>-
            return (start, nil)
        } else if (parts.count == 2) { // bytes=<start>-<end>
            guard let end = Int(parts[1]) else {
                throw S3TMDownloadObjectError.InvalidRangeFormat("Range end couldn't be parsed to Int!")
            }
            return (start, end)
        } else { // multi-range value; not supported by S3.
            throw S3TMDownloadObjectError.InvalidRangeFormat(
                "Multi-range value in Range header is not supported by S3."
            )
        }
    }

    // Helper function that returns the object size from Content-Range response header.
    private func getSizeFromContentRangeString(str: String) throws -> Int {
        let parts = str.split(separator: "/")
        guard parts.last != "*" else {
            throw S3TMDownloadObjectError.FailedToDetermineObjectSize
        }
        guard let sizeStr = parts.last, let size = Int(sizeStr) else {
            throw S3TMDownloadObjectError.FailedToDetermineObjectSize
        }
        return size
    }

    /// Uploads a local directory to S3.
    ///
    /// Returns a `Task` immediately after function call; upload is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `UploadDirectoryInput`, a synthetic input type specific to this operation of the AWS S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<UploadDirectoryOutput, Error>` that can be waited on or cancelled as needed.
    public func uploadDirectory(input: UploadDirectoryInput) throws -> Task<UploadDirectoryOutput, Error> {
        return Task {
            var visitedCanonicalPaths = Set<String>() // Used to prevent infinite loop from symlinks.

            // Get the list of files, symlinks, directories _directly nested_ under the source directory URL from user.
            var nestedURLs = try getNestedURLs(in: input.source)

            // Array of child tasks; each task will call S3TM::UploadObject for a single file.
            var tasks: [Task<Void, Error>] = []

            // Use BFS to iterate through each URL fetched from source URL & process them.
            while !nestedURLs.isEmpty {
                var url = nestedURLs.removeFirst()
                // URL properties of current URL.
                let resourceValues = try url.resourceValues(
                    forKeys: [.isSymbolicLinkKey, .isDirectoryKey, .canonicalPathKey]
                )

                // If current URL is symlink ...
                let isSymlink = resourceValues.isSymbolicLink ?? false
                if isSymlink {
                    // ... and we should follow it, resolve it to file or directory URL.
                    if input.followSymbolicLinks {
                        url = url.resolvingSymlinksInPath()
                    } else {
                        // ... and we shouldn't follow it, skip this URL.
                        continue
                    }
                }

                // Prevent loops using the canonical path; skip processing if it's a duplicate.
                guard let canonicalPath = resourceValues.canonicalPath else {
                    throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: url)
                }
                if visitedCanonicalPaths.contains(canonicalPath) {
                    logger.debug("Detected loop at \(canonicalPath), skipping.")
                    continue
                }
                // Append current URL's canonical path to visited log.
                visitedCanonicalPaths.insert(canonicalPath)

                let isDir = resourceValues.isDirectory ?? false
                if isDir {
                    // Add subdirectory contents into BFS queue only if the corresponding flag is set to true.
                    if input.recursive {
                        nestedURLs.append(contentsOf: try getNestedURLs(in: url))
                    }
                } else { // URL is a regular file URL.
                    // Check for cancellation before adding UploadObject child task.
                    try Task.checkCancellation()
                    // Append task that calls S3TM::UploadObject on the current file URL.
                    tasks.append(
                        Task {
                            // Resolve the key for the file, using s3Prefix, s3Delimiter, and relative path.
                            let resolvedObjectKey = try getResolvedObjectKey(
                                of: url,
                                inDir: input.source,
                                input: input
                            )
                            // Log message if failed to create fileHandle from file URL & skip upload.
                            var fileHandle: FileHandle
                            do {
                                fileHandle = try FileHandle.init(forReadingFrom: url)
                            } catch {
                                logger.debug("Could not read from URL: \(url.absoluteString)")
                                return
                            }
                            // Use input.putObjectRequestCallback to allow input customization.
                            let uploadObjectInput = UploadObjectInput(
                                putObjectInput: input.putObjectRequestCallback(PutObjectInput(
                                    body: .stream(FileStream(fileHandle: fileHandle)),
                                    bucket: input.bucket,
                                    checksumAlgorithm: config.checksumAlgorithm,
                                    key: resolvedObjectKey
                                ))
                            )
                            do {
                                // This is where an object actually gets uploaded.
                                _ = try uploadObject(input: uploadObjectInput)
                            } catch {
                                // Throw error with UploadObjectInput & original error.
                                // Allows custom failure policy to retry the request if desired.
                                throw S3TMUploadDirectoryError.FailedToUploadObject(
                                    originalErrorFromUploadObject: error,
                                    failedUploadObjectInput: uploadObjectInput
                                )
                            }
                        } // End child task.
                    )
                }
            } // End BFS while loop block.

            // By this point in code, `tasks` contains a child task for each file upload.
            var successfulUploadCount = 0, failedUploadCount = 0
            for task in tasks {
                do {
                    // Calling .value on the child task waits for the UploadObject grandchild task as well.
                    try await task.value
                    successfulUploadCount += 1
                } catch {
                    failedUploadCount += 1
                    do {
                        // Call failure policy to handle UploadObject failure.
                        try await input.failurePolicy(error, input)
                    } catch { // input.failurePolicy threw an error; cancel all tasks & bubble up error.
                        tasks.forEach { $0.cancel() }
                        throw error
                    }
                }
            }

            // Return output with counters.
            return UploadDirectoryOutput(objectsUploaded: successfulUploadCount, objectsFailed: failedUploadCount)
        } // End root Task block.
    }

    // Helper function to get file / directoy / symlink URLs nested directly under a directory URL.
    private func getNestedURLs(in directory: URL) throws -> [URL] {
        return try FileManager.default.contentsOfDirectory(
            at: directory,
            includingPropertiesForKeys: [.isSymbolicLinkKey, .isDirectoryKey, .canonicalPathKey]
        )
    }

    // Helper function to resolve S3 object key to use for upload.
    private func getResolvedObjectKey(of file: URL, inDir dir: URL, input: UploadDirectoryInput) throws -> String {
        // Step 1: if a non-default s3Delimter is used, throw validation exception if the file name contains s3Delimiter.
        if (input.s3Delimiter != defaultPathSeparator()) {
            guard !file.lastPathComponent.contains(input.s3Delimiter) else {
                throw S3TMUploadDirectoryError.InvalidFileName(
                    "The file \"\(file.absoluteString)\" has S3 delimiter \"\(input.s3Delimiter)\" in its name!"
                )
            }
        }
        // Step 2: append s3Delimiter to s3Prefix if it does not already end with it.
        var prefix = input.s3Prefix ?? input.s3Delimiter
        if !prefix.hasSuffix(input.s3Delimiter) {
            prefix = prefix + input.s3Delimiter
        }
        // Step 3: retrieve the relative path of the local file.
            // Get canonical path of file URL & dir URL; remove canonical path of dir URL from file URL to get relative path.
        let dirCanonicalPath = try dir.resourceValues(forKeys: [.canonicalPathKey]).canonicalPath
        var fileCanonicalPath = try file.resourceValues(forKeys: [.canonicalPathKey]).canonicalPath
        guard let dirCanonicalPath else {
            throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: dir)
        }
        guard let fileCanonicalPath else {
            throw S3TMUploadDirectoryError.FailedToGetCanonicalPathForURL(url: file)
        }
        var relativePath = fileCanonicalPath.removePrefix(dirCanonicalPath)
        // Step 4: if the system default file separator is different from the s3Delimiter, replace it with the s3Delimiter in the relative path from step 3.
        if (input.s3Delimiter != defaultPathSeparator()) {
            relativePath = relativePath.replacingOccurrences(of: defaultPathSeparator(), with: input.s3Delimiter)
        }
        // Step 5: prefix s3Prefix to the string from Step 3.
        return prefix + relativePath
    }

    // Helper function that just returns system default path separator for Mac / Linux.
    private func defaultPathSeparator() -> String {
        return "/" // Default path separator for all apple platforms & Linux distros.
    }

    /// Downloads S3 bucket to a local directory.
    ///
    /// Returns a `Task` immediately after function call; download is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `DownloadBucketInput`, a synthetic input type specific to this operation of the AWS S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<DownloadBucketOutput, Error>` that can be waited on or cancelled as needed.
    public func downloadBucket(input: DownloadBucketInput) throws -> Task<DownloadBucketOutput, Error> {
        return Task {
            // S3 client used for the operation.
            let s3 = config.s3Client

            // Set-up to ensure that we have a valid destination directory.
            if FileManager.default.fileExists(atPath: input.destination.path) {
                guard try input.destination.resourceValues(forKeys: [.isDirectoryKey]).isDirectory ?? false else {
                    throw S3TMDownloadBucketError.ProvidedDestinationIsNotADirectory
                }
            } else {
                // Create the destination directory if not present.
                do {
                    try FileManager.default.createDirectory(at: input.destination, withIntermediateDirectories: true)
                } catch {
                    throw S3TMDownloadBucketError.FailedToCreateDestinationDirectory
                }
            }

            // Counters that get returned at the end upon operation completion.
            var successfulDownloadCount = 0, failedDownloadCount = 0

            // The ListObjectsV2 calls must be made serially due to the nature of its continuation token.
            // The repeat-while loop below fetches all object keys with provided prefix (if nil, every object in bucket),
            //      resolves the destination URL for each object key, and creates the files at the resolved URLs.
            var nextContinuationToken: String? = nil
            repeat {
                let listObjectsV2Output = try await s3.listObjectsV2(
                    // Prefix must use user-provided prefix & delimiter must be null.
                    // This gets all objects with given prefix as a flat list of key-value pairs.
                    input: ListObjectsV2Input(
                        bucket: input.bucket,
                        continuationToken: nextContinuationToken,
                        prefix: input.s3Prefix
                    )
                )
                // Save new next continuation token; if nil, ListObjectsV2 won't be called anymore.
                nextContinuationToken = listObjectsV2Output.nextContinuationToken
                // Fetch objects from ListObjectsV2Output.
                guard let contents = listObjectsV2Output.contents else {
                    throw S3TMDownloadBucketError.FailedToRetrieveObjectsUsingListObjectsV2
                }

                // For each fetched object, resolve the destination URL, create file, & save the mapping.
                var objectKeyToURLMapping: [String: URL] = [:]
                for object in contents {
                    let originalKey = object.key!
                    // USe user-provided filter to skip objects.
                    // If key ends with "/" it's a 0-byte file used by S3 to simulate directory structure; skip that too.
                    if input.filter(object) || originalKey.hasSuffix("/") {
                       continue
                    }

                    // Remove prefix from object key value
                    let keyWithoutPrefix = originalKey.removePrefix(input.s3Prefix ?? "")

                    // Replace instances of input.s3Delimiter in keyWithoutPrefix with Mac/Linux system default
                    //      path separtor "/" if input.s3Delimiter isn't "/".
                    let keyWithSystemPathSeparator = input.s3Delimiter == defaultPathSeparator() ? keyWithoutPrefix : keyWithoutPrefix.replacingOccurrences(of: input.s3Delimiter, with: defaultPathSeparator())

                    // If key escapes to parent directory, skip the object.
                    if (filePathIsInsideDirectory(directoryURL: input.destination, filePath: keyWithoutPrefix)) {
                        continue
                    }

                    // Create destination URL for the object.
                    let destinationURL = input.destination.appendingPathComponent(keyWithSystemPathSeparator)
                    let destinationPath = destinationURL.absoluteString.replacingOccurrences(
                        of: "file://", with: ""
                    )

                    // Check if a file already exists at destinationURL
                    if FileManager.default.fileExists(atPath: destinationPath) {
                        // Skip this object if there's duplicate.
                        logger.debug("Skipping object with key \(originalKey) that resolves to location previously processed.")
                        continue
                    } else {
                        try createFile(at: destinationURL)
                    }

                    // Save the resolved file URL mapping.
                    objectKeyToURLMapping[originalKey] = destinationURL
                }

                // List of concurrent tasks; each task is for a single downloadObject operation.
                var tasks: [Task<Void, Error>] = []

                // Iterate through dictionary. Concurrently call S3TM::DownloadObject on each.
                for pair in objectKeyToURLMapping {
                    try Task.checkCancellation()
                    // Add task for downloading object
                    tasks.append(
                        Task {
                            guard let outputStream = OutputStream(url: pair.value, append: false) else {
                                throw S3TMDownloadBucketError.FailedToCreateOutputStreamForFileURL(url: pair.value)
                            }
                            let downloadObjectInput = DownloadObjectInput(
                                outputStream: outputStream,
                                getObjectInput: GetObjectInput(
                                    bucket: input.bucket,
                                    // User must've set s3Client.config.responseChecksumValidation to false as well
                                    //  to disable response checksum validation.
                                    checksumMode: config.checksumValidationEnabled ? .enabled : .sdkUnknown("DISABLED"),
                                    key: pair.key
                                )
                            )
                            do {
                                // This is where an object is actually downloaded.
                                _ = try downloadObject(input: downloadObjectInput)
                            } catch {
                                throw S3TMDownloadBucketError.FailedToDownloadObject(
                                    originalErrorFromDownloadObject: error,
                                    failedDownloadObjectInput: downloadObjectInput
                                )
                            }
                        }
                    )
                }

                // Iterate through each child task; handle failures based on failure policy.
                for task in tasks {
                    do {
                        // Calling .value on child task waits for DownloadObject grandchild task as well.
                        try await task.value
                        successfulDownloadCount += 1
                    } catch {
                        failedDownloadCount += 1
                        do {
                            // Call failure policy to handle DownloadObject failure.
                            try await input.failurePolicy(error, input)
                        } catch { // input.failurePolicy threw an error; cancel all tasks & rethrow error back up.
                            tasks.forEach { $0.cancel() }
                            throw error
                        }
                    }
                }
            } while nextContinuationToken != nil // Repeat processing object keys until there's no more objects.

            // Return output with counters.
            return DownloadBucketOutput(objectsDownloaded: successfulDownloadCount, objectsFailed: failedDownloadCount)
        }
    }

    // Helper function that returns true iff provided file path is contained with provided directory URL.
    private func filePathIsInsideDirectory(directoryURL: URL, filePath: String) -> Bool {
        // Get the file URL by appending the path to the directory URL
        let fileURL = directoryURL.appendingPathComponent(filePath)

        // Resolve the standardized paths for the directory and file
        let standardizedDirectoryPath = directoryURL.standardizedFileURL.path
        let standardizedFilePath = fileURL.standardizedFileURL.path

        // Check if the standardized file path starts with the standardized directory path
        return standardizedFilePath.hasPrefix(standardizedDirectoryPath)
    }

    // Helper function for creating a file at the given URL; creates directories as needed along the way.
    private func createFile(at url: URL) throws {
        let fileManager = FileManager.default

        // Get the directory path by deleting the last path component (the file name)
        let directoryURL = url.deletingLastPathComponent()

        // Create the directory (and all intermediate directories, if necessary)
        do {
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        } catch {
            throw S3TMDownloadBucketError.FailedToCreateNestedDestinationDirectory(at: directoryURL)
        }

        // Create the file at the specified location
        fileManager.createFile(atPath: url.path, contents: nil)
    }
}

/// A non-exhausive list of errors that can be thrown by the UploadObject operation of AWS S3 Transfer Manager.
public enum S3TMUploadObjectError: Error {
    case StreamPayloadOfUnknownLength
    case FailedToCreateMPU
    case FailedToReadPart
    case FailedToAbortMPU(errorFromMPUOperation: Error, errorFromFailedAbortMPUOperation: Error)
    case UploadPartOutputIsMissingPartNumber
}

/// A non-exhausive list of errors that can be thrown by the DownloadObject operation of AWS S3 Transfer Manager.
public enum S3TMDownloadObjectError: Error {
    case FailedToReadResponseBody
    case FailedToDetermineObjectSize
    case UnreachableStatementWasReached
    case FailedToWriteToOutputStream
    case InvalidRangeFormat(String)
}

/// A non-exhausive list of errors that can be thrown by the UploadDirectory operation of AWS S3 Transfer Manager.
public enum S3TMUploadDirectoryError: Error {
    case InvalidSourceURL(String)
    case FailedToGetCanonicalPathForURL(url: URL)
    case FailedToUploadObject(originalErrorFromUploadObject: Error, failedUploadObjectInput: UploadObjectInput)
    case InvalidFileName(String)
}

/// A non-exhausive list of errors that can be thrown by the DownloadBucket operation of AWS S3 Transfer Manager.
public enum S3TMDownloadBucketError: Error {
    case ProvidedDestinationIsNotADirectory
    case FailedToCreateDestinationDirectory
    case FailedToRetrieveObjectsUsingListObjectsV2
    case FailedToCreateOutputStreamForFileURL(url: URL)
    case FailedToDownloadObject(originalErrorFromDownloadObject: Error, failedDownloadObjectInput: DownloadObjectInput)
    case FailedToCreateNestedDestinationDirectory(at: URL)
}
