//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSIntegrationTestUtils
import SmithyHTTPAPI
import Smithy
import SmithyStreams
import SmithyChecksums
import struct Foundation.URL
import struct Foundation.Data

// For data payload and streaming payload ineligible for chunked streaming, the checksum gets
//   calculated for the payload BEFORE entering the retry loop.
// So checksum for those 2 types of payloads get reused already.
// The test below checks whether checksum value gets correctly reused for chunked streaming payload.
// After first failure, file gets modified. Then, test asserts on checksum value between initial request
//   and the retried request are equivalent.
class S3FlexibleChecksumsReusageTests: XCTestCase {
    let region = "us-west-2"
    var client: S3Client!
    var originalData: Data!
    var tempFileURL: URL!

    override func setUp() async throws {
        try await super.setUp()
        // Fill one MB with random data & write it to a temporary file.
        originalData = generateRandomTextData(ofSizeInMB: 1)
        let tempDir = FileManager.default.temporaryDirectory
        let tempFileURL = tempDir.appendingPathComponent(UUID().uuidString)
        try originalData.write(to: tempFileURL)
        self.tempFileURL = tempFileURL

        // Create S3 client with mock HTTP client.
        let config = try await S3Client.S3ClientConfiguration(region: region)
        config.httpClientEngine = MockHTTPClientEngine(payloadFileURL: tempFileURL)
        client = S3Client(config: config)
    }

    override func tearDown() async throws {
        try await super.tearDown()
        // Delete the temporary file.
        if let tempFileURL = tempFileURL {
            try? FileManager.default.removeItem(at: tempFileURL)
        }
    }

    func test_chunkedFileStreamPayload_checksum_reusage() async throws {
        let putObjectInput = PutObjectInput(
            body: .stream(FileStream(fileHandle: try FileHandle(forReadingFrom: tempFileURL))),
            bucket: "dummy-bucket",
            key: "dummy-key"
        )
        _ = try await client.putObject(input: putObjectInput)
    }
}

private class MockHTTPClientEngine: HTTPClient {
    // The temporary payload file used for testing.
    let payloadFileURL: URL
    var requestNum = 0
    var initialRequestChecksum: String!

    public init(payloadFileURL: URL) {
        self.payloadFileURL = payloadFileURL
    }

    // Fail once then succeed.
    public func send(request: SmithyHTTPAPI.HTTPRequest) async throws -> HTTPResponse {
        return requestNum > 0
        ? try await successHTTPResponse(request: request)
        : try await failureHTTPResponse(request: request)
    }

    func successHTTPResponse(request: SmithyHTTPAPI.HTTPRequest) async throws -> HTTPResponse {
        // Assert that the value of checksum from initial request matches checksum in retried request
        //   despite the changes in payload file between the attempts.
        let retryRequestChecksum = try await extractChecksumValueFromFinalChunk(request: request)
        XCTAssertEqual(initialRequestChecksum, retryRequestChecksum)

        return HTTPResponse(
            headers: request.headers,
            body: ByteStream.data("".data(using: .utf8)),
            statusCode: .ok
        )
    }

    func failureHTTPResponse(request: SmithyHTTPAPI.HTTPRequest) async throws -> HTTPResponse {
        requestNum += 1
        // Save checksum value from first request.
        initialRequestChecksum = try await extractChecksumValueFromFinalChunk(request: request)
        // Modify payload file so that checksum value for the file changes if it were to get re-calculated
        //    in retry attempt.
        try modifyPayloadFile()

        let retriableErrorMessage = """
            <Error>
              <Code>RequestTimeout</Code>
              <Message>Your socket connection to the server was not read from or written to within the timeout period.</Message>
              <RequestId>9C87FEXAMPLE234B</RequestId>
              <HostId>WWoZlnK4pTjKCYn6eNV7GgOurabfqLkjbSyqTvDMGBaI9uwzyNhSaDhOCPs8paFGye7S6b/AB3A=</HostId>
            </Error>
        """
        return HTTPResponse(
            headers: request.headers,
            body: ByteStream.data(retriableErrorMessage.data(using: .utf8)),
            statusCode: .requestTimeout
        )
    }

    func modifyPayloadFile() throws {
        let fileHandle = try FileHandle(forWritingTo: payloadFileURL)
        defer { try? fileHandle.close() }
        fileHandle.seekToEndOfFile()
        if let data = "abc".data(using: .utf8) {
            fileHandle.write(data)
        } else {
            throw NSError(domain: "EncodingError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to encode string"])
        }
    }

    func extractChecksumValueFromFinalChunk(request: SmithyHTTPAPI.HTTPRequest) async throws -> String {
        let body = request.body
        guard case .stream(let stream) = body, stream.isEligibleForChunkedStreaming else {
            throw ByteStreamError.invalidStreamTypeForChunkedBody(
                "The stream is not eligible for chunked streaming or is not a stream type!"
            )
        }
        guard let chunkedStream = stream as? ChunkedStream else {
            throw ByteStreamError.streamDoesNotConformToChunkedStream(
                "Stream does not conform to ChunkedStream! Type is \(stream)."
            )
        }

        var hasMoreChunks = true
        while hasMoreChunks {
            hasMoreChunks = try await chunkedStream.chunkedReader.processNextChunk()
            let currentChunkBodyIsEmpty = chunkedStream.chunkedReader.getCurrentChunkBody().isEmpty
            if !hasMoreChunks || currentChunkBodyIsEmpty {
                let finalChunk = try await chunkedStream.chunkedReader.getFinalChunk()
                if let decodedFinalChunk = String(data: finalChunk, encoding: .utf8) {
                    return try parseChecksumValueFromFinalChunkString(finalChunk: decodedFinalChunk)
                } else {
                    throw S3FlexibleChecksumsReusageTestsError.failedToDecodeFinalChunk
                }
            } else {
                // no-op
            }
        }
        throw S3FlexibleChecksumsReusageTestsError.failedToDecodeFinalChunk
    }

    func parseChecksumValueFromFinalChunkString(finalChunk: String) throws -> String {
        let lines = finalChunk.components(separatedBy: .newlines)
        if let crcLine = lines.first(where: { $0.lowercased().hasPrefix("x-amz-checksum-crc32:") }) {
            let parts = crcLine.components(separatedBy: ":")
            if parts.count == 2 {
                return parts[1].trimmingCharacters(in: .whitespaces)
            }
        }
        throw S3FlexibleChecksumsReusageTestsError.failedToDecodeFinalChunk
    }
}

fileprivate enum S3FlexibleChecksumsReusageTestsError: Error {
    case failedToDecodeFinalChunk
}
