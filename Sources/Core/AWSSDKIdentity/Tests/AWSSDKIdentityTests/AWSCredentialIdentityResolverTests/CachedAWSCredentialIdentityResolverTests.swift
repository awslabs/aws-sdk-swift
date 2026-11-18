//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
@testable import class AWSSDKIdentity.CachedAWSCredentialIdentityResolver

class CachedAWSCredentialIdentityResolverTests: XCTestCase {

    actor Counter {
        private var value: Int = 0

        func increment() {
            value += 1
        }

        func get() -> Int {
            return value
        }
    }

    /// A manually-advanced clock, so cache expiration does not depend on wall-clock timing.
    actor TestClock {
        private(set) var now = Date(timeIntervalSince1970: 1_000_000)

        func advance(by interval: TimeInterval) {
            now = now.addingTimeInterval(interval)
        }
    }

    func testGetIdentity() async throws {
        let counter = Counter()
        let clock = TestClock()
        let accessKey = UUID().uuidString
        let secret = UUID().uuidString
        let accountID = UUID().uuidString
        let coreProvider = MockAWSCredentialIdentityResolver {
            await counter.increment()
            return .init(accessKey: accessKey, secret: secret, accountID: accountID)
        }
        let subject = CachedAWSCredentialIdentityResolver(
            source: coreProvider,
            refreshTime: 60.0,
            now: { await clock.now }
        )

        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()

        // Counter is 1 because the last three accesses use cached credentials
        let finalCount = await counter.get()
        XCTAssertEqual(finalCount, 1)

        // Just before expiration, cached credentials are still used
        await clock.advance(by: 59.0)
        _ = try await subject.getIdentity()
        let countBeforeExpiration = await counter.get()
        XCTAssertEqual(countBeforeExpiration, 1)

        // Advance to the refresh time so the cache expires
        await clock.advance(by: 1.0)
        let credentials = try await subject.getIdentity()

        // Counter is 2 because the cache expired
        let countAfterExpiration = await counter.get()
        XCTAssertEqual(countAfterExpiration, 2)
        XCTAssertEqual(credentials.accessKey, accessKey)
        XCTAssertEqual(credentials.secret, secret)
        XCTAssertEqual(credentials.accountID, accountID)
    }
}
