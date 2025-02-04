//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.OutputStream
import enum Smithy.ByteStream
import struct Foundation.Data

public extension S3TransferManager {
    /// Downloads a single object to S3.
    ///
    /// Returns a `Task` immediately after function call; download is handled in the background using asynchronous child tasks.
    /// If the `Task` returned by the function is cancelled, all child tasks are cancelled automatically.
    ///
    /// - Parameters:
    ///   - input: An instance of `DownloadObjectInput`, a synthetic input type specific to this operation of the S3 Transfer Manager.
    /// - Returns: An asynchronous `Task<DownloadObjectOutput, Error>` that can be waited on or cancelled as needed.
    func downloadObject(input: DownloadObjectInput) throws -> Task<DownloadObjectOutput, Error> {
        return Task {
            defer { input.outputStream.close() }

            let s3 = config.s3Client
            let partNumber = input.getObjectInput.partNumber

            // Case 0: Specific part number was given. Do a single part GET.
            if partNumber != nil {
                return try await DownloadObjectOutput(
                    getObjectOutput: performSingleGET(s3, input.getObjectInput, input.outputStream)
                )
            }

            let downloadType = config.multipartDownloadType
            let range = input.getObjectInput.range

            // Case 1: Config is part GET with range given. Fallback to single range GET.
            if range != nil && downloadType == .part {
                return try await DownloadObjectOutput(
                    getObjectOutput: performSingleGET(s3, input.getObjectInput, input.outputStream)
                )
            }

            // Case 2: Config is part GET with no range given. Do a multipart GET with MPU parts.
            if downloadType == .part && range == nil {
                return try await performMultipartGET(s3: s3, input: input)
            }

            // Case 3: Config is range GET with range given.
            if let range, downloadType == .range {
                let (start, end) = try parseBytesRange(str: range)
                if let end { // Case 3A: Provided range is in "bytes=<start>-<end>" format.

                    // End is inclusive so must add 1 to get size.
                    let objectSize = end - start + 1

                    // GET & return if one range GET is enough to get everything.
                    if objectSize <= config.targetPartSizeBytes {
                        return try await DownloadObjectOutput(
                            getObjectOutput: performSingleGET(s3, input.getObjectInput, input.outputStream)
                        )
                    }

                    // Otherwise, get the entire object (start - provided end) concurrently.
                    return try await performRangeGET(
                        startByte: start,
                        endByte: end,
                        knownObjectSize: objectSize,
                        s3: s3,
                        input: input
                    )
                } else { // Case 3B: Provided range is in "bytes=<start>-" format.
                    // Get the entire object (start - end of entire object) concurrently.
                    return try await performRangeGET(startByte: start, s3: s3, input: input)
                }
            }

            // Case 4: Config is range GET with no range given.
            if downloadType == .range && range == nil {
                // Get the entire object (0 - end of entire object) concurrently.
                return try await performRangeGET(startByte: 0, s3: s3, input: input)
            }

            // Cases 0 to 4 above covers all possible cases.
            // Unreachable statement; added to quiet compiler.
            throw S3TMDownloadObjectError.invalidDownloadConfiguration
        }
    }

    // Handles single GET for Case 0 and 1.
    internal func performSingleGET(
        _ s3: S3Client,
        _ getObjectInput: GetObjectInput,
        _ outputStream: OutputStream
    ) async throws -> GetObjectOutput {
        let getObjectOutput = try await s3.getObject(input: getObjectInput)
        // Write returned data to user-provided output stream & return.
        guard let outputData = try await getObjectOutput.body?.readData() else {
            throw S3TMDownloadObjectError.failedToReadResponseBody
        }
        try writeData(outputData, to: outputStream)
        return getObjectOutput
    }

    // Handles multipart GET for Case 2.
    internal func performMultipartGET(s3: S3Client, input: DownloadObjectInput) async throws -> DownloadObjectOutput {
        let firstGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(partNumber: 1)
        let firstGetObjectOutput = try await performSingleGET(s3, firstGetObjectInput, input.outputStream)

        // Return if there's no more parts.
        guard let partsCount = firstGetObjectOutput.partsCount, partsCount > 1 else {
            return DownloadObjectOutput(getObjectOutput: firstGetObjectOutput)
        }

        // Otherwise, fetch and download all remaining parts.
        let byteStreams = try await concurrentlyFetchPartGETByteStreams(s3: s3, input: input, partsCount: partsCount)
        try await writeByteStreams(byteStreams, to: input.outputStream)

        // Return the first GetObject call's output wrapped in DownloadObjectOutput.
        // This behavior aligns with S3 multipart download behavior in both Java & CRT.
        return DownloadObjectOutput(getObjectOutput: firstGetObjectOutput)
    }

    // Gets all parts of a S3 object starting at second part.
    internal func concurrentlyFetchPartGETByteStreams(s3: S3Client, input: DownloadObjectInput, partsCount: Int) async throws -> [ByteStream] {
        return try await withThrowingTaskGroup(
            // Each child task returns part number : stream tuple.
            of: (partNumber: Int, byteStream: ByteStream).self,
            // The task group returns streams sorted by the part number.
            returning: [ByteStream].self
        ) { group in
            var results: [(partNumber: Int, byteStream: ByteStream)] = []

            for partNumber in 2...partsCount {
                try Task.checkCancellation()
                group.addTask {
                    let partGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(partNumber: partNumber)
                    let partGetObjectOutput = try await s3.getObject(input: partGetObjectInput)
                    return (partNumber, partGetObjectOutput.body!)
                }
            }

            for try await childTaskResult in group {
                results.append(childTaskResult)
            }

            results.sort { $0.partNumber < $1.partNumber }
            return results.map { $0.byteStream }
        }
    }

    // Handles range GET for Case 3A, 3B, and 4.
    internal func performRangeGET(
        startByte: Int,
        endByte: Int? = nil, // Known only for "bytes=<start>-<end>".
        knownObjectSize: Int? = nil, // Known only for "bytes=<start>-<end>".
        s3: S3Client,
        input: DownloadObjectInput
    ) async throws -> DownloadObjectOutput {
        // End is inclusive, so must subtract 1 to get target amount.
        let firstRangeGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(range: "bytes=\(startByte)-\(startByte + config.targetPartSizeBytes - 1)")
        let firstRangeGetObjectOutput = try await performSingleGET(s3, firstRangeGetObjectInput, input.outputStream)

        let objectSize: Int
        if let knownObjectSize {
            // Use partial object size from <start>-<end> if present.
            objectSize = knownObjectSize
        } else {
            // Determine full object size from first output's Content-Range header.
            guard let contentRange = firstRangeGetObjectOutput.contentRange else {
                throw S3TMDownloadObjectError.failedToDetermineObjectSize
            }
            // This is the start-byte-adjusted object size we need to fetch.
            objectSize = try getSizeFromContentRangeString(str: contentRange) - startByte
        }

        // Return if one range GET was enough to get everything.
        if objectSize <= config.targetPartSizeBytes {
            return DownloadObjectOutput(getObjectOutput: firstRangeGetObjectOutput)
        }

        // Otherwise, fetch and download all remaining segments.
        let byteStreams = try await concurrentlyFetchRangeGETByteStreams(
            s3: s3,
            input: input,
            startByte: startByte,
            endByte: endByte,
            objectSize: objectSize
        )
        try await writeByteStreams(byteStreams, to: input.outputStream)

        // Return output of first range GET.
        return DownloadObjectOutput(getObjectOutput: firstRangeGetObjectOutput)
    }

    // Gets all segments of a S3 object starting at second subrange.
    internal func concurrentlyFetchRangeGETByteStreams(
        s3: S3Client,
        input: DownloadObjectInput,
        startByte: Int,
        endByte: Int? = nil, // Known only for "bytes=<start>-<end>".
        objectSize: Int
    ) async throws -> [ByteStream] {
        // Must subtract 1 if there was no remainder, since we already sent
        //  a "triage" request that doubled as getting the object size.
        let numRequests = (objectSize / config.targetPartSizeBytes) - (objectSize % config.targetPartSizeBytes == 0 ? 1 : 0)

        return try await withThrowingTaskGroup(
            // Each child task returns request number : stream tuple.
            of: (Int, ByteStream).self,
            // The task group returns streams sorted by the request number.
            returning: [ByteStream].self
        ) { group in
            var results: [(Int, ByteStream)] = []

            for numRequest in 0..<numRequests {
                let subRangeStart = startByte + (numRequest * config.targetPartSizeBytes)
                // End byte is inclusive, so must subtract 1 to get target amount.
                var subRangeEnd = subRangeStart + config.targetPartSizeBytes - 1
                // If it's the last request, we must use `end` if it's non-nil.
                // It's gauranteed to equal subRangeEnd, or be smaller than it.
                if let endByte, numRequest + 1 == numRequests {
                    subRangeEnd = endByte
                }
                let rangeGetObjectInput = input.copyGetObjectInputWithPartNumberOrRange(range: "bytes=\(subRangeStart)-\(subRangeEnd)")

                try Task.checkCancellation()
                group.addTask {
                    let rangeGetObjectOutput = try await s3.getObject(input: rangeGetObjectInput)
                    return (numRequest, rangeGetObjectOutput.body!)
                }
            }

            for try await result in group {
                results.append(result)
            }

            results.sort { $0.0 < $1.0 }
            return results.map { $0.1 }
        }
    }

    // Synchronously writes byte streams to output stream.
    internal func writeByteStreams(_ byteStreams: [ByteStream], to outputStream: OutputStream) async throws {
        for byteStream in byteStreams {
            guard let data = try await byteStream.readData() else {
                throw S3TMDownloadObjectError.failedToReadResponseBody
            }
            try writeData(data, to: outputStream)
        }
    }

    // Synchronously writes data to output stream.
    internal func writeData(_ data: Data, to outputStream: OutputStream) throws {
        if outputStream.streamStatus == .notOpen {
            outputStream.open()
        }
        var tempBuffer = [UInt8](repeating: 0, count: data.count)
        // Copy data to temporary buffer.
        data.copyBytes(to: &tempBuffer, count: data.count)
        // Write buffer to output stream.
        let bytesWritten = outputStream.write(&tempBuffer, maxLength: tempBuffer.count)
        if bytesWritten < 0 {
            throw S3TMDownloadObjectError.failedToWriteToOutputStream
        }
    }

    // Parses and returns start and end Range HTTP header value.
    // Supports <start>-<end> format and <start>- format.
    internal func parseBytesRange(str: String) throws -> (start: Int, end: Int?) {
        guard str.hasPrefix("bytes=") else {
            throw S3TMDownloadObjectError.invalidRangeFormat("Range must begin with \"bytes=\".")
        }

        let range = str.dropFirst(6)

        guard !range.hasPrefix("-") else {
            throw S3TMDownloadObjectError.invalidRangeFormat("Suffix range is not supported.")
        }

        let parts = range.split(separator: "-")

        guard parts.count <= 2 else {
            throw S3TMDownloadObjectError.invalidRangeFormat(
                "Multi-range value in Range header is not supported by S3."
            )
        }

        guard let start = Int(parts[0]) else {
            throw S3TMDownloadObjectError.invalidRangeFormat("Range start couldn't be parsed to Int!")
        }

        if parts.count == 1 { // bytes=<start>-
            return (start, nil)
        } else { // bytes=<start>-<end>
            guard let end = Int(parts[1]) else {
                throw S3TMDownloadObjectError.invalidRangeFormat("Range end couldn't be parsed to Int!")
            }
            return (start, end)
        }
    }

    // Parses and returns the size value of Content-Range HTTP header value.
    internal func getSizeFromContentRangeString(str: String) throws -> Int {
        let parts = str.split(separator: "/")
        guard let sizeStr = parts.last, let size = Int(sizeStr) else {
            throw S3TMDownloadObjectError.failedToDetermineObjectSize
        }
        return size
    }
}

/// A non-exhausive list of errors that can be thrown by the DownloadObject operation of S3 Transfer Manager.
public enum S3TMDownloadObjectError: Error {
    case failedToReadResponseBody
    case failedToDetermineObjectSize
    case invalidDownloadConfiguration
    case failedToWriteToOutputStream
    case invalidRangeFormat(String)
}
