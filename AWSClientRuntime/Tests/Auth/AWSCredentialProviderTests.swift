//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Runtime
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

class AWSCredentialProviderTests: XCTestCase {
    
    func testYouCanUseCustomCredentialsProvider() throws {
        let awsCredsProvider = try AWSCredentialsProvider.fromCustom(MyCustomCredentialsProvider())
        let credentialsResult = try awsCredsProvider.getCredentials()
        let credentials = try credentialsResult.get()
        XCTAssertEqual(credentials.accessKey, "MYACCESSKEY")
        XCTAssertEqual(credentials.secret, "sekrit")
    }
}

struct MyCustomCredentialsProvider: CredentialsProvider {
    func getCredentials() throws -> SdkFuture<AWSCredentials> {
        let future = SdkFuture<AWSCredentials>()
        future.fulfill(AWSCredentials(accessKey: "MYACCESSKEY", secret: "sekrit", expirationTimeout: 30))
        return future
    }
}
