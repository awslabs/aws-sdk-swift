//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import Smithy
import SmithyStreams
import XCTest
import AWSS3
import AWSIntegrationTestUtils

class S3ConcurrentTests: S3XCTestCase {
    public var fileData: Data!
    let MB = 1_000_000

    // Payload below 1,048,576 bytes; sends as simple data payload
    func test_20x_1MB_getObject() async throws {
        fileData = try generateDummyTextData(count: MB)
        try await repeatConcurrentlyWithArgs(count: 20, test: getObject, args: fileData!)
    }

    // Payload over 1,048,576 bytes; uses aws chunked encoding & flexible checksum
    func test_20x_1_5MB_getObject() async throws {
        fileData = try generateDummyTextData(count: 3 * MB / 2)
        try await repeatConcurrentlyWithArgs(count: 20, test: getObject, args: fileData!)
    }

    // Payload 256 bytes with 400 concurrent requests, sends as simple data
    func test_400x_256B_getObject() async throws {
        fileData = try generateDummyTextData(count: 256)
        try await repeatConcurrentlyWithArgs(count: 400, test: getObject, args: fileData!)
    }

    /* Helper functions */

    // Generates text data in increments of 10 bytes
    func generateDummyTextData(count: Int) throws -> Data {
        let segmentData = Data("1234567890".utf8)
        var wholeData = Data()
        for _ in 0..<(count / 10 + 1) {
            wholeData.append(segmentData)
        }
        return wholeData.subdata(in: 0..<count)
    }

    // Puts data to S3, gets the uploaded file, then asserts retrieved data equals original data
    func getObject(args: Any...) async throws {
        guard let data = args[0] as? Data else {
            throw ClientError.dataNotFound("Failed to retrieve dummy data.")
        }
        let file = ByteStream.data(data)
        let objectKey = UUID().uuidString.split(separator: "-").first!.lowercased()
        let putObjectInput = PutObjectInput(body: file, bucket: bucketName, key: objectKey)
        _ = try await client.putObject(input: putObjectInput)
        let retrievedData = try await client.getObject(input: GetObjectInput(
            bucket: bucketName, key: objectKey
        )).body?.readData()
        XCTAssertEqual(data, retrievedData)
        let deleteObjectInput = DeleteObjectInput(bucket: bucketName, key: objectKey)
        _ = try await client.deleteObject(input: deleteObjectInput)
    }
}
