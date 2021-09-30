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

extension Formatter {
    // Inspired from:
    // https://stackoverflow.com/questions/28016578/how-can-i-parse-create-a-date-time-stamp-formatted-with-fractional-seconds-utc
    static let iso8601withFractionalSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        return formatter
    }()
}

class Sigv4SigningTests: XCTestCase {
    override func setUp() {
        AwsCommonRuntimeKit.initialize()
    }

    struct MyCustomCredentialsProvider: CredentialsProvider {
        func getCredentials() throws -> AWSCredentials {
            return AWSCredentials(accessKey: "AKIDEXAMPLE", secret: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY", expirationTimeout: 30)
        }
    }

    func testPresigner() throws {
        let dateString = "20150830T123600Z"
        let dateFormatter = ISO8601DateFormatter.iso8601withFractionalSeconds
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
        
        guard let url = AWSSigV4Signer.sigV4SignedURL(requestBuilder: requestBuilder,
                                                credentialsProvider: MyCustomCredentialsProvider(),
                                                signingName: "service",
                                                signingRegion: "us-east-1",
                                                date: date,
                                                expiration: 86400) else {
            XCTFail("Unable to generate URL")
            return
        }
        XCTAssertEqual("http://example.amazonaws.com:443?%E1%88%B4=bar&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIDEXAMPLE/20150830/us-east-1/service/aws4_request&X-Amz-Date=20150830T123600Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Signature=32dea9080047b41e56ee852fe3eba49dae1911b9c5e5728cc1691704f168c70f", url.absoluteString)
    }
}

