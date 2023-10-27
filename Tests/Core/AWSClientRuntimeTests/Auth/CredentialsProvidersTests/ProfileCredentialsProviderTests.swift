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

class ProfileCredentialsProviderTests: XCTestCase {
        let configPath = Bundle.module.path(forResource: "config", ofType: nil)!
        let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!
    
    func testGetCredentialsWithDefaultProfile() async throws {
        let subject = try ProfileCredentialsProvider(
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try await subject.getCredentials()
        
        XCTAssertEqual(credentials.accessKey, "access_key_default_cred")
        XCTAssertEqual(credentials.secret, "secret_default_cred")
    }
    
    func testGetCredentialsWithNamedProfileFromConfigFile() async throws {
        let subject = try ProfileCredentialsProvider(
            profileName: "credentials-provider-config-tests-profile",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try await subject.getCredentials()
        
        XCTAssertEqual(credentials.accessKey, "access_key_profile_config")
        XCTAssertEqual(credentials.secret, "secret_profile_config")
    }
    
    func testGetCredentialsWithNamedProfileFromCredentialsFile() async throws {
        let subject = try ProfileCredentialsProvider(
            profileName: "credentials-provider-creds-tests-profile",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try await subject.getCredentials()
        
        XCTAssertEqual(credentials.accessKey, "access_key_profile_cred")
        XCTAssertEqual(credentials.secret, "secret_profile_cred")
    }
}
