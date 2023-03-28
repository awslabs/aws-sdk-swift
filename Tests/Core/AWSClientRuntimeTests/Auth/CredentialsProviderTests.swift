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

class CredentialsProviderTests: XCTestCase {
    
    let configuration = CredentialsProvider.Configuration(fileBasedConfigurationStore: try! CRTFiledBasedConfigurationStore())
    
    let credentialsProvider = try! CredentialsProvider.fromStatic(.init(
        accessKey: "some_access_key",
        secret: "some_secret"
    ))
    
    // MARK: - Configuration Tests
    
    func testCredentialsProviderCanOnlyBeConfiguredOnce() async {
        var credentialsProviderA = credentialsProvider
        
        do {
            try await credentialsProviderA.configure(configuration)
        } catch {
            XCTFail("Configuring a credentials provider should succeed the first time its configured.")
        }
        
        do {
            try await credentialsProviderA.configure(configuration)
            XCTFail("Configuring a credentials provider should fail if its already been configured.")
        } catch {
            XCTAssertTrue(error is ClientError)
        }
        
        // Calling confgiure on this provider should succeed
        // since the original copy was never configured.
        var credentialsProviderB = credentialsProvider
        
        do {
            try await credentialsProviderB.configure(configuration)
        } catch {
            XCTFail("Configuring a credentials provider should succeed the first time its configured.")
        }
    }
    
    // MARK: - getCredentials Tests

    func testGetCredentialsFailsIfNotConfigured() async {
        do {
            let _ = try await credentialsProvider.getCredentials()
            XCTFail("getCredentials should fail if the credentials provider is not configured.")
        } catch {
            XCTAssertTrue(error is ClientError)
        }
    }
    
    func testGetCredentialsSucceedsIfConfigured() async {
        var credentialsProviderA = credentialsProvider
        try! await credentialsProviderA.configure(configuration)
        let credentials = try! await credentialsProviderA.getCredentials()
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
    
    // MARK: - resolvedProvider Tests
    
    func testResolvedProviderDefaultsToDefaultChain() async {
        let resolvedProvider = try! await CredentialsProvider.resolvedProvider(
            nil,
            configuration: configuration
        )
        XCTAssertEqual(resolvedProvider.identifier, "Default Chain")
    }
    
    func testResolvedProviderUsesPassedInProvider() async {
        let resolvedProvider = try! await CredentialsProvider.resolvedProvider(
            credentialsProvider,
            configuration: configuration
        )
        XCTAssertEqual(resolvedProvider.identifier, "Static")
    }
    
    func testResolvedProviderConfiguresTheProvider() async {
        let resolvedProvider = try! await CredentialsProvider.resolvedProvider(
            credentialsProvider,
            configuration: configuration
        )
        let credentials = try! await resolvedProvider.getCredentials()
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
    
    // MARK: - CRT Tests
    
    func testMakeWithCRTProvider() async {
        let crtProvider = try! CRTCredentialsProvider.init(source: .static(
            accessKey: "some_access_key",
            secret: "some_secret"
        ))
        
        var provider = CredentialsProvider.makeWithCRTCredentialsProvider(identifier: "some_id") { _configuration in
            return crtProvider
        }
        try! await provider.configure(self.configuration)
        
        let credentials = try! await provider.getCredentials()
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
        XCTAssertEqual(provider.identifier, "some_id")
    }
}
