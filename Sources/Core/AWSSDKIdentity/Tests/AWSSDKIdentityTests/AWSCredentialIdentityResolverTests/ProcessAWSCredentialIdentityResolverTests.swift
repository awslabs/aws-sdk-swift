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

    // Importing & instantiating ProfileAWSCredentialIdentityResolver in setUp() is a temporary workaround for
    //  CRT's ProcessAWSCredentialIdentityResolver missing a required setup and depending on
    //  some other credential resolver for it. The bug was caught when ECSAWSCredentialIdentityResolver
    //  unit tests were refactored to use SDK-side implementation.
    //  Xcode runs unit tests alphabetically, and the 2 tests below always ran after ECS resolver's unit tests.
    //  Removing CRT's ECS resolver instantiation from the ECS resolver tests revealed the bug & started failing 2 tests below.
    override class func setUp() {
        let configPath = Bundle.module.path(forResource: "config", ofType: nil)!
        let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!
        super.setUp()
        _ = try! ProfileAWSCredentialIdentityResolver(
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
    }

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
}
