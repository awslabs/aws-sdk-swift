//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import struct AWSSDKIdentity.SharedConfigStaticAWSCredentialIdentityResolver

class SharedConfigStaticAWSCredentialIdentityResolverTests: XCTestCase {
    let credentialsPath = Bundle.module.path(forResource: "credentials", ofType: nil)!

    override func setUp() async throws {
        setenv("AWS_PROFILE", "shared-config-static-creds-resolver", 1)
    }

    override func tearDown() async throws {
        unsetenv("AWS_PROFILE")
    }

    func testGetIdentity() async throws {
        let resolver = SharedConfigStaticAWSCredentialIdentityResolver(
            credentialsFilePath: credentialsPath
        )
        let creds = try await resolver.getIdentity()
        XCTAssertEqual(creds.accessKey, "access_key")
        XCTAssertEqual(creds.secret, "secret")
        XCTAssertEqual(creds.sessionToken, "session")
    }
}
