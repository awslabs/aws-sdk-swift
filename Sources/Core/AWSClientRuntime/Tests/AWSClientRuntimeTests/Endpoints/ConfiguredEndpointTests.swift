//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable @_spi(FileBasedConfig) import AWSClientRuntime
@_spi(FileBasedConfig) @testable import AWSSDKCommon

class ConfiguredEndpointTests: XCTestCase {
    // Shared values
    let fileBasedConfig = try! CRTFileBasedConfiguration(
        configFilePath: Bundle.module.path(forResource: "configured_endpoint_tests", ofType: nil)!
    )
    let sdkID = "Test Service"

    // After each test, unset all environment variables that could've been set
    override func tearDown() {
        unsetenv("AWS_PROFILE")
        unsetenv("AWS_ENDPOINT_URL")
        unsetenv("AWS_ENDPOINT_URL_TEST_SERVICE")
        unsetenv("AWS_IGNORE_CONFIGURED_ENDPOINT_URLS")
    }

    /*
        DISABLE FLAG TESTS

        Needs to resolve furthest left option for flag:
            client-config | env-var | shared-config-file
     */

    func testClientConfigDisableFlag() {
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: true,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertNil(resolvedEndpoint)
    }

    func testEnvVarDisableFlag() {
        setenv("AWS_IGNORE_CONFIGURED_ENDPOINT_URLS", "true", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertNil(resolvedEndpoint)
    }

    func testSharedConfigFileDisableFlag() {
        setenv("AWS_PROFILE", "ignoreConfiguredEndpointProfile", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertNil(resolvedEndpoint)
    }

    /*
        CONFIGURED ENDPOINT RESOLUTION TESTS

        Needs to resolve furthest left option for configured endpoint:
            service-specific-env-var | global-env-var | service-specific-config-file | global-config-file
        *client-config is handled implicitly by executing configured endpoint resolution only if user didn't provide it
     */

    func testResolveServiceSpecificEnvVar() {
        setenv("AWS_ENDPOINT_URL", "https://env-global.com:9000", 1)
        setenv("AWS_ENDPOINT_URL_TEST_SERVICE", "https://env-specific.com:9000", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(resolvedEndpoint, "https://env-specific.com:9000")
    }

    func testResolveGlobalEnvVar() {
        setenv("AWS_ENDPOINT_URL", "https://env-global.com:9000", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(resolvedEndpoint, "https://env-global.com:9000")
    }

    func testResolveServiceSpecificConfig() {
        setenv("AWS_PROFILE", "serviceSpecificConfiguredEndpointProfile", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(resolvedEndpoint, "https://config-specific.com:1000")
    }

    func testResolveGlobalConfigWhenMissingServicesSection() {
        setenv("AWS_PROFILE", "serviceSpecificConfiguredEndpointProfile", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: "absent-service-name",
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(resolvedEndpoint, "https://config-global.com:2000")
    }

    func testResolveGlobalConfigwhenMissingMatchingServiceSubsection() {
        setenv("AWS_PROFILE", "globalConfiguredEndpointProfile", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertEqual(resolvedEndpoint, "https://config-global.com:1000")
    }

    func testResolveNilWhenNothingIsConfigured() {
        setenv("AWS_PROFILE", "noConfiguredEndpointProfile", 1)
        let resolvedEndpoint = AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: nil,
            fileBasedConfig: fileBasedConfig
        )
        XCTAssertNil(resolvedEndpoint)
    }
}
