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
import AWSIntegrationTestUtils
import class SmithyStreams.BufferedStream

/// Tests toggle unsigned payload using S3.
class S3ToggleUnsignedPayloadTests: S3XCTestCase {

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
        let s3Config = try await S3Client.S3ClientConfiguration(
            region: region,
            authSchemes: [SigV4AuthScheme(requestUnsignedBody: true)],
            httpInterceptorProviders: [CheckUnsignedPayloadHeaderProvider()]
        )
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
        let data = generateRandomTextData(ofSizeInMB: 1)
        let bufferedStream = BufferedStream(data: data, isClosed: true)
        let putObjectInput = PutObjectInput(
            body: .stream(bufferedStream),
            bucket: bucketName,
            key: key,
            metadata: ["filename": key]
        )

        // Upload
        let s3Config = try await S3Client.S3ClientConfiguration(
            region: region,
            authSchemes: [SigV4AuthScheme(requestUnsignedBody: true)],
            httpInterceptorProviders: [CheckStreamingUnsignedPayloadHeaderProvider()]
        )
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
