//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import Smithy
import SmithyStreams
import XCTest
@testable import AWSServiceExtensions

class UploadObjectTests: XCTestCase {
    // The shared transfer manager for tests.
    static var tm: S3TransferManager!

    // class method setUp() runs only once, rather than for every test.
    override class func setUp() {
        let expectation = XCTestExpectation(description: "S3 Transfer Manager setup complete")
        Task {
            do {
                tm = try await S3TransferManager()
                expectation.fulfill()
            } catch {
                XCTFail("Failed to set up S3 Transfer Manager: \(error)")
            }
        }
        _ = XCTWaiter().wait(for: [expectation], timeout: 5)
    }

    // MARK: - resolvePayloadSize tests

    func testResolvePayloadSizeWithDataBody() async throws {
        let body = ByteStream.data(Data("abcde".utf8))
        let resolvedPayloadSize = try await UploadObjectTests.tm.resolvePayloadSize(of: body)
        let expectedPayloadSize = 5
        XCTAssertEqual(resolvedPayloadSize, expectedPayloadSize)
    }

    func testResolvePayloadSizeWithKnownLengthStreamBody() async throws {
        let tempFileURL = try generateTempFile(sizeInMB: 1)
        let body = try ByteStream.stream(FileStream(fileHandle: FileHandle(forReadingFrom: tempFileURL)))
        let resolvedPayloadSize = try await UploadObjectTests.tm.resolvePayloadSize(of: body)
        let expectedPayloadSize = 1024 * 1024
        XCTAssertEqual(resolvedPayloadSize, expectedPayloadSize)
        try deleteTempFile(tempFileURL: tempFileURL)
    }

    func testResolvePayloadSizeWithUnknownLengthStreamBody() async throws {
        let body = ByteStream.stream(BufferedStream(data: Data("abcde".utf8)))
        do {
            _ = try await UploadObjectTests.tm.resolvePayloadSize(of: body)
            XCTFail("S3TMUploadObjectError.streamPayloadOfUnknownLength should have been thrown.")
        } catch let error as S3TMUploadObjectError {
            if case .streamPayloadOfUnknownLength = error {
                // Success: The error is of expected type.
            } else {
                XCTFail("Expected .streamPayloadOfUnknownLength error but \(error) thrown instead.")
            }
        } catch {
            XCTFail("Expected .streamPayloadOfUnknownLength error but \(error) thrown instead.")
        }
    }

    // MARK: - readPartData tests

    func testReadPartDataDataBody() async throws {
        let input = UploadObjectInput(putObjectInput: PutObjectInput(
            body: ByteStream.data(Data("0123456789".utf8))
        ))
        let readPartData = try await UploadObjectTests.tm.readPartData(input: input, partSize: 4, partOffset: 6)
        let expectedPartData = Data("6789".utf8)
        XCTAssertEqual(readPartData, expectedPartData)
    }

    func testReadPartDataStreamBody() async throws {
        let tempFileURL = try generateTempFile(content: Data("0123456789".utf8))
        let body = try ByteStream.stream(FileStream(fileHandle: FileHandle(forReadingFrom: tempFileURL)))
        let input = UploadObjectInput(putObjectInput: PutObjectInput(
            body: body
        ))
        let readPartData = try await UploadObjectTests.tm.readPartData(input: input, partSize: 4)
        let expectedPartData = Data("0123".utf8)
        XCTAssertEqual(readPartData, expectedPartData)
    }

    // MARK: - Utility functions for tests

    func generateTempFile(sizeInMB: Int) throws -> URL {
        let fileName = UUID().uuidString.split(separator: "-").first!.lowercased() + ".txt"
        let tempDir = FileManager.default.temporaryDirectory
        let tempFileURL = tempDir.appendingPathComponent(fileName)
        let data = Data(count: sizeInMB * 1_024 * 1_024) // 1MB

        do {
            try data.write(to: tempFileURL)
        } catch {
            XCTFail("Failed to create test file: \(error)")
        }

        return tempFileURL
    }

    func generateTempFile(content: Data) throws -> URL {
        let fileName = UUID().uuidString.split(separator: "-").first!.lowercased() + ".txt"
        let tempDir = FileManager.default.temporaryDirectory
        let tempFileURL = tempDir.appendingPathComponent(fileName)

        do {
            try content.write(to: tempFileURL)
        } catch {
            XCTFail("Failed to create test file: \(error)")
        }

        return tempFileURL
    }

    func deleteTempFile(tempFileURL: URL) throws {
        if FileManager.default.fileExists(atPath: tempFileURL.path) {
            do {
                try FileManager.default.removeItem(at: tempFileURL)
            } catch {
                XCTFail("Failed to delete test file: \(error)")
            }
        }
    }
}
