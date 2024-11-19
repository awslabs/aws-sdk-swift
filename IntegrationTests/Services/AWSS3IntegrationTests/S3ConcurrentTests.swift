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

final class S3ConcurrentTests: S3XCTestCase {
    private var fileData: Data!

    // Payload just below chunked threshold
    // Tests concurrent upload of simple data payloads
    func test_10x_1MB_getObject() async throws {
        fileData = generateRandomTextData(ofSizeInMB: 1)
        try await repeatConcurrentlyWithArgs(count: 10, test: getObject, args: fileData!)
    }

    // Payload at chunked threshold, just large enough to chunk
    // Tests concurrent upload with aws-chunked encoding & flexible checksums
    func test_10x_1_5MB_getObject() async throws {
        fileData = generateRandomTextData(ofSizeInMB: 1.5)
        try await repeatConcurrentlyWithArgs(count: 10, test: getObject, args: fileData!)
    }

    // Payload 256 bytes with 200 concurrent requests, sends as simple data
    // Tests very high concurrency with small data payloads
    func test_200x_256B_getObject() async throws {
        fileData = generateRandomTextData(ofSizeInBytes: 256)
        try await repeatConcurrentlyWithArgs(count: 200, test: getObject, args: fileData!)
    }

    // MARK: - Private methods

    // Puts data to S3, gets the uploaded file, asserts retrieved data == original data, deletes S3 object
    private func getObject(args: Any...) async throws {

        // Take the test data and crate a PutObject request to send it
        guard let data = args[0] as? Data else {
            throw ClientError.dataNotFound("Failed to retrieve dummy data.")
        }
        let file = ByteStream.data(data)
        let objectKey = UUID().uuidString.split(separator: "-").first!.lowercased()
        let putObjectInput = PutObjectInput(body: file, bucket: bucketName, key: objectKey)

        // Put the test data to S3
        _ = try await client.putObject(input: putObjectInput)

        // Read the response's data stream into memory
        let retrievedData = try await client.getObject(input: GetObjectInput(
            bucket: bucketName, key: objectKey
        )).body?.readData()

        // Compare the retrieved data to the uploaded data to show they are equal
        XCTAssertEqual(data, retrievedData)

        // Delete the S3 object once the test has been verified
        // Calling DeleteObject here allows for concurrent deletion, accelerating test teardown
        let deleteObjectInput = DeleteObjectInput(bucket: bucketName, key: objectKey)
        _ = try await client.deleteObject(input: deleteObjectInput)
    }
}
