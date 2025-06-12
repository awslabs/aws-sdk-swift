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
        setenv("AWS_PROFILE", "shared-config-static-creds-resolver-env", 1)
    }

    override func tearDown() async throws {
        unsetenv("AWS_PROFILE")
    }

    func testGetIdentityWithEnvProfileName() async throws {
        let resolver = SharedConfigStaticAWSCredentialIdentityResolver(
            credentialsFilePath: credentialsPath
        )
        let creds = try await resolver.getIdentity()
        XCTAssertEqual(creds.accessKey, "access_key1")
        XCTAssertEqual(creds.secret, "secret1")
        XCTAssertEqual(creds.sessionToken, "session1")
    }

    func testGetIdentityWithInCodeProfileName() async throws {
        let resolver = SharedConfigStaticAWSCredentialIdentityResolver(
            profileName: "shared-config-static-creds-resolver-incode",
            credentialsFilePath: credentialsPath
        )
        let creds = try await resolver.getIdentity()
        XCTAssertEqual(creds.accessKey, "access_key2")
        XCTAssertEqual(creds.secret, "secret2")
        XCTAssertEqual(creds.sessionToken, "session2")
    }
}
