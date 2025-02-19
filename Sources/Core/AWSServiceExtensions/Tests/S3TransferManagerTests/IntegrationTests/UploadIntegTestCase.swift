//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3
import AWSServiceExtensions

class UploadIntegTestCase: XCTestCase {
    static var tm: S3TransferManager! // The shared transfer manager for tests.
    static var s3: S3Client! // The shared S3 client for tests.
    static let region = "us-west-2"

    // This partial UUID must be suffixed to the overridden bucketName in child classes.
    static let bucketNamePartialUUID = UUID().uuidString.split(separator: "-").first!.lowercased()
    // UploadIntegTestCase property that must be overridden with specific name.
    class var bucketName: String {
        fatalError("Must be implemented by child class")
    }

    // This setUp runs just once for the test class, before tests start execution.
    override class func setUp() {
        // Create a shared transfer manager instance.
        let tmSetupExpectation = XCTestExpectation(description: "S3 Transfer Manager setup complete")
        Task {
            do {
                tm = try await S3TransferManager(config: S3TransferManagerConfig(
                    s3Client: S3Client(region: region)
                ))
                tmSetupExpectation.fulfill()
            } catch {
                XCTFail("Failed to set up S3 Transfer Manager: \(error)")
            }
        }

        // Create a shared S3 test bucket.
        let bucketSetupExpectation = XCTestExpectation(description: "S3 test bucket setup complete")
        Task {
            do {
                s3 = try S3Client(region: region)
                _ = try await s3.createBucket(input: CreateBucketInput(
                    bucket: bucketName,
                    createBucketConfiguration: S3ClientTypes.CreateBucketConfiguration(
                        locationConstraint: S3ClientTypes.BucketLocationConstraint.usWest2
                    )
                ))
                bucketSetupExpectation.fulfill()
            } catch {
                XCTFail("Failed to setup S3 bucket: \(error)")
            }
        }

        _ = XCTWaiter().wait(for: [tmSetupExpectation, bucketSetupExpectation], timeout: 60)
    }

    // This tearDown runs just once for the test class, after all tests finish execution.
    override class func tearDown() {
        // Delete all objects in the bucket & delete the bucket.
        let bucketTearDownExpectation = XCTestExpectation(description: "S3 test bucket teardown complete")
        Task {
            do {
                _ = try await emptyBucket()
                _ = try await deleteBucket(bucketName: bucketName)
            } catch {
                XCTFail("Failed to teardown S3 bucket: \(error)")
            }
        }

        // Helper functions for deleting the bucket.
        func listBucketKeys() async throws -> Set<String> {
            let input = ListObjectsV2Input(bucket: bucketName)
            let output = try await s3.listObjectsV2(input: input)
            return Set(output.contents?.compactMap { $0.key } ?? [])
        }
        func emptyBucket() async throws {
            let keys = try await listBucketKeys()
            for key in keys {
                let deleteInput = DeleteObjectInput(bucket: bucketName, key: key)
                _ = try await s3.deleteObject(input: deleteInput)
            }
        }
        func deleteBucket(bucketName: String) async throws {
            let input = DeleteBucketInput(bucket: bucketName)
            _ = try await s3.deleteBucket(input: input)
        }

        _ = XCTWaiter().wait(for: [bucketTearDownExpectation], timeout: 60)
    }

    // Instance variables that point to same things as static variables.
    // Added for convenience, so you don't have to do UploadObjectIntegTests.tm every time to access static vars.
    var tm: S3TransferManager!
    var s3: S3Client!
    var bucketName: String!

    override func setUp() {
        tm = Self.tm
        s3 = Self.s3
        bucketName = Self.bucketName
    }
}
