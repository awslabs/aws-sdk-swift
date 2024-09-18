//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import Smithy
import XCTest
import AWSS3
import AWSIntegrationTestUtils

class S3ConcurrentTests: S3XCTestCase {
    let fileSize = 50_000_000

    func test_10x_50MB_getObject() async throws {
        try await repeatConcurrently(count: 10, test: getObject_50MB)
    }

    func getObject_50MB() async throws {
        // Generate dummy 50MB text file
        let fileURL = getTemporaryFileURL()
        try generateDummyTextFile(fileURL: fileURL)

        // Upload then retrieve the dummy file to and from S3 bucket
        let file = ByteStream.from(
            fileHandle: try FileHandle(
                forReadingFrom: fileURL
            )
        )
        let objectKey = UUID().uuidString.split(separator: "-").first!.lowercased()
        let putObjectInput = PutObjectInput(body: file, bucket: bucketName, key: objectKey)
        _ = try await client.putObject(input: putObjectInput)
        let retrievedData = try await client.getObject(input: GetObjectInput(
            bucket: bucketName, key: objectKey
        )).body?.readData()

        // Assert that uploaded & retrieved data equals data in local file
        XCTAssertEqual(try Data(contentsOf: fileURL), retrievedData)

        // Delete the temporary file
        try FileManager.default.removeItem(at: fileURL)
    }

    // Helper functions

    func getTemporaryFileURL() -> URL {
        // Return file URL for a dummy text file located in temporary directory
        let tempDirectoryURL = FileManager.default.temporaryDirectory
        let uuid = UUID().uuidString.lowercased()
        return URL(fileURLWithPath: "50MB-\(uuid)", relativeTo: tempDirectoryURL).appendingPathExtension("txt")
    }

    func generateDummyTextFile(fileURL: URL) throws {
        // 50 char long string as Data
        let segmentData = Data("1234567890abcdefghijklmnopqrstABCDEFGHIJKLMNOPQRST".utf8)

        // Create 50MB of dummy data
        var wholeData = Data()
        for _ in 0..<1_000_000 {
            wholeData.append(segmentData)
        }

        // Create the dummy file with 50MB data; throw error if it fails
        let success = FileManager.default.createFile(atPath: fileURL.path(), contents: wholeData)
        if !success {
            XCTFail("Failed to create the dummy text file for S3 concurrent tests.")
        }
    }
}
