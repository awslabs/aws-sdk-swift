//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

final class S3URLEncodingTests: S3XCTestCase {
    let objectName = "hello-world"
    let expected = "Hello, world!"

    override func setUp() async throws {
        sut = try S3Client(region: region)
        try await createBucket()
    }

    override func tearDown() async throws {
        try await emptyBucket()
        try await deleteBucket()
    }

    let weirdNames = Set(["x+x.txt", "x%x.txt", "x x.txt"])

    func test_putObject_putsFilesWithSpecialCharactersInName() async throws {
        for name in weirdNames {
            let input = PutObjectInput(body: .data(Data()), bucket: bucketName, key: name)
            _ = try await sut.putObject(input: input)
        }
        let keys = Set(try await listBucketKeys())
        XCTAssertTrue(keys.isSuperset(of: weirdNames))
    }

    func test_presignPutObject_putsFilesWithSpecialCharactersInName() async throws {
        let config = try await S3Client.S3ClientConfiguration(region: region)
        for name in weirdNames {
            let input = PutObjectInput(body: .data(Data()), bucket: bucketName, key: name)
            let presignedURL = try await input.presignURL(config: config, expiration: 3600.0)!
            print("Presigned URL for \"\(name)\" is \"\(presignedURL)\"")
            var urlRequest = URLRequest(url: presignedURL)
            urlRequest.httpMethod = "PUT"
            urlRequest.httpBody = Data()
            _ = try await perform(urlRequest: urlRequest)
        }
        let keys = Set(try await listBucketKeys())
        XCTAssertTrue(keys.isSuperset(of: weirdNames))
    }
}
