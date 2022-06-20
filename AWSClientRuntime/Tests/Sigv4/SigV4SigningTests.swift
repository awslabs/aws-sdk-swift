//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import XCTest

@testable import AWSClientRuntime

class Sigv4SigningTests: XCTestCase {
    override func setUp() {
        AwsCommonRuntimeKit.initialize()
    }

    struct MyCustomCredentialsProvider: CredentialsProvider {
        func getCredentials() async throws -> AWSCredentials {
            return AWSCredentials(accessKey: "AKIDEXAMPLE", secret: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY", expirationTimeout: 30)
        }
    }

    func testPresigner() async throws {
        let dateString = "2015-08-30T12:36:00Z"
        let dateFormatter = DateFormatter.iso8601DateFormatterWithoutFractionalSeconds
        guard let date = dateFormatter.date(from: dateString) else {
            XCTFail("Unable to parse date")
            return
        }

        
        let requestBuilder = SdkHttpRequestBuilder()
            .withHost("example.amazonaws.com")
            .withPath("")
            .withMethod(.get)
            .withPort(443)
            .withProtocol(.http)
            .withHeader(name: "host", value: "example.amazonaws.com")
            .withQueryItem(URLQueryItem(name: "%E1%88%B4", value: "bar"))
        
        guard let url = await AWSSigV4Signer.sigV4SignedURL(requestBuilder: requestBuilder,
                                                credentialsProvider: MyCustomCredentialsProvider(),
                                                signingName: "service",
                                                signingRegion: "us-east-1",
                                                date: date,
                                                expiration: 86400) else {
            XCTFail("Unable to generate URL")
            return
        }
        XCTAssertEqual("http://example.amazonaws.com?%E1%88%B4=bar&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIDEXAMPLE%2F20150830%2Fus-east-1%2Fservice%2Faws4_request&X-Amz-Date=20150830T123600Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Signature=32dea9080047b41e56ee852fe3eba49dae1911b9c5e5728cc1691704f168c70f", url.absoluteString)
    }
}

