//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import SmithyHTTPAPI
import Foundation
import XCTest
import AWSS3
import AWSClientRuntime
@_spi(UnknownAWSHTTPServiceError) import struct AWSClientRuntime.UnknownAWSHTTPServiceError
import AwsCommonRuntimeKit
import ClientRuntime

public class MockHttpClientEngine: HTTPClient {

    // Public initializer
    public init() {}

    func successHttpResponse(request: SmithyHTTPAPI.HTTPRequest) -> HTTPResponse {
        let errorResponsePayload = """
            <Error>
                <Code>SlowDown</Code>
                <Message>Please reduce your request rate.</Message>
                <RequestId>K2H6N7ZGQT6WHCEG</RequestId>
                <HostId>WWoZlnK4pTjKCYn6eNV7GgOurabfqLkjbSyqTvDMGBaI9uwzyNhSaDhOCPs8paFGye7S6b/AB3A=</HostId>
            </Error>
        """
        request.withHeader(name: "Date", value: "Wed, 21 Oct 2015 07:28:00 GMT")
        return HTTPResponse(
            headers: request.headers,
            body: ByteStream.data(errorResponsePayload.data(using: .utf8)),
            statusCode: .ok
        )
    }

    public func send(request: SmithyHTTPAPI.HTTPRequest) async throws -> HTTPResponse {
        return successHttpResponse(request: request)
    }
}

class S3ErrorIn200Test: XCTestCase {

    override class func setUp() {
        AwsCommonRuntimeKit.CommonRuntimeKit.initialize()
    }

    /// S3Client throws expected error in response (200) with <Error> tag
    func test_foundExpectedError() async throws {
        let config = try await S3Client.S3ClientConfiguration(region: "us-west-2")
        config.httpClientEngine = MockHttpClientEngine()
        let client = S3Client(config: config)

        do {
            // any method on S3Client where the output shape doesnt have a stream
            _ = try await client.listBuckets(input: .init())
            XCTFail("Expected an error to be thrown, but it was not.")
        } catch let error as UnknownAWSHTTPServiceError {
            // check for the error we added in our mock client
            XCTAssertEqual("Please reduce your request rate.", error.message)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
