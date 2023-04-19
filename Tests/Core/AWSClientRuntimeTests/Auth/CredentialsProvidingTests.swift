//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest

@testable import AWSClientRuntime

class CredentialsProvidingTests: XCTestCase {
    
    func testGetCRTCredentialsWhenSelfIsBackedByCRT() {
        let subject = try! EnvironmentCredentialsProvider()
        let result = try! subject.getCRTCredentialsProvider()
        XCTAssertIdentical(result, subject.crtCredentialsProvider)
    }
    
    func testGetCRTCredentialsWhenSelfIsNotBackedByCRT() async {
        let subject = MockCredentialsProvider()
        let provider = try! subject.getCRTCredentialsProvider()
        let credentials = try! await provider.getCredentials()
        XCTAssertEqual(credentials.getAccessKey(), "some_access_key")
        XCTAssertEqual(credentials.getSecret(), "some_secret")
    }
}
