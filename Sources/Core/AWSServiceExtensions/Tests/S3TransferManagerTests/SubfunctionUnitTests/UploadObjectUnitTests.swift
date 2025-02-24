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

class UploadObjectUnitTests: S3TMUnitTestCase {
    // MARK: - resolvePayloadSize tests.

    func testResolvePayloadSizeWithDataBody() async throws {
        let body = ByteStream.data(Data("abcde".utf8))
        let resolvedPayloadSize = try await UploadObjectUnitTests.tm.resolvePayloadSize(of: body)
        let expectedPayloadSize = 5
        XCTAssertEqual(resolvedPayloadSize, expectedPayloadSize)
    }

    func testResolvePayloadSizeWithKnownLengthStreamBody() async throws {
        let tempFileURL = try generateTempFile(sizeInMB: 1)
        let body = try ByteStream.stream(FileStream(fileHandle: FileHandle(forReadingFrom: tempFileURL)))
        let resolvedPayloadSize = try await UploadObjectUnitTests.tm.resolvePayloadSize(of: body)
        let expectedPayloadSize = 1024 * 1024
        XCTAssertEqual(resolvedPayloadSize, expectedPayloadSize)
        try deleteTempFile(tempFileURL: tempFileURL)
    }

    func testResolvePayloadSizeWithUnknownLengthStreamBody() async throws {
        let body = ByteStream.stream(BufferedStream(data: Data("abcde".utf8)))
        do {
            _ = try await UploadObjectUnitTests.tm.resolvePayloadSize(of: body)
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

    // MARK: - readPartData tests.

    func testReadPartDataDataBody() async throws {
        let input = UploadObjectInput(putObjectInput: PutObjectInput(
            body: ByteStream.data(Data("0123456789".utf8))
        ))
        let readPartData = try await UploadObjectUnitTests.tm.readPartData(input: input, partSize: 4, partOffset: 6)
        let expectedPartData = Data("6789".utf8)
        XCTAssertEqual(readPartData, expectedPartData)
    }

    func testReadPartDataStreamBody() async throws {
        let tempFileURL = try generateTempFile(content: Data("0123456789".utf8))
        let body = try ByteStream.stream(FileStream(fileHandle: FileHandle(forReadingFrom: tempFileURL)))
        let input = UploadObjectInput(putObjectInput: PutObjectInput(
            body: body
        ))
        let readPartData = try await UploadObjectUnitTests.tm.readPartData(
            input: input,
            partSize: 4,
            partOffset: 6,
            byteStreamPartReader: ByteStreamPartReader(stream: body)
        )
        let expectedPartData = Data("6789".utf8)
        XCTAssertEqual(readPartData, expectedPartData)
    }
}
