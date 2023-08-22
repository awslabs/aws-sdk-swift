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

class SSOCredentialsProviderTests: XCTestCase {
    let configPath = Bundle.module.path(forResource: "sso_tests", ofType: nil)!
    let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!
    
    func testCreateCredentialsProviderSSONonexistentProfile() async throws {
        XCTAssertThrowsError(try SSOCredentialsProvider(
            profileName: "asdf",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
            )
        )
        // SUCCESS: creation didn't throw error
    }
    
    func testCreateCredentialsProviderSSOLegacyProfile() async throws {
        _ = try SSOCredentialsProvider(
            profileName: "user",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        // SUCCESS: creation didn't throw error
    }
    
    func testCreateCredentialsProviderSSOTokenProviderProfile() async throws {
        _ = try SSOCredentialsProvider(
            profileName: "dev",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        // SUCCESS: creation didn't throw error
    }
    
    // TODO: add integration tests that automatically test that SSO crednetials provider correctly exchanges SSO token for temporary AWS credentails.
    // Manual integration testing confirmed SSOCredentialsProvider works as of 081723.
}
