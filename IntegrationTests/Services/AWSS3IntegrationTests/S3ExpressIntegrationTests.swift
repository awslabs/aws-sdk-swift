//
//  S3ExpressIntegrationTests.swift
//  IntegrationTests
//
//  Created by Elkins, Josh on 6/5/25.
//

import XCTest
import AWSS3

final class S3ExpressIntegrationTests: XCTestCase {

    // Random identifiers for buckets that will be created in the test
    let ids = (0..<3).map { _ in String(UUID().uuidString.prefix(8)).lowercased() }

    // Region in which to run the test
    let region = "us-west-2"

    // Availability zone where the buckets should be created
    let azID = "usw2-az1"

    // This test:
    // - Creates multiple S3Express ("directory") buckets
    // - Puts an object with sample contents to each bucket
    // - Reads each object & compares its contents to the original data
    // - Deletes the object from each bucket
    // - Deletes each S3Express bucket
    func test_s3Express_operationalTest() async throws {
        let key = "text"
        let originalContents = "Hello, World!"

        // Create client
        let config = try await S3Client.S3ClientConfiguration(
            region: region,
        )
        let client = S3Client(config: config)

        // Create the S3Express-enabled directory buckets
        for id in ids {
            let input = CreateBucketInput(
                bucket: bucket(id: id),
                createBucketConfiguration: .init(
                    bucket: .init(dataRedundancy: .singleavailabilityzone, type: .directory),
                    location: .init(name: azID, type: .availabilityzone)
                )
            )
            let _ = try await client.createBucket(input: input)
        }

        // add object to each bucket
        for id in ids {
            let input = PutObjectInput(body: .data(.init(originalContents.utf8)), bucket: bucket(id: id), key: key)
            let _ = try await client.putObject(input: input)
        }

        // Get the object from each bucket and check its contents match original
        for id in ids {
            let input = GetObjectInput(bucket: bucket(id: id), key: key)
            let output = try await client.getObject(input: input)

            let data = try await output.body!.readData()!
            let retrieved = String(data: data, encoding: .utf8)!
            XCTAssertEqual(retrieved, originalContents, "Expected \"\(originalContents)\", received \"\(retrieved)\"")
        }

        // Delete the object from each bucket
        for id in ids {
            let input = DeleteObjectInput(bucket: bucket(id: id), key: key)
            _ = try await client.deleteObject(input: input)
        }

        // Delete each directory bucket
        for id in ids {
            let input = DeleteBucketInput(bucket: bucket(id: id))
            _ = try await client.deleteBucket(input: input)
        }
    }

    // Helper method to create a S3Express-compliant bucket name
    private func bucket(id: String) -> String {
        "a\(id)--\(azID)--x-s3"
    }
}
