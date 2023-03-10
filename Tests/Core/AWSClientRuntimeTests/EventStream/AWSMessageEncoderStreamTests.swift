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
    func testIterator_EndMessageSent() async throws {
        let baseStream = EventStream.AsyncInputStream<TestEvent>(AsyncThrowingStream<TestEvent, Error> { continuation in
            Task {
                continuation.yield(.allHeaders)
                continuation.yield(.emptyPayload)
                continuation.yield(.noHeaders)
                continuation.finish()
            }
        })

        let messageEncoder = AWSEventStream.AWSMessageEncoder()
        let context = HttpContextBuilder().withSigningRegion(value: "us-east-2")
            .withSigningName(value: "test")
            .withRequestSignature(value: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
            .withCredentialsProvider(value: MyCustomCredentialsProvider(credentials:
                    .init(accessKey: "fake access key", secret: "fake secret key")))
            .build()
        
        let messageSigner = AWSEventStream.AWSMessageSigner(context: context, encoder: messageEncoder)

        let sut = AWSEventStream.AWSMessageEncoderStream(stream: baseStream,
                                                         messageEncoder: messageEncoder,
                                                         requestEncoder: JSONEncoder(),
                                                         messageSinger: messageSigner)

        var actual: [Data] = []
        for try await data in sut {
            actual.append(data)
        }

        XCTAssertEqual(4, actual.count)
    }
}
