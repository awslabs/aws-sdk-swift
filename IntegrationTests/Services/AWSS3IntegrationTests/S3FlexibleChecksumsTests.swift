//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
@testable import ClientRuntime

final class S3FlexibleChecksumsTests: S3XCTestCase {

    private enum UploadType {
        case data(Data)
        case stream(URL)
    }

    private func testPutGetObject(withChecksumAlgorithm algorithm: S3ClientTypes.ChecksumAlgorithm, objectNameSuffix: String, uploadType: UploadType) async throws {
        let objectName = "test-\(objectNameSuffix)"
        let byteStream: ByteStream

        switch uploadType {
        case .data(let data):
            byteStream = ByteStream.data(data)
        case .stream(let url):
            let fileHandle = try XCTUnwrap(FileHandle(forReadingAtPath: url.relativePath))
            byteStream = ByteStream.stream(FileStream(fileHandle: fileHandle))
        }

        let input = PutObjectInput(
            body: byteStream,
            bucket: bucketName,
            checksumAlgorithm: algorithm,
            key: objectName
        )

        let response = try await client.putObject(input: input)
        let unwrappedResponse = try XCTUnwrap(response)

        // Verify the checksum response based on the algorithm used.
        XCTAssertNotNil(try XCTUnwrap(getChecksumResponse(from: unwrappedResponse, with: algorithm)))

        let getInput = GetObjectInput(bucket: bucketName, checksumMode: S3ClientTypes.ChecksumMode.enabled, key: objectName)
        let responseGet = try await client.getObject(input: getInput) // will error for normal payloads if checksum mismatch
        XCTAssertNotNil(responseGet.body) // Ensure there's a body in the response.

        // Additional step for stream: Validate stream and read data.
        if case .stream = uploadType {
            let streamingBody = try XCTUnwrap(responseGet.body)
            if case .stream(let stream) = streamingBody {
                XCTAssert(stream is ValidatingBufferedStream, "Expected ValidatingBufferedStream for streaming upload")
                let data = try await streamingBody.readData() // will error if checksum mismatch
                XCTAssertNotNil(data)
            } else {
                XCTFail("Did not receive a stream when expected for checksum validation!")
            }
        }
    }

    private func getChecksumResponse(from response: PutObjectOutput, with algorithm: S3ClientTypes.ChecksumAlgorithm) throws -> String? {
        switch algorithm {
        case .crc32:
            return response.checksumCRC32
        case .crc32c:
            return response.checksumCRC32C
        case .sha1:
            return response.checksumSHA1
        case .sha256:
            return response.checksumSHA256
        default:
            XCTFail("Unsupported checksum algorithm")
            return nil
        }
    }

    // Test cases for data uploads
    func test_putGetObject_data_crc32() async throws {
        try await testPutGetObject(withChecksumAlgorithm: .crc32, objectNameSuffix: "crc32-data", uploadType: .data(Data("Hello, world!".utf8)))
    }

    func test_putGetObject_data_crc32c() async throws {
        try await testPutGetObject(withChecksumAlgorithm: .crc32c, objectNameSuffix: "crc32c-data", uploadType: .data(Data("Hello, world!".utf8)))
    }

    func test_putGetObject_data_sha1() async throws {
        try await testPutGetObject(withChecksumAlgorithm: .sha1, objectNameSuffix: "sha1-data", uploadType: .data(Data("Hello, world!".utf8)))
    }

    func test_putGetObject_data_sha256() async throws {
        try await testPutGetObject(withChecksumAlgorithm: .sha256, objectNameSuffix: "sha256-data", uploadType: .data(Data("Hello, world!".utf8)))
    }

    // Test cases for streaming uploads
    func test_putGetObject_streaming_crc32() async throws {
        let streamingTestFile = Bundle.module.url(forResource: "put-object-test-1MB", withExtension: ".txt")!
        try await testPutGetObject(withChecksumAlgorithm: .crc32, objectNameSuffix: "crc32", uploadType: .stream(streamingTestFile))
    }

    func test_putGetObject_streaming_crc32c() async throws {
        let streamingTestFile = Bundle.module.url(forResource: "put-object-test-1MB", withExtension: ".txt")!
        try await testPutGetObject(withChecksumAlgorithm: .crc32c, objectNameSuffix: "crc32c", uploadType: .stream(streamingTestFile))
    }

    func test_putGetObject_streaming_sha1() async throws {
        let streamingTestFile = Bundle.module.url(forResource: "put-object-test-1MB", withExtension: ".txt")!
        try await testPutGetObject(withChecksumAlgorithm: .sha1, objectNameSuffix: "sha1", uploadType: .stream(streamingTestFile))
    }

    func test_putGetObject_streaming_sha256() async throws {
        let streamingTestFile = Bundle.module.url(forResource: "put-object-test-1MB", withExtension: ".txt")!
        try await testPutGetObject(withChecksumAlgorithm: .sha256, objectNameSuffix: "sha256", uploadType: .stream(streamingTestFile))
    }
}
