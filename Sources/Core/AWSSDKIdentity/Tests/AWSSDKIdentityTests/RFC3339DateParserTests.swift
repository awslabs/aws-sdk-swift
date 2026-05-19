//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import enum AWSSDKIdentity.RFC3339DateParser

class RFC3339DateParserTests: XCTestCase {
    func testWithFractionalSecond() {
        let dateString = "2024-07-15T12:30:45.123Z"
        let parsedDate = RFC3339DateParser.parse(dateString)
        // 2024-07-15T12:30:45.123Z = 1721046645.123 seconds since Unix epoch
        let expectedDate = Date(timeIntervalSince1970: 1_721_046_645.123)
        XCTAssertEqual(expectedDate, parsedDate)
    }

    func testWithoutFractionalSecond() {
        let dateString = "2024-07-15T12:30:45Z"
        let parsedDate = RFC3339DateParser.parse(dateString)
        // 2024-07-15T12:30:45Z = 1721046645 seconds since Unix epoch
        let expectedDate = Date(timeIntervalSince1970: 1_721_046_645)
        XCTAssertEqual(expectedDate, parsedDate)
    }

    func testInvalidDateReturnsNil() {
        let dateString = "not-a-date"
        let parsedDate = RFC3339DateParser.parse(dateString)
        XCTAssertNil(parsedDate)
    }
}
