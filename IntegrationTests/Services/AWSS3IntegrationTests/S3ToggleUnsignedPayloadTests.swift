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
import SmithyHTTPAPI
import class SmithyStreams.BufferedStream

/// Tests toggle unsigned payload using S3.
class S3ToggleUnsignedPayloadTests: S3XCTestCase {
    private var s3Config: S3Client.S3ClientConfiguration!

    override func setUp() async throws {
        try await super.setUp()
        s3Config = try await S3Client.S3ClientConfiguration(region: region)
        s3Config.authSchemes = [SigV4AuthScheme(requestUnsignedBody: true)]
    }

    class CheckUnsignedPayloadHeader<InputType, OutputType>: Interceptor {
        typealias RequestType = HTTPRequest
        typealias ResponseType = HTTPResponse

        func readBeforeTransmit(context: some AfterSerialization<InputType, RequestType>) async throws {
            XCTAssertTrue(
                context.getRequest().headers.value(for: "x-amz-content-sha256") == "UNSIGNED-PAYLOAD"
            )
        }
    }

    class CheckStreamingUnsignedPayloadHeader<InputType, OutputType>: Interceptor {
        typealias RequestType = HTTPRequest
        typealias ResponseType = HTTPResponse

        func readBeforeTransmit(context: some AfterSerialization<InputType, RequestType>) async throws {
            XCTAssertTrue(
                context.getRequest().headers.value(for: "x-amz-content-sha256") == "STREAMING-UNSIGNED-PAYLOAD-TRAILER"
            )
        }
    }

    class CheckUnsignedPayloadHeaderProvider: HttpInterceptorProvider {
        func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
            return CheckUnsignedPayloadHeader()
        }
    }

    class CheckStreamingUnsignedPayloadHeaderProvider: HttpInterceptorProvider {
        func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
            return CheckStreamingUnsignedPayloadHeader()
        }
    }

    func testS3ToggleUnsignedPayloadNonStreaming() async throws {
        let key = "test.txt"
        let putObjectInput = PutObjectInput(
            body: .noStream,
            bucket: bucketName,
            key: key,
            metadata: ["filename": key]
        )

        // Upload
        s3Config.addInterceptorProvider(CheckUnsignedPayloadHeaderProvider())
        let s3Client = S3Client(config: s3Config)
        _ = try await s3Client.putObject(input: putObjectInput)

        // Get
        let getObjectInput = GetObjectInput(bucket: bucketName, key: key)
        let fetchedObject = try await client.getObject(input: getObjectInput)

        XCTAssertNotNil(fetchedObject.metadata)
        let metadata = try XCTUnwrap(fetchedObject.metadata)
        XCTAssertEqual(metadata["filename"], key)
    }

    func testS3ToggleUnsignedPayloadStreaming() async throws {
        let key = "test-streaming.txt"
        let data = S3XCTestCase.generateRandomTextData(ofSizeInMB: 1)
        let bufferedStream = BufferedStream(data: data, isClosed: true)
        let putObjectInput = PutObjectInput(
            body: .stream(bufferedStream),
            bucket: bucketName,
            key: key,
            metadata: ["filename": key]
        )

        // Upload
        s3Config.addInterceptorProvider(CheckStreamingUnsignedPayloadHeaderProvider())
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
