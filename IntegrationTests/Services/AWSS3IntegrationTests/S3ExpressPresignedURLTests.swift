//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

final class S3ExpressPresignedURLTests: S3ExpressXCTestCase {

    func test_putAndGetPresignedURL() async throws {
        let key = "text"
        let original = Data("Hello, World!".utf8)

        // Create a S3Express (directory) bucket
        let bucket = try await createS3ExpressBucket()

        // Presign a PutObject URL
        let putObjectInput = PutObjectInput(bucket: bucket, key: key)
        let putObjectURL = try await putObjectInput.presignURL(config: config, expiration: 300.0)

        // Make a PutObject URLRequest, then perform it
        var putObjectURLRequest = URLRequest(url: try XCTUnwrap(putObjectURL))
        putObjectURLRequest.httpMethod = "PUT"
        putObjectURLRequest.httpBody = original
        _ = try await URLSession.shared.data(for: putObjectURLRequest)

        // Presign a GetObject URL
        let getObjectInput = GetObjectInput(bucket: bucket, key: key)
        let getObjectURL = try await getObjectInput.presignURL(config: config, expiration: 300.0)

        // Make a GetObject URLRequest, then perform it
        var getObjectURLRequest = URLRequest(url: try XCTUnwrap(getObjectURL))
        getObjectURLRequest.httpMethod = "GET"
        let (retrieved, _) = try await URLSession.shared.data(for: getObjectURLRequest)

        // Compare GetObject response to PutObject request
        XCTAssertEqual(original, retrieved)

        // Delete the object
        try await deleteObject(bucket: bucket, key: key)

        // Delete the bucket
        try await deleteBucket(bucket: bucket)
    }
}
