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

    override func setUp() async throws {
        try await super.setUp()
        fileData = try generateDummyTextData()
    }

    // Run test 100 times, concurrently
    func test_100x_1MB_getObject() async throws {
        try await repeatConcurrentlyWithArgs(count: 100, test: getObject_1MB, args: fileData!)
    }

    /* Helper functions */

    // Generates 1MB text data
    func generateDummyTextData() throws -> Data {
        let segmentData = Data("1234567890".utf8)
        var wholeData = Data()
        for _ in 0..<100_000 {
            wholeData.append(segmentData)
        }
        return wholeData
    }

    // Puts 1MB data to S3, gets the uploaded file, then asserts retrieved data equals original data
    func getObject_1MB(args: Any...) async throws {
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
    }
}
