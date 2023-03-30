//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import Foundation
import XCTest

@_spi(Internal) @testable import AWSClientRuntime

class CredentialsProviderFactoryTests: XCTestCase {
    
    let configuration = CredentialsProvider.Configuration(fileBasedConfigurationStore: try! CRTFiledBasedConfigurationStore())
    
    let configPath = Bundle.module.path(forResource: "config", ofType: nil)!
    let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!
    
    // MARK: - Custom
    
    func testCustomProvider() async {
        var provider = CredentialsProvider.custom(CustomProvider())
        try! await provider.configure(configuration)
        let credentials = try! await provider.getCredentials()
        
        XCTAssertEqual(provider.identifier, "Custom")
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
    
    // MARK: - Static
    
    func testStaticProvider() async {
        var provider = try! CredentialsProvider.fromStatic(.init(
            accessKey: "some_access_key",
            secret: "some_secret"
        ))
        try! await provider.configure(configuration)
        let credentials = try! await provider.getCredentials()
        
        XCTAssertEqual(provider.identifier, "Static")
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
    
    // MARK: - Environment
    
    func testEnvironmentProvider() async {
        setenv("AWS_ACCESS_KEY_ID", "some_access_key_a", 1)
        setenv("AWS_SECRET_ACCESS_KEY", "some_secret_a", 1)
        
        defer {
            unsetenv("AWS_ACCESS_KEY_ID")
            unsetenv("AWS_SECRET_ACCESS_KEY")
        }
        
        do {
            var provider = try CredentialsProvider.fromEnv()
            try await provider.configure(configuration)
            let credentials = try await provider.getCredentials()
            
            XCTAssertEqual(provider.identifier, "Environment")
            XCTAssertEqual(credentials.accessKey, "some_access_key_a")
            XCTAssertEqual(credentials.secret, "some_secret_a")
        } catch {
            XCTFail("Failed to create credentials")
        }
    }
    
    // MARK: - Profile
    
    func testProfileProviderUsingDefaultProfile() async {
        var provider = try! CredentialsProvider.fromProfile(.init(
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        ))
        try! await provider.configure(configuration)
        let credentials = try! await provider.getCredentials()
        
        XCTAssertEqual(provider.identifier, "Profile")
        XCTAssertEqual(credentials.accessKey, "access_key_default_cred")
        XCTAssertEqual(credentials.secret, "secret_default_cred")
    }
    
    func testProfileProviderUsingNamedProfileFromConfigFile() async {
        var provider = try! CredentialsProvider.fromProfile(.init(
            profileName: "credentials-provider-config-tests-profile",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        ))
        try! await provider.configure(configuration)
        let credentials = try! await provider.getCredentials()
        
        XCTAssertEqual(provider.identifier, "Profile")
        XCTAssertEqual(credentials.accessKey, "access_key_profile_config")
        XCTAssertEqual(credentials.secret, "secret_profile_config")
    }
    
    func testProfileProviderUsingNamedProfileFromCredentialsFile() async {
        var provider = try! CredentialsProvider.fromProfile(.init(
            profileName: "credentials-provider-creds-tests-profile",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        ))
        try! await provider.configure(configuration)
        let credentials = try! await provider.getCredentials()
        
        XCTAssertEqual(provider.identifier, "Profile")
        XCTAssertEqual(credentials.accessKey, "access_key_profile_cred")
        XCTAssertEqual(credentials.secret, "secret_profile_cred")
    }
    
    // MARK: - STS Assume Role
    
    func testSTSProvider() {
        let provider = try! CredentialsProvider.fromSTS(.init(
            credentialsProvider: .fromEnv(),
            roleArn: "some_role_arn",
            sessionName: "some_session_name"
        ))
        
        // For now we'll lean on CRT to test the implementation of this provider
        // so just assert that we created the expected provider.
        // TODO: Add an integration test for this provider
        XCTAssertEqual(provider.identifier, "STS Assume Role")
    }
    
    // MARK: - STS Web Identity
    
    func testSTSWebIdentityProvider() {
        let provider = try! CredentialsProvider.fromWebIdentity()
        
        // For now we'll lean on CRT to test the implementation of this provider
        // so just assert that we created the expected provider.
        // TODO: Add an integration test for this provider
        XCTAssertEqual(provider.identifier, "STS Web Identity")
    }
    
    // MARK: - Default Chain
    
    func testDefaultChain() async {
        setenv("AWS_ACCESS_KEY_ID", "some_access_key_b", 1)
        setenv("AWS_SECRET_ACCESS_KEY", "some_secret_b", 1)
        
        defer {
            unsetenv("AWS_ACCESS_KEY_ID")
            unsetenv("AWS_SECRET_ACCESS_KEY")
        }
        
        do {
            var provider = try CredentialsProvider.fromDefaultChain()
            try await provider.configure(configuration)
            let credentials = try await provider.getCredentials()
            
            XCTAssertEqual(provider.identifier, "Default Chain")
            XCTAssertEqual(credentials.accessKey, "some_access_key_b")
            XCTAssertEqual(credentials.secret, "some_secret_b")
        } catch {
            XCTFail("Failed to create credentials")
        }
    }
    
    // MARK: - Cached
    
    func testCached() async {
        var counter: Int = 0
        let coreProvider = AnyCustomProvider {
            counter += 1
            return .init(accessKey: "some_access_key", secret: "some_secret")
        }
        
        var provider = try! CredentialsProvider.fromCached(.init(
            source: .custom(coreProvider),
            refreshTime: 2
        ))
        try! await provider.configure(configuration)
        
        _ = try! await provider.getCredentials()
        _ = try! await provider.getCredentials()
        _ = try! await provider.getCredentials()
        _ = try! await provider.getCredentials()
        
        XCTAssertEqual(counter, 1)
        
        try! await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        
        let credentials = try! await provider.getCredentials()
        
        XCTAssertEqual(counter, 2)
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
}

// MARK: - Helpers

struct CustomProvider: CredentialsProviding {
    func getCredentials() async throws -> Credentials {
        .init(accessKey: "some_access_key", secret: "some_secret")
    }
}

struct AnyCustomProvider: CredentialsProviding {
    let _getCredentials: () async throws -> Credentials
    init(_ _getCredentials: @escaping () async throws -> Credentials) {
        self._getCredentials = _getCredentials
    }
    func getCredentials() async throws -> Credentials {
        try await _getCredentials()
    }
}
