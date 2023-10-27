//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import Foundation
import XCTest

@_spi(FileBasedConfig) @testable import AWSClientRuntime

class CachedCredentialsProviderTests: XCTestCase {

    func testGetCredentials() async throws {
        var counter: Int = 0
        let accessKey = UUID().uuidString
        let secret = UUID().uuidString
        let coreProvider = MockCredentialsProvider {
            counter += 1
            return .init(accessKey: accessKey, secret: secret)
        }
        let subject = try CachedCredentialsProvider(
            source: coreProvider,
            refreshTime: 0.01
        )

        _ = try await subject.getCredentials()
        _ = try await subject.getCredentials()
        _ = try await subject.getCredentials()
        _ = try await subject.getCredentials()

        // Counter is 1 because the last three accesses use cached credentials
        XCTAssertEqual(counter, 1)

        try! await Task.sleep(nanoseconds: 1_000_000_000 / 100)  // 0.01 seconds
        let credentials = try await subject.getCredentials()

        // Counter is 2 because we slept long enough for cache to expire
        XCTAssertEqual(counter, 2)
        XCTAssertEqual(credentials.accessKey, accessKey)
        XCTAssertEqual(credentials.secret, secret)
    }
}
