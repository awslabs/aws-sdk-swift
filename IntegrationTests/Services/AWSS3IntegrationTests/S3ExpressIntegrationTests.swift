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

        // The number of buckets to create
        let n = 5

        // Create the S3Express-enabled directory buckets with random names
        // Use a task group so buckets are created in parallel.
        // The child tasks capture only the client & AZ, and return the names they created, so
        // that `buckets` is only ever mutated here on the test case itself.
        let client = self.client!
        let azID = self.azID
        let newBuckets = try await withThrowingTaskGroup(of: String.self) { group in
            for _ in 1...n {
                group.addTask {
                    let baseName = String(UUID().uuidString.prefix(8)).lowercased()
                    return try await Self.createS3ExpressBucket(client: client, azID: azID, baseName: baseName)
                }
            }
            var created = [String]()
            for try await bucket in group {
                created.append(bucket)
            }
            return created
        }

        // Save the bucket names for use during tear down
        buckets.append(contentsOf: newBuckets)

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

        // Objects, and then buckets, will be deleted during this test case's tearDown()
    }
}
