//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import struct AWSSDKIdentity.ProcessAWSCredentialIdentityResolver
@_spi(FileBasedConfig) @testable import AWSClientRuntime
import struct AWSSDKIdentity.ProfileAWSCredentialIdentityResolver

class ProcessAWSCredentialIdentityResolverTests: XCTestCase {
    let configPath = Bundle.module.path(forResource: "config_with_process", ofType: nil)!
    let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!

    #if !os(iOS) && !os(tvOS) && !os(watchOS) && !os(visionOS)
    func testGetCredentialsWithDefaultProfile() async throws {
        let subject = try ProcessAWSCredentialIdentityResolver(
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try await subject.getIdentity()

        XCTAssertEqual("AccessKey123", credentials.accessKey)
        XCTAssertEqual("SecretAccessKey123", credentials.secret)
        XCTAssertEqual("SessionToken123", credentials.sessionToken)
        XCTAssertEqual("012345678901", credentials.accountID)
    }

    func testGetCredentialsWithNamedProfileFromConfigFile() async throws {
        let subject = try ProcessAWSCredentialIdentityResolver(
            profileName: "credentials-process-config-tests-profile",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try await subject.getIdentity()

        XCTAssertEqual("AccessKey456", credentials.accessKey)
        XCTAssertEqual("SecretAccessKey456", credentials.secret)
        XCTAssertEqual("SessionToken456", credentials.sessionToken)
        XCTAssertEqual("234567890123", credentials.accountID)
    }
    #endif
}
