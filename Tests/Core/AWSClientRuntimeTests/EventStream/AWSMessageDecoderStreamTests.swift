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
        let decoder = AWSEventStream.AWSMessageDecoder()
        let sut = AWSEventStream.AWSMessageDecoderStream(stream: bufferedStream, decoder: decoder)

        var decoded: [EventStream.Message] = []
        for try await message in sut {
            decoded.append(message)
        }

        XCTAssertEqual(3, decoded.count)
        XCTAssertEqual(validMessageWithAllHeaders, decoded[0])
        XCTAssertEqual(validMessageEmptyPayload, decoded[1])
        XCTAssertEqual(validMessageNoHeaders, decoded[2])
    }
}
