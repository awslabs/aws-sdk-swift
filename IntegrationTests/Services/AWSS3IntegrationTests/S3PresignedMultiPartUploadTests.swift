//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSS3

/// Tests presigned multipart upload using S3.
class S3PresignedMultiPartUploadTests: S3XCTestCase {
    private var createMultipartUploadOutput: CreateMultipartUploadOutput!
    private var key: String!
    private var originalData: String!

    override func setUp() async throws {
        try await super.setUp()
        originalData = UUID().uuidString
        key = UUID().uuidString
        createMultipartUploadOutput = try await client.createMultipartUpload(
            input: .init(bucket: bucketName, key: key)
        )
    }

    func test_multiPartUpload_putsObjectWithPresignedRequest() async throws {
        let request = try await client.presignedRequestForUploadPart(
            input: .init(
                body: .data(originalData.data(using: .utf8)),
                bucket: bucketName,
                key: key,
                partNumber: 1,
                uploadId: createMultipartUploadOutput.uploadId
            ),
            expiration: 600.0
        )

        try await completeMultiPartUpload(request: request)

        let data = try await getObject(key: key)
        XCTAssertEqual(originalData, data)
    }

    func test_multiPartUpload_putsObjectWithPresignedURL() async throws {
        let url = try await client.presignedURLForUploadPart(
            input: .init(
                body: .data(originalData.data(using: .utf8)),
                bucket: bucketName,
                key: key,
                partNumber: 1,
                uploadId: createMultipartUploadOutput.uploadId
            ),
            expiration: 600.0
        )
        var request = URLRequest(url: url)
        request.httpBody = Data(originalData.utf8)
        request.httpMethod = "PUT"

        try await completeMultiPartUpload(request: request)

        let data = try await getObject(key: key)
        XCTAssertEqual(originalData, data)
    }

    // MARK: - Private

    private func completeMultiPartUpload(request: URLRequest, line: UInt = #line) async throws {
        let (_, response) = try await perform(urlRequest: request)

        let eTag = try XCTUnwrap(response?.allHeaderFields["Etag"] as? String, line: line)

        _ = try await client.completeMultipartUpload(
            input: .init(
                bucket: bucketName,
                key: key,
                multipartUpload: .init(
                    parts: [.init(eTag: eTag, partNumber: 1)]
                ),
                uploadId: createMultipartUploadOutput.uploadId
            )
        )
    }
}
