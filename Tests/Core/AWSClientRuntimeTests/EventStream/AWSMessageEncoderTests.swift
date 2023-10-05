//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSClientRuntime

final class AWSMessageEncoderTests: XCTestCase {

    let sut = AWSEventStream.AWSMessageEncoder()

    func testEncode_MessageWithAllHeaders() {
        let encodedMessage = try! sut.encode(message: validMessageWithAllHeaders)
        XCTAssertEqual(validMessageDataWithAllHeaders, encodedMessage)
    }

    func testEncode_MessageWithEmptyPayload() {
        let encodedMessage = try! sut.encode(message: validMessageEmptyPayload)
        XCTAssertEqual(validMessageDataEmptyPayload, encodedMessage)
    }

    func testEncode_MessageWithNoHeaders() {
        let encodedMessage = try! sut.encode(message: validMessageNoHeaders)
        XCTAssertEqual(validMessageDataNoHeaders, encodedMessage)
    }
}
