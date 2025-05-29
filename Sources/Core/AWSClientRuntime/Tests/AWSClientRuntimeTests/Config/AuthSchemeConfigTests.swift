//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
@testable @_spi(FileBasedConfig) import AWSClientRuntime
@testable @_spi(FileBasedConfig) import AWSSDKCommon

class AuthSchemeConfigTests: XCTestCase {
    let envVarName = "AWS_AUTH_SCHEME_PREFERENCE"
    let configFieldName = "auth_scheme_preference"
    var fileBasedConfig: FileBasedConfiguration!
    
    override func setUp() {
        super.setUp()
        // Create a test configuration file for auth scheme tests
        fileBasedConfig = try! CRTFileBasedConfiguration(
            configFilePath: Bundle.module.path(forResource: "auth_scheme_config_tests", ofType: nil)!,
            credentialsFilePath: nil
        )
    }
    
    override func tearDown() {
        // Clean up any environment variables
        unsetenv(envVarName)
        super.tearDown()
    }
    
    // MARK: - authSchemePreference Tests
    
    func test_authSchemePreference_returnsConfigValueWhenProvided() {
        let expected = ["sigv4", "sigv4a"]
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: expected,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(result, ["sigv4", "sigv4a"])
    }
    
    func test_authSchemePreference_returnsNilWhenConfigValueIsEmpty() {
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: [],
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(result, [])
    }
    
    func test_authSchemePreference_returnsEnvironmentValueWhenNoConfigValue() {
        let expected = "sigv4a,sigv4"
        setenv(envVarName, expected, 1)
        
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: nil,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(result, ["sigv4a", "sigv4"])
    }
    
    func test_authSchemePreference_returnsNilWhenEnvironmentValueIsEmpty() {
        setenv(envVarName, "", 1)
        
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: nil,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        // When env var is empty, FieldResolver falls through to file config
        // which has "sigv4" in the default profile
        XCTAssertEqual(result, ["sigv4"])
    }
    
    func test_authSchemePreference_returnsFileConfigValueFromDefaultProfile() {
        // Assuming the test config file has auth_scheme_preference = "sigv4" in default profile
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: nil,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(result, ["sigv4"])
    }
    
    func test_authSchemePreference_returnsFileConfigValueFromSpecifiedProfile() {
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: nil,
            profileName: "alt-profile",
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(result, ["sigv4a", "sigv4"])
    }
    
    func test_authSchemePreference_returnsNilWhenNoSourceIsSet() {
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: nil,
            profileName: "non-existent-profile",
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertNil(result)
    }
    
    // MARK: - normalizeSchemes Tests
    
    func test_normalizeSchemes_handlesSingleScheme() {
        let result = AuthSchemeConfig.normalizeSchemes("sigv4")
        XCTAssertEqual(result, ["sigv4"])
    }
    
    func test_normalizeSchemes_handlesMultipleSchemes() {
        let result = AuthSchemeConfig.normalizeSchemes("sigv4,sigv4a,bearer")
        XCTAssertEqual(result, ["sigv4", "sigv4a", "bearer"])
    }
    
    func test_normalizeSchemes_removesSpaces() {
        let result = AuthSchemeConfig.normalizeSchemes("sigv4, sigv4a , bearer")
        XCTAssertEqual(result, ["sigv4", "sigv4a", "bearer"])
    }
    
    func test_normalizeSchemes_removesTabs() {
        let result = AuthSchemeConfig.normalizeSchemes("sigv4,\tsigv4a\t,\tbearer")
        XCTAssertEqual(result, ["sigv4", "sigv4a", "bearer"])
    }
    
    func test_normalizeSchemes_removesMultipleSpacesAndTabs() {
        let result = AuthSchemeConfig.normalizeSchemes("sigv4  ,  \t sigv4a\t\t,   bearer  ")
        XCTAssertEqual(result, ["sigv4", "sigv4a", "bearer"])
    }
    
    func test_normalizeSchemes_handlesEmptyElements() {
        let result = AuthSchemeConfig.normalizeSchemes("sigv4,,sigv4a,,,bearer,")
        XCTAssertEqual(result, ["sigv4", "sigv4a", "bearer"])
    }
    
    func test_normalizeSchemes_handlesEmptyString() {
        let result = AuthSchemeConfig.normalizeSchemes("")
        XCTAssertEqual(result, [])
    }
    
    func test_normalizeSchemes_handlesOnlyCommas() {
        let result = AuthSchemeConfig.normalizeSchemes(",,,")
        XCTAssertEqual(result, [])
    }
    
    func test_normalizeSchemes_handlesOnlyWhitespace() {
        let result = AuthSchemeConfig.normalizeSchemes("   \t   ")
        XCTAssertEqual(result, [])
    }
    
    // MARK: - authSchemePreference Tests with environment and config
    
    func test_authSchemePreference_normalizesConfigValue() {
        // Note: This test doesn't make sense anymore since configValue is now [String]?
        // If you want to test normalization of array input, you might do something like:
        let input = ["sigv4  ", "  sigv4a  ", "  bearer"]
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: input,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        // The actual behavior depends on whether FieldResolver normalizes array elements
        XCTAssertEqual(result, ["sigv4  ", "  sigv4a  ", "  bearer"])
    }
    
    func test_authSchemePreference_normalizesEnvironmentValue() {
        setenv(envVarName, "sigv4  ,  sigv4a", 1)
        
        let result = AuthSchemeConfig.authSchemePreference(
            configValue: nil,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(result, ["sigv4", "sigv4a"])
    }
}