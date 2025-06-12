//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import Foundation
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

        // Perform the S3 PutObject request
        try await URLSession.perform(url: XCTUnwrap(putObjectURL), method: "PUT", body: original)

        // Presign a GetObject URL
        let getObjectInput = GetObjectInput(bucket: bucket, key: key)
        let getObjectURL = try await getObjectInput.presignURL(config: config, expiration: 300.0)

        // Perform the S3 GetObject request & keep the response data
        let retrieved = try await URLSession.perform(url: XCTUnwrap(getObjectURL))

        // Compare GetObject response to PutObject request
        XCTAssertEqual(original, retrieved)

        // Delete the object
        try await deleteObject(bucket: bucket, key: key)

        // Delete the bucket
        try await deleteBucket(bucket: bucket)
    }
}

// Made this helper because URLSession's `data(for: URLRequest)` async method
// isn't available on Swift 5.9 for some reason.  So I made my own URLSession-based
// async interface.
private extension URLSession {

    @discardableResult
    static func perform(url: URL, method: String = "GET", body: Data? = nil) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method
            urlRequest.httpBody = body
            let dataTask = shared.dataTask(with: urlRequest) { data, _, error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    // Empty data is returned if no data was received
                    // This works for the purposes of the tests we're running
                    continuation.resume(returning: data ?? Data())
                }
            }
            dataTask.resume()
        }
    }
}
