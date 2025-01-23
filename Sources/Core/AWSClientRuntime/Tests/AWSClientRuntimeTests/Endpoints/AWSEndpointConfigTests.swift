//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable @_spi(FileBasedConfig) import AWSClientRuntime
@_spi(FileBasedConfig) @testable import AWSSDKCommon

class AWSEndpointConfigTests: XCTestCase {
    var fileBasedConfig: FileBasedConfiguration = try! CRTFileBasedConfiguration(
        configFilePath: Bundle.module.path(forResource: "aws_endpoint_config_tests", ofType: nil)!,
        credentialsFilePath: nil
    )

    // MARK: - accountIdEndpointMode

    func test_accountIdEndpointMode_resolvesAConfigValue() throws {
        let subject = AWSEndpointConfig.accountIDEndpointMode(configValue: .required, profileName: nil, fileBasedConfig: fileBasedConfig)
        XCTAssertEqual(subject, .required)
    }

    func test_accountIdEndpointMode_resolvesDefaultProfile() throws {
        let subject = AWSEndpointConfig.accountIDEndpointMode(configValue: nil, profileName: nil, fileBasedConfig: fileBasedConfig)
        XCTAssertEqual(subject, .disabled)
    }

    func test_accountIdEndpointMode_resolvesSpecifiedProfile() throws {
        let subject = AWSEndpointConfig.accountIDEndpointMode(configValue: nil, profileName: "aws-endpoint-config-test", fileBasedConfig: fileBasedConfig)
        XCTAssertEqual(subject, .required)
    }

    func test_accountIdEndpointMode_defaultsToPreferred() throws {
        let subject = AWSEndpointConfig.accountIDEndpointMode(configValue: nil, profileName: "no-such-profile", fileBasedConfig: fileBasedConfig)
        XCTAssertEqual(subject, .preferred)
    }
}
