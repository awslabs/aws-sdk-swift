//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

class AWSCredentialProviderTests: XCTestCase {
    
    func testYouCanUseCustomCredentialsProvider() async throws {
        let awsCredsProvider = try AWSCredentialsProvider.fromCustom(MyCustomCredentialsProvider())
        let credentials = try await awsCredsProvider.getCredentials()
        XCTAssertEqual(credentials.accessKey, "MYACCESSKEY")
        XCTAssertEqual(credentials.secret, "sekrit")
    }
}

struct MyCustomCredentialsProvider: CredentialsProvider {
    func getCredentials() async throws -> AWSCredentials {
        return AWSCredentials(accessKey: "MYACCESSKEY", secret: "sekrit", expirationTimeout: 30)
    }
}
