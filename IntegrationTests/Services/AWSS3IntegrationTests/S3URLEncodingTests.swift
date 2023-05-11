//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

final class S3URLEncodingTests: S3XCTestCase {

    // These are keys with special characters or other edge cases that should be tested against S3 to
    // ensure they work.
    let keys: Set<String> = ["x.txt", "x+x.txt", "x%x.txt", "x x.txt", "abc/x.txt", "abc/x+x.txt"]

    func test_putObject_putsAllKeys() async throws {
        for key in keys {
            let input = PutObjectInput(body: .data(Data()), bucket: bucketName, key: key)
            _ = try await client.putObject(input: input)
        }
        let createdKeys = Set(try await listBucketKeys())
        XCTAssertTrue(createdKeys.isSuperset(of: keys))
    }

    func test_presignPutObject_putsAllKeys() async throws {
        let config = try await S3Client.S3ClientConfiguration(region: region)
        for key in keys {
            let input = PutObjectInput(body: .data(Data()), bucket: bucketName, key: key)
            let presignedURLOrNil = try await input.presignURL(config: config, expiration: 600.0)
            let presignedURL = try XCTUnwrap(presignedURLOrNil)
            var urlRequest = URLRequest(url: presignedURL)
            urlRequest.httpMethod = "PUT"
            urlRequest.httpBody = Data()
            _ = try await perform(urlRequest: urlRequest)
        }
        let createdKeys = Set(try await listBucketKeys())
        XCTAssertTrue(createdKeys.isSuperset(of: keys))
    }
}
