//
//  File.swift
//  
//
//  Created by Yoo, Chan on 6/27/24.
//

import Foundation
import Smithy
import XCTest
import AWSS3
import AWSIntegrationTestUtils

class S3ConcurrentTests: S3XCTestCase {
    let fileSize = 50_000_000

    func test_50MB_putObject() async throws {
        let fileURL = getFileURL()
        generateDummyTextFile(fileURL: fileURL)
        let file = ByteStream.from(
            fileHandle: try FileHandle(
                forReadingFrom: fileURL
            )
        )
        let objectKey = UUID().uuidString.split(separator: "-").first!.lowercased()
        let putObjectInput = PutObjectInput(body: file, bucket: bucketName, key: objectKey)
        _ = try await client.putObject(input: putObjectInput)
        let headObjectInput = HeadObjectInput(bucket: bucketName, key: objectKey)
        let contentLength = try await client.headObject(input: headObjectInput).contentLength
        XCTAssertEqual(contentLength, fileSize)
        deleteDummyTextFile(fileURL: fileURL)
    }

    func test_50MB_getObject() async throws {
        let fileURL = getFileURL()
        generateDummyTextFile(fileURL: fileURL)
        let file = ByteStream.from(
            fileHandle: try FileHandle(
                forReadingFrom: fileURL
            )
        )
        let objectKey = UUID().uuidString.split(separator: "-").first!.lowercased()
        let putObjectInput = PutObjectInput(body: file, bucket: bucketName, key: objectKey)
        _ = try await client.putObject(input: putObjectInput)
        let getObjectInput = GetObjectInput(bucket: bucketName, key: objectKey)
        let retrievedData = try await client.getObject(input: getObjectInput).body.unsafelyUnwrapped.readData()
        XCTAssertEqual(
            try Data(contentsOf: fileURL),
            retrievedData
        )
        deleteDummyTextFile(fileURL: fileURL)
    }

    func test_10x_50MB_putObject() async throws {
        try await repeatConcurrently(count: 10, test: test_50MB_putObject)
    }

    func test_10x_50MB_getObject() async throws {
        try await repeatConcurrently(count: 10, test: test_50MB_getObject)
    }

    // Helper functions

    func getFileURL() -> URL {
        let tempDirectoryURL = FileManager.default.temporaryDirectory
        let uuid = UUID().uuidString.split(separator: "-").first!.lowercased()
        return URL(fileURLWithPath: "50MiB-\(uuid)", relativeTo: tempDirectoryURL).appendingPathExtension("txt")
    }

    func generateDummyTextFile(fileURL: URL) {
        let stringSegment = "1234567890abcdefghijklmnopqrstABCDEFGHIJKLMNOPQRST" // 50 char long string
        guard let segmentData = stringSegment.data(using: .utf8) else {
            XCTFail("Unable to convert string to data")
            return
        }
        var wholeData = Data()
        for _ in 1...1_000_000 {
            wholeData.append(segmentData)
        }
        do {
            try wholeData.write(to: fileURL)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func deleteDummyTextFile(fileURL: URL) {
        do {
            // Delete the temporarily geenerated file
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
