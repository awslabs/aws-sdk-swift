//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import struct Foundation.Date
@testable import AWSSDKIdentity

class IdentityProvidingSSOClientTests: XCTestCase {

    /// The SSO `GetRoleCredentials` response expresses expiration as epoch milliseconds,
    /// not as a number of seconds until expiration.
    func testExpirationDateIsReadAsEpochMilliseconds() {
        // 2026-10-07T16:56:26Z
        let subject = IdentityProvidingSSOClient.expirationDate(epochMilliseconds: 1_791_401_786_000)
        XCTAssertEqual(subject, Date(timeIntervalSince1970: 1_791_401_786))
    }

    func testExpirationDatePreservesMillisecondPrecision() {
        let subject = IdentityProvidingSSOClient.expirationDate(epochMilliseconds: 1_791_401_786_500)
        XCTAssertEqual(subject.timeIntervalSince1970, 1_791_401_786.5, accuracy: 0.001)
    }
}
