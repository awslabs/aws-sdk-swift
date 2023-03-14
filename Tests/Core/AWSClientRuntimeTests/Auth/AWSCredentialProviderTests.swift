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
    
    let credentials = AWSCredentials(
        accessKey: "MYACCESSKEY",
        secret: "sekrit",
        expirationTimeout: .init(timeIntervalSinceNow: 30)
    )

    func testYouCanUseCustomCredentialsProvider() async throws {
        let awsCredsProvider = try AWSCredentialsProvider.fromCustom(MyCustomCredentialsProvider(credentials: credentials))
        let credentials = try await awsCredsProvider.getCredentials()
        XCTAssertEqual(credentials.accessKey, "MYACCESSKEY")
        XCTAssertEqual(credentials.secret, "sekrit")
    }
}

struct MyCustomCredentialsProvider: CredentialsProvider {
    
    let credentials: AWSCredentials
    
    init(credentials: AWSCredentials) {
        self.credentials = credentials
    }
    
    func getCredentials() async throws -> AWSCredentials {
        return credentials
    }
}
