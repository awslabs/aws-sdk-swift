//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import SmithyTimestamps
import XCTest

@testable import AWSClientRuntime

class Sigv4SigningTests: XCTestCase {
    override func setUp() {
        CommonRuntimeKit.initialize()
    }

    func testPresigner() async throws {
        let dateString = "2015-08-30T12:36:00Z"
        guard let date = TimestampFormatter(format: .dateTime).date(from: dateString) else {
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
            .withQueryItem(SDKURLQueryItem(name: "%E1%88%B4", value: "bar"))

        guard let url = await AWSSigV4Signer.sigV4SignedURL(requestBuilder: requestBuilder,
                                                            credentialsProvider: MyCustomCredentialsProvider(),
                                                            signingName: "service",
                                                            signingRegion: "us-east-1",
                                                            date: date,
                                                            expiration: 86400,
                                                            signingAlgorithm: .sigv4) else {
            XCTFail("Unable to generate URL")
            return
        }
        XCTAssertEqual("http://example.amazonaws.com?%E1%88%B4=bar&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIDEXAMPLE%2F20150830%2Fus-east-1%2Fservice%2Faws4_request&X-Amz-Date=20150830T123600Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Signature=32dea9080047b41e56ee852fe3eba49dae1911b9c5e5728cc1691704f168c70f", url.absoluteString)
    }

    func testSignEvent() async {
        let credentials = AWSCredentials(accessKey: "fake access key", secret: "fake secret key")
        
        let encoder = AWSEventStream.AWSMessageEncoder()

        let message = EventStream.Message(
            headers: [
                .init(name: "some-header", value: .string("value")),
            ],
            payload: "test payload".data(using: .utf8)!
        )

        // create Date with fractional seconds
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let epoch = formatter.date(from: "1973-11-29T21:33:09.000001234Z")!
        
        let credentialsProvider = try! StaticCredentialsProvider(
            credentials
        )
        
        let context = HttpContextBuilder()
            .withSigningName(value: "testservice")
            .withRegion(value: "us-east-1")
            .withCredentialsProvider(value: credentialsProvider)
            .build()
        
        let signingConfig = try! await context.makeEventStreamSigningConfig(date: epoch.withoutFractionalSeconds())

        let prevSignature = try! "last message sts".data(using: .utf8)!.computeSHA256().encodeToHexString()

        let messagePayload = try! encoder.encode(message: message)

        let result = try! await AWSSigV4Signer.signEvent(payload: messagePayload,
                                                         previousSignature: prevSignature,
                                                         signingConfig: signingConfig)
        XCTAssertEqual(":date", result.output.headers[0].name)

        guard case let .timestamp(dateHeaderValue) = result.output.headers[0].value else {
            XCTFail()
            return
        }

        XCTAssertEqual(epoch.timeIntervalSince1970, dateHeaderValue.timeIntervalSince1970)

        XCTAssertEqual(":chunk-signature", result.output.headers[1].name)
        print(result.signature)
        guard case let .byteArray(actualSignatureBuffer) = result.output.headers[1].value else {
            XCTFail()
            return
        }
        let actualSignature = actualSignatureBuffer.encodeToHexString()
        XCTAssertEqual(result.signature, actualSignature)

        let expected = "1ea04a4f6becd85ae3e38e379ffaf4bb95042603f209512476cc6416868b31ee"
        XCTAssertEqual(expected, actualSignature)
    }
}

class MyCustomCredentialsProvider: AWSClientRuntime.CredentialsProviding {
    let credentials: AWSCredentials
    
    init(credentials: AWSCredentials) {
        self.credentials = credentials
    }
    
    convenience init() {
        self.init(credentials: AWSCredentials(
            accessKey: "AKIDEXAMPLE",
            secret: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY",
            expirationTimeout: .init(timeIntervalSinceNow: 30)
        ))
    }
    
    func getCredentials() async throws -> AWSClientRuntime.AWSCredentials {
        return AWSCredentials(
            accessKey: "AKIDEXAMPLE",
            secret: "wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY",
            expirationTimeout: .init(timeIntervalSinceNow: 30)
        )
    }
}
