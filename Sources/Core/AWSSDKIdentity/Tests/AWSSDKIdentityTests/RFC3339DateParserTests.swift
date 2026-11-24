//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import enum AWSSDKIdentity.RFC3339DateParser

class RFC3339DateParserTests: XCTestCase {
    func testWithFractionalSecond() throws {
        let dateString = "2024-07-15T12:30:45.123Z"
        let parsedDate = RFC3339DateParser.parse(dateString)
        // 2024-07-15T12:30:45.123Z = 1721046645.123 seconds since Unix epoch
        // Compare to the millisecond; parsers may round the fraction to a neighboring Double.
        let parsedInterval = try XCTUnwrap(parsedDate).timeIntervalSince1970
        XCTAssertEqual(parsedInterval, 1_721_046_645.123, accuracy: 0.001)
    }

    func testWithoutFractionalSecond() {
        let dateString = "2024-07-15T12:30:45Z"
        let parsedDate = RFC3339DateParser.parse(dateString)
        // 2024-07-15T12:30:45Z = 1721046645 seconds since Unix epoch
        let expectedDate = Date(timeIntervalSince1970: 1_721_046_645)
        XCTAssertEqual(expectedDate, parsedDate)
    }

    func testWithTimeZoneOffset() {
        let dateString = "2024-07-15T14:30:45+02:00"
        let parsedDate = RFC3339DateParser.parse(dateString)
        // 2024-07-15T14:30:45+02:00 = 2024-07-15T12:30:45Z
        let expectedDate = Date(timeIntervalSince1970: 1_721_046_645)
        XCTAssertEqual(expectedDate, parsedDate)
    }

    func testWithFractionalSecondAndTimeZoneOffset() {
        let dateString = "2024-07-15T07:30:45.5-05:00"
        let parsedDate = RFC3339DateParser.parse(dateString)
        // 2024-07-15T07:30:45.5-05:00 = 2024-07-15T12:30:45.5Z
        let expectedDate = Date(timeIntervalSince1970: 1_721_046_645.5)
        XCTAssertEqual(expectedDate, parsedDate)
    }

    func testDateOnlyReturnsNil() {
        let dateString = "2024-07-15"
        let parsedDate = RFC3339DateParser.parse(dateString)
        XCTAssertNil(parsedDate)
    }

    func testInvalidDateReturnsNil() {
        let dateString = "not-a-date"
        let parsedDate = RFC3339DateParser.parse(dateString)
        XCTAssertNil(parsedDate)
    }
}
