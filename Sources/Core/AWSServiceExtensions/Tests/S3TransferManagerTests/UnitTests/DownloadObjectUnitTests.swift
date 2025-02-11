//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import Smithy
@testable import AWSServiceExtensions

class DownloadObjectUnitTests: S3TMUnitTestCase {
    // MARK: - writeData tests.

    func testWriteDataToFileOutputStream() async throws {
        // Create file output stream.
        let (fileOutputStream, tempFileURL) = try getEmptyFileOutputStream()

        // Write dummy data to file output stream.
        try DownloadObjectUnitTests.tm.writeData(Data("abcdefg".utf8), to: fileOutputStream)

        // Assert on correct write.
        fileOutputStream.close()
        let writtenData = try Data(contentsOf: tempFileURL)
        let expectedData = Data("abcdefg".utf8)
        XCTAssertEqual(writtenData, expectedData)

        // Cleanup.
        try deleteTempFile(tempFileURL: tempFileURL)
    }

    func testWriteDataToMemoryOutputStream() async throws {
        // Create memory output stream.
        let memoryOutputStream = OutputStream.toMemory()

        // Write dummy data to memory output stream.
        try DownloadObjectUnitTests.tm.writeData(Data("abcdefg".utf8), to: memoryOutputStream)

        // Assert on correct write.
        memoryOutputStream.close()
        let writtenData = memoryOutputStream.property(forKey: .dataWrittenToMemoryStreamKey) as! Data
        let expectedData = Data("abcdefg".utf8)
        XCTAssertEqual(writtenData, expectedData)
    }

    func testWriteDataToRawByteBufferOutputStream() async throws {
        // Create raw byte buffer output stream.
        let (rawByteBufferOutputStream, buffer) = try getEmptyRawByteBufferOutputStream(bufferCount: 7)

        // Write dummy data to raw byte buffer output stream.
        try DownloadObjectUnitTests.tm.writeData(Data("abcdefg".utf8), to: rawByteBufferOutputStream)

        // Assert on correct write.
        rawByteBufferOutputStream.close()
        let writtenData = Data(buffer.prefix { $0 != 0 })
        let expectedData = Data("abcdefg".utf8)
        XCTAssertEqual(writtenData, expectedData)
    }

    // MARK: - writeByteStreams tests.

    func testWriteByteStreamsToFileOutputStream() async throws {
        // Create output stream & dummy byte streams to write to output stream.
        let (fileOutputStream, tempFileURL) = try getEmptyFileOutputStream()
        let byteStreams = getDummyByteStreamArray()

        // Write dummy byte streams to output stream.
        try await DownloadObjectUnitTests.tm.writeByteStreams(byteStreams, to: fileOutputStream)

        // Assert on correct write.
        fileOutputStream.close()
        let writtenData = try Data(contentsOf: tempFileURL)
        let expectedData = Data("0123456789abcde".utf8)
        XCTAssertEqual(writtenData, expectedData)

        // Cleanup.
        try deleteTempFile(tempFileURL: tempFileURL)
    }

    func testWriteByteStreamsToMemoryOutputStream() async throws {
        // Create output stream & dummy byte streams to write to output stream.
        let memoryOutputStream = OutputStream.toMemory()
        let byteStreams = getDummyByteStreamArray()

        // Write dummy byte streams to output stream.
        try await DownloadObjectUnitTests.tm.writeByteStreams(byteStreams, to: memoryOutputStream)

        // Assert on correct write.
        memoryOutputStream.close()
        let writtenData = memoryOutputStream.property(forKey: .dataWrittenToMemoryStreamKey) as! Data
        let expectedData = Data("0123456789abcde".utf8)
        XCTAssertEqual(writtenData, expectedData)
    }

    func testWriteByteStreamsToRawByteBufferStream() async throws {
        // Create output stream & dummy byte streams to write to output stream.
        let (rawByteBufferOutputStream, buffer) = try getEmptyRawByteBufferOutputStream(bufferCount: 15)
        let byteStreams = getDummyByteStreamArray()

        // Write dummy byte streams to output stream.
        try await DownloadObjectUnitTests.tm.writeByteStreams(byteStreams, to: rawByteBufferOutputStream)

        // Assert on correct write.
        rawByteBufferOutputStream.close()
        let writtenData = Data(buffer.prefix { $0 != 0 })
        let expectedData = Data("0123456789abcde".utf8)
        XCTAssertEqual(writtenData, expectedData)
    }

    // MARK: - parseBytesRange tests.

    func testParseBytesRangeStart() async throws {
        let startRangeString = "bytes=1-"
        let (startByte, endByte) = try DownloadObjectUnitTests.tm.parseBytesRange(str: startRangeString)
        XCTAssertEqual(startByte, 1)
        XCTAssertNil(endByte)
    }

    func testParseBytesRangeStartAndEnd() async throws {
        let startEndRangeString = "bytes=1-99"
        let (startByte, endByte) = try DownloadObjectUnitTests.tm.parseBytesRange(str: startEndRangeString)
        XCTAssertEqual(startByte, 1)
        XCTAssertEqual(endByte, 99)
    }

    func testParseBytesRangeSuffix() async throws {
        let suffixRangeString = "bytes=-99"
        do {
            _ = try DownloadObjectUnitTests.tm.parseBytesRange(str: suffixRangeString)
            XCTFail("Expected S3TMDownloadObjectError.invalidRangeFormat to be thrown.")
        } catch S3TMDownloadObjectError.invalidRangeFormat {
            // Success; expected error thrown.
        }
    }

    func testParseBytesRangeMultipleRanges() async throws {
        let multipleRangeString = "bytes=1-99,100-103"
        do {
            _ = try DownloadObjectUnitTests.tm.parseBytesRange(str: multipleRangeString)
            XCTFail("Expected S3TMDownloadObjectError.invalidRangeFormat to be thrown.")
        } catch S3TMDownloadObjectError.invalidRangeFormat {
            // Success; expected error thrown.
        }
    }

    // MARK: - getSizeFromContentRangeString tests.

    func testGetSizeFromContentRangeStringValidSize() async throws {
        let validContentRangeValue = "bytes 1-99/100"
        let parsedSize = try DownloadObjectUnitTests.tm.getSizeFromContentRangeString(str: validContentRangeValue)
        let expectedSize = 100
        XCTAssertEqual(parsedSize, expectedSize)
    }

    // MARK: - Utility functions.

    private func getEmptyFileOutputStream() throws -> (OutputStream, tempFileURL: URL) {
        let tempFileURL = try generateTempFile(content: Data())
        let fileOutputStream = OutputStream(url: tempFileURL, append: true)!
        return (fileOutputStream, tempFileURL)
    }

    private func getEmptyRawByteBufferOutputStream(bufferCount: Int) throws -> (OutputStream, rawByteBuffer: [UInt8]) {
        var buffer = [UInt8](repeating: 0, count: bufferCount)
        let rawByteBufferOutputStream = OutputStream(toBuffer: &buffer, capacity: buffer.count)
        return (rawByteBufferOutputStream, buffer)
    }

    private func getDummyByteStreamArray() -> [ByteStream] {
        let byteStreamOne = ByteStream.data(Data("01234".utf8))
        let byteStreamTwo = ByteStream.data(Data("56789".utf8))
        let byteStreamThree = ByteStream.data(Data("abcde".utf8))
        return [byteStreamOne, byteStreamTwo, byteStreamThree]
    }
}
