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

class DefaultChainCredentialsProviderTests: XCTestCase {
    func testGetCredentials() async {
        setenv("AWS_ACCESS_KEY_ID", "some_access_key_b", 1)
        setenv("AWS_SECRET_ACCESS_KEY", "some_secret_b", 1)
        
        defer {
            unsetenv("AWS_ACCESS_KEY_ID")
            unsetenv("AWS_SECRET_ACCESS_KEY")
        }
        
        do {
            let subject = try await DefaultChainCredentialsProvider()
            let credentials = try await subject.getCredentials()

            XCTAssertEqual(credentials.accessKey, "some_access_key_b")
            XCTAssertEqual(credentials.secret, "some_secret_b")
        } catch {
            XCTFail("Failed to create credentials")
        }
    }
}
