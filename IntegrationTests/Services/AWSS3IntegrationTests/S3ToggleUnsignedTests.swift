//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSSDKHTTPAuth
import XCTest
import AWSS3
import ClientRuntime
import AWSClientRuntime

/// Tests toggle unsigned request using S3.
class S3ToggleUnsignedTests: S3XCTestCase {
    private var s3Config: S3Client.S3ClientConfiguration!
    private let key = "test.txt"

    override func setUp() async throws {
        try await super.setUp()
        s3Config = try await S3Client.S3ClientConfiguration(region: region)
        s3Config.authSchemes = [SigV4AuthScheme(requestUnsignedBody: true)]
    }

    func testS3PresignedRequest() async throws {
        let putObjectInput = PutObjectInput(
            body: .noStream,
            bucket: bucketName,
            key: key,
            metadata: ["filename": key]
        )

        // Upload
        let s3Client = S3Client(config: s3Config)
        _ = try await s3Client.putObject(input: putObjectInput)

        // Get
        let getObjectInput = GetObjectInput(bucket: bucketName, key: key)
        let fetchedObject = try await client.getObject(input: getObjectInput)

        XCTAssertNotNil(fetchedObject.metadata)
        let metadata = try XCTUnwrap(fetchedObject.metadata)
        XCTAssertEqual(metadata["filename"], key)
    }
}
