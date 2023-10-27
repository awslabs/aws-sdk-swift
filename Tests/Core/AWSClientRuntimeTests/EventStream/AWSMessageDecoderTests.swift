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

    func testDecode_MessageWithInitialResponse() {
        try! sut.feed(data: validInitialResponseMessageData)
        let decodedMessage = try! sut.message()
        // initialResponse message should not be added to the messageBuffer
        XCTAssertNil(decodedMessage)
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

    func testAwaitInitialResponse_MessageWithInitialResponse() async {
        try! sut.feed(data: validInitialResponseMessageData)
        guard let initialResponse = await sut.awaitInitialResponse() else {
            XCTFail("Error!")
            return
        }

        var someMetadata: Tag? = nil

        // test expected codegen
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode([String: String].self, from: initialResponse)
            someMetadata = response["someMetadata"].map { value in Tag(value: value) }
        } catch {
            print("Error decoding JSON: \(error)")
            someMetadata = nil
        }

        XCTAssertEqual(
            String(data: validInitialResponseMessage.payload, encoding: .utf8),
            String(data: initialResponse, encoding: .utf8)
        )

        XCTAssertEqual(someMetadata?.value, "test")
    }
}

private struct Tag: Swift.Equatable {
    /// The key of the tag. Constraints: Tag keys are case-sensitive and accept a maximum of 127 Unicode characters. May not begin with aws:.
    public var key: Swift.String?
    /// The value of the tag. Constraints: Tag values are case-sensitive and accept a maximum of 256 Unicode characters.
    public var value: Swift.String?

    public init(
        key: Swift.String? = nil,
        value: Swift.String? = nil
    )
    {
        self.key = key
        self.value = value
    }
}
