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

final class S3ConcurrentTests: S3XCTestCase, @unchecked Sendable {
    private var fileData: Data!

    // Payload just below chunked threshold
    // Tests concurrent upload of simple data payloads
    func test_10x_1MB_getObject() async throws {
        fileData = generateRandomTextData(ofSizeInMB: 1)
        try await repeatConcurrentlyWithArgs(count: 10, test: getObject, arg: fileData!)
    }

    // Payload at chunked threshold, just large enough to chunk
    // Tests concurrent upload with aws-chunked encoding & flexible checksums
    func test_10x_1_5MB_getObject() async throws {
        fileData = generateRandomTextData(ofSizeInMB: 1.5)
        try await repeatConcurrentlyWithArgs(count: 10, test: getObject, arg: fileData!)
    }

    // Payload 256 bytes with 200 concurrent requests, sends as simple data
    // Tests very high concurrency with small data payloads
    func test_200x_256B_getObject() async throws {
        fileData = generateRandomTextData(ofSizeInBytes: 256)
        try await repeatConcurrentlyWithArgs(count: 200, test: getObject, arg: fileData!)
    }

    // MARK: - Private methods

    // Puts data to S3, gets the uploaded file, asserts retrieved data == original data, deletes S3 object
    @Sendable
    private func getObject(data: Data) async throws {
        let objectKey = String.uniqueID(service: "s3")
        let putObjectInput = PutObjectInput(body: .data(data), bucket: bucketName, key: objectKey)

        _ = try await client.putObject(input: putObjectInput)

        let retrievedData = try await client.getObject(input: GetObjectInput(
            bucket: bucketName, key: objectKey
        )).body?.readData()

        XCTAssertEqual(data, retrievedData)

        let deleteObjectInput = DeleteObjectInput(bucket: bucketName, key: objectKey)
        _ = try await client.deleteObject(input: deleteObjectInput)
   }
}
