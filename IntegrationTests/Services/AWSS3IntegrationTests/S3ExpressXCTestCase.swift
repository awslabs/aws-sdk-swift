//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

class S3ExpressXCTestCase: XCTestCase {
    // Region in which to run the test
    var region: String { "us-west-2" }

    // Availability zone where the buckets should be created
    var azID: String { "usw2-az1" }

    // The S3 client config object
    var config: S3Client.S3ClientConfig!

    // The S3 client
    var client: S3Client!

    // The names of the buckets that were created during the test
    var buckets = [String]()

    // The object key & data contents to put in each bucket
    let key = "text"
    let originalContents = Data("Hello, World!".utf8)

    override func setUp() async throws {
        try await super.setUp()
        self.config = try await S3Client.S3ClientConfig(region: region)
        self.client = S3Client(config: config)
        try? await deleteStaleDirectoryBuckets()
    }

    /// Deletes orphaned directory buckets older than 1 day from previous test runs
    /// that were not cleaned up (e.g. due to process kill, timeout, or crash).
    private func deleteStaleDirectoryBuckets() async throws {
        let response = try await client.listDirectoryBuckets(input: ListDirectoryBucketsInput())
        guard let allBuckets = response.buckets else { return }
        let oneDayAgo = Date().addingTimeInterval(-86400)
        let suffix = "--\(azID)--x-s3"
        let stale = allBuckets.filter {
            ($0.name ?? "").hasSuffix(suffix) && ($0.creationDate ?? Date()) < oneDayAgo
        }
        for bucket in stale {
            guard let name = bucket.name else { continue }
            try? await emptyBucket(bucket: name)
            try? await deleteBucket(bucket: name)
        }
    }

    private func emptyBucket(bucket: String) async throws {
        let response = try await client.listObjectsV2(input: ListObjectsV2Input(bucket: bucket))
        guard let objects = response.contents else { return }
        for object in objects {
            guard let key = object.key else { continue }
            try? await deleteObject(bucket: bucket, key: key)
        }
    }

    override func tearDown() async throws {

        // Delete the object from each bucket
        for bucket in buckets {
            try? await deleteObject(bucket: bucket, key: key)
        }

        // Delete each directory bucket
        for bucket in buckets {
            try? await deleteBucket(bucket: bucket)
        }

        try await super.tearDown()
    }

    @discardableResult
    func createS3ExpressBucket(
        baseName: String = String(UUID().uuidString.prefix(8)).lowercased()
    ) async throws -> String {
        let bucket = bucket(baseName: baseName)
        let input = CreateBucketInput(
            bucket: bucket,
            createBucketConfiguration: .init(
                bucket: .init(dataRedundancy: .singleavailabilityzone, type: .directory),
                location: .init(name: azID, type: .availabilityzone)
            )
        )
        let _ = try await client.createBucket(input: input)

        // Save the bucket name in the `buckets` array for use during tear down
        buckets.append(bucket)
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

    // Helper method to create a S3Express-compliant bucket name
    func bucket(baseName: String) -> String {
        "a\(baseName)--\(azID)--x-s3"
    }
}
