//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSIntegrationTestUtils

class S3ExpressXCTestCase: XCTestCase {
    // Region in which to run the test
    var region: String { "us-west-2" }

    // Availability zone where the buckets should be created
    var azID: String { "usw2-az1" }

    // The S3 client config object
    var config: S3Client.Config!

    // The S3 client
    var client: S3Client!

    override func setUp() async throws {
        try await super.setUp()
        self.config = try await S3Client.Config(region: region)
        self.client = S3Client(config: config)
    }

    @discardableResult
    func createS3ExpressBucket() async throws -> String {
        let bucket = bucket()
        let input = CreateBucketInput(
            bucket: bucket,
            createBucketConfiguration: .init(
                bucket: .init(dataRedundancy: .singleavailabilityzone, type: .directory),
                location: .init(name: azID, type: .availabilityzone)
            )
        )
        let _ = try await client.createBucket(input: input)
        return bucket
    }

    func deleteObject(bucket: String, key: String) async throws {
        let deleteObjectInput = DeleteObjectInput(bucket: bucket, key: key)
        _ = try await client.deleteObject(input: deleteObjectInput)
    }

    func deleteBucket(bucket: String) async throws {
        let deleteBucketInput = DeleteBucketInput(bucket: bucket)
        _ = try await client.deleteBucket(input: deleteBucketInput)
    }

    // Helper method to create a random, S3Express-compliant bucket name
    func bucket() -> String {
        "inttest-\(UUID().uuidString.lowercased())--\(azID)--x-s3"
    }
}
