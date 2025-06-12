//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

final class S3ExpressIntegrationTests: S3ExpressXCTestCase {

    // This test:
    // - Creates multiple S3Express ("directory") buckets
    // - Puts an object with sample contents to each bucket
    // - Reads each object & compares its contents to the original data
    // - Deletes the object from each bucket
    // - Deletes each S3Express bucket
    func test_s3Express_operationalTest() async throws {
        let key = "text"
        let originalContents = Data("Hello, World!".utf8)

        // Create the S3Express-enabled directory buckets & save the names for later use
        var buckets = [String]()
        for _ in 0..<3 {
            let baseName = String(UUID().uuidString.prefix(8)).lowercased()
            let newBucket = try await createS3ExpressBucket(baseName: baseName)
            buckets.append(newBucket)
        }

        // add object to each bucket
        for bucket in buckets {
            let input = PutObjectInput(body: .data(.init(originalContents)), bucket: bucket, key: key)
            let _ = try await client.putObject(input: input)
        }

        // Get the object from each bucket and check its contents match original
        for bucket in buckets {
            let input = GetObjectInput(bucket: bucket, key: key)
            let output = try await client.getObject(input: input)

            let retrieved = try await output.body!.readData()!
            XCTAssertEqual(retrieved, originalContents)
        }

        // Delete the object from each bucket
        for bucket in buckets {
            try await deleteObject(bucket: bucket, key: key)
        }

        // Delete each directory bucket
        for bucket in buckets {
            try await deleteBucket(bucket: bucket)
        }
    }
}
