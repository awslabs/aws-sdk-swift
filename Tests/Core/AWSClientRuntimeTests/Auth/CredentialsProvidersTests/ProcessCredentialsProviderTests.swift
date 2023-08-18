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

// Test fails on CI build with macos-11, Xcode_13.2.1, platform=iOS Simulator but not on later versions
// ProcessCredentialsProvider is not useful on iOS platform so this test will remain disabled for now
#if !os(iOS)
class ProcessCredentialsProviderTests: XCTestCase {
    let configPath = Bundle.module.path(forResource: "config", ofType: nil)!
    let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!

    func testGetCredentialsWithDefaultProfile() async throws {
        let subject = try ProcessCredentialsProvider(
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try await subject.getCredentials()

        XCTAssertEqual("AccessKey123", credentials.accessKey)
        XCTAssertEqual("SecretAccessKey123", credentials.secret)
        XCTAssertEqual("SessionToken123", credentials.sessionToken)
    }

    func testGetCredentialsWithNamedProfileFromConfigFile() async throws {
        let subject = try ProcessCredentialsProvider(
            profileName: "credentials-process-config-tests-profile",
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try await subject.getCredentials()

        XCTAssertEqual("AccessKey123", credentials.accessKey)
        XCTAssertEqual("SecretAccessKey123", credentials.secret)
        XCTAssertEqual("SessionToken123", credentials.sessionToken)
    }
}
#endif
