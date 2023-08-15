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

class SSOCredentialsProviderTests: XCTestCase {
    let configPath = Bundle.module.path(forResource: "sso_tests", ofType: nil)!
    let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!
    
    func testGetCredentials() async {
        let subject = try! SSOCredentialsProvider(
            profileName: "dev"
            configFilePath: configPath,
            credentialsFilePath: credentialsPath
        )
        let credentials = try! await subject.getCredentials()
        
        XCTAssertEqual(credentials.accessKey, "access_key_default_cred")
        XCTAssertEqual(credentials.secret, "secret_default_cred")
    }
}
