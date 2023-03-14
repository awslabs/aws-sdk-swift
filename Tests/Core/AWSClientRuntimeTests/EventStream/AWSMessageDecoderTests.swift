//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSClientRuntime

final class AWSMessageDecoderTests: XCTestCase {

    let sut = AWSEventStream.AWSMessageDecoder()

    func testDecode_MessageWithAllHeaders() {
        try! sut.feed(data: validMessageDataWithAllHeaders)
        let decodedMessage = try! sut.message()
        XCTAssertEqual(validMessageWithAllHeaders, decodedMessage)
    }

    func testDecode_MessageWithEmptyPayload() {
        try! sut.feed(data: validMessageDataEmptyPayload)
        let decodedMessage = try! sut.message()
        XCTAssertEqual(validMessageEmptyPayload, decodedMessage)
    }

    func testDecode_MessageWithNoHeaders() {
        try! sut.feed(data: validMessageDataNoHeaders)
        let decodedMessage = try! sut.message()
        XCTAssertEqual(validMessageNoHeaders, decodedMessage)
    }

    func testEndOfStream_StreamClosed() {
        try! sut.feed(data: validMessageDataNoHeaders[0..<validMessageDataNoHeaders.count-1])
        XCTAssertThrowsError(try sut.endOfStream()) { error in
            guard case AWSEventStreamError.decoding(let message) = error else {
                return XCTFail()
            }

            XCTAssertEqual("Stream ended before message was complete", message)
        }
    }
}
