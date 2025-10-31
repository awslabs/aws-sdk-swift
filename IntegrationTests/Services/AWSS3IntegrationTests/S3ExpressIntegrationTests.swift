//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

final class S3ExpressIntegrationTests: S3ExpressXCTestCase {

    // The number of buckets to create during the test
    let n = 5

    // The names of S3 buckets that were created for this test
    var buckets = [String]()

    // The object key & data contents to put in each bucket
    let key = "hello-world.txt"
    let originalContents = Data("Hello, World!".utf8)

    override func tearDown() async throws {
        try await super.tearDown()

        // Delete the object from each bucket
        for bucket in buckets {
            try await deleteObject(bucket: bucket, key: key)
        }

        // Delete each directory bucket
        for bucket in buckets {
            try await deleteBucket(bucket: bucket)
        }
    }

    // This test:
    // - Creates multiple S3Express ("directory") buckets
    // - Puts an object with sample contents to each bucket
    // - Reads each object & compares its contents to the original data
    func test_s3Express_operationalTest() async throws {

        // Create the S3Express-enabled directory buckets with random names,
        // save the names for later use
        for _ in 1...n {
            let newBucket = try await createS3ExpressBucket()
            buckets.append(newBucket)
        }

        // add an object to each bucket
        for bucket in buckets {
            let input = PutObjectInput(body: .data(originalContents), bucket: bucket, key: key)
            let _ = try await client.putObject(input: input)
        }

        // Get the object from each bucket, and check its contents match original
        for bucket in buckets {
            let input = GetObjectInput(bucket: bucket, key: key)
            let output = try await client.getObject(input: input)

            let retrievedContents = try await output.body!.readData()!
            XCTAssertEqual(retrievedContents, originalContents)
        }
    }
}
