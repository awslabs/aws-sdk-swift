//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
@testable import AWSClientRuntime

final class AWSMessageEncoderStreamTests: XCTestCase {
    func testIterator_EndMessageSent() async {
        let baseStream = AsyncThrowingStream { continuation in
            Task {
                continuation.yield(validMessageWithAllHeaders)
                continuation.yield(validMessageEmptyPayload)
                continuation.yield(validMessageNoHeaders)
                continuation.finish()
            }
        }

        let encoder = AWSEventStream.AWSMessageEncoder()
        let context = HttpContextBuilder().withSigningRegion(value: "us-east-2")
            .withSigningName(value: "test")
            .withRequestSignature(value: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
            .withCredentialsProvider(value: MyCustomCredentialsProvider(credentials:
                    .init(accessKey: "fake access key", secret: "fake secret key")))
            .build()
        let signingConfig = try! await context.makeEventStreamSigningConfig()

        let sut = AWSEventStream.AWSMessageEncoderStream(stream: baseStream,
                                          encoder: encoder,
                                          signingConfig: signingConfig,
                                          requestSignature: context.getRequestSignature()!)

        var actual: [Data] = []
        for await data in sut {
            actual.append(data)
        }

        XCTAssertEqual(4, actual.count)
    }
}
