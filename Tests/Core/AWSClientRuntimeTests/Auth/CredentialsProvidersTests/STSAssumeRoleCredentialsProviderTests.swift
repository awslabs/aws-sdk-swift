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

class STSAssumeRoleCredentialsProviderTests: XCTestCase {
    func testInit() {
        // For now we'll lean on CRT to test the implementation of this provider
        // so just assert that we created the provider without crashing.
        // Note: The underlying CRT provider throws an error if the role is invalid,
        // so we'll assert that is the case here since mocking out a valid STS Assume Role is out scope for now.
        // TODO: Add an integration test for this provider
        XCTAssertThrowsError(try STSAssumeRoleCredentialsProvider(
            credentialsProvider: try EnvironmentCredentialsProvider(),
            roleArn: "invalid-role",
            sessionName: "some-session"
        ))
    }
}
