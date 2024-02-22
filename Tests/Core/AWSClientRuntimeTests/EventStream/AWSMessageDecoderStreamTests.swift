//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
@testable import AWSClientRuntime

final class AWSMessageDecoderStreamTests: XCTestCase {
    func testIterator() async throws {
        let bufferedStream = BufferedStream(data: validMessageDataWithAllHeaders + validMessageDataEmptyPayload + validMessageDataNoHeaders,
                                            isClosed: true)
        let messageDecoder = AWSEventStream.AWSMessageDecoder()
        let sut = EventStream.DefaultMessageDecoderStream<TestEvent>(
            stream: bufferedStream,
            messageDecoder: messageDecoder,
            unmarshalClosure: jsonUnmarshalClosure(responseDecoder: JSONDecoder())
        )

        var events: [TestEvent] = []
        for try await evnt in sut {
            events.append(evnt)
        }

        XCTAssertEqual(3, events.count)
        XCTAssertEqual(TestEvent.allHeaders, events[0])
        XCTAssertEqual(TestEvent.emptyPayload, events[1])
        XCTAssertEqual(TestEvent.noHeaders, events[2])
    }
}
