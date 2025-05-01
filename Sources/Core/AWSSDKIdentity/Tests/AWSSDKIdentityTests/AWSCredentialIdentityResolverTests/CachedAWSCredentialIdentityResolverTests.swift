//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import struct AWSSDKIdentity.CachedAWSCredentialIdentityResolver

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

    func testGetIdentity() async throws {
        let counter = Counter()
        let accessKey = UUID().uuidString
        let secret = UUID().uuidString
        let accountID = UUID().uuidString
        let coreProvider = MockAWSCredentialIdentityResolver {
            await counter.increment()
            return .init(accessKey: accessKey, secret: secret, accountID: accountID)
        }
        let subject = try CachedAWSCredentialIdentityResolver(
            source: coreProvider,
            refreshTime: 0.01
        )

        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()

        // Counter is 1 because the last three accesses use cached credentials
        let finalCount = await counter.get()
        XCTAssertEqual(finalCount, 1)

        try! await Task.sleep(nanoseconds: 1_000_000_000 / 100)  // 0.01 seconds
        let credentials = try await subject.getIdentity()

        // Counter is 2 because we slept long enough for cache to expire
        let countAfterSleep = await counter.get()
        XCTAssertEqual(countAfterSleep, 2)
        XCTAssertEqual(credentials.accessKey, accessKey)
        XCTAssertEqual(credentials.secret, secret)
        XCTAssertEqual(credentials.accountID, accountID)
    }
}
