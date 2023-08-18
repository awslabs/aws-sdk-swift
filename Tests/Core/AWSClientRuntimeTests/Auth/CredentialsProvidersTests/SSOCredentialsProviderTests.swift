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
    
    func testCreateCredentialsProviderSSOLegacyProfile() async throws {
        let provider = try SSOCredentialsProvider(
            profileName: "user",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath)
        XCTAssertNotNil(provider)
    }
    
    func testCreateCredentialsProviderSSOTokenProviderProfile() async throws {
        let provider = try SSOCredentialsProvider(
            profileName: "dev",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath)
        XCTAssertNotNil(provider)
    }
    
    
    // TODO: add integration tests that automatically test that SSO crednetials provider correctly exchanges SSO token for temporary AWS credentails.
    // End-to-end manual testing confirmed SSOCredentialsProvider works as of 081723.
}
