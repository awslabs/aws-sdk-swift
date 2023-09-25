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
    func testGetIdentity() async throws {
        var counter: Int = 0
        let coreProvider = MockCredentialsProvider {
            counter += 1
            return .init(accessKey: "some_access_key", secret: "some_secret")
        }
        
        let subject = try CachedCredentialsProvider(
            source: coreProvider,
            refreshTime: 1
        )
        
        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()
        _ = try await subject.getIdentity()
        
        XCTAssertEqual(counter, 1)
        
        try! await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        let credentials = try! await subject.getIdentity()
        
        XCTAssertEqual(counter, 2)
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
}
