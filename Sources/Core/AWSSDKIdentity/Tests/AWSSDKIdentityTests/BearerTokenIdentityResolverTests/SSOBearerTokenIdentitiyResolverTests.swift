//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct AWSSDKIdentity.IdentityClientProvider
@testable import struct AWSSDKIdentity.SSOBearerTokenIdentityResolver
import struct Smithy.Attributes
import XCTest

class SSOBearerTokenIdentityResolverTests: XCTestCase {
    let configPath = Bundle.module.path(forResource: "sso_tests", ofType: nil)!
    let expectedAccessToken = "ACCESS_TOKEN_STRING"

    func testLoadToken() throws {
        // Load the test token file under Resources/
        let testTokenFileURL = Bundle.module.url(
            forResource: "a94a8fe5ccb19ba61c4c0873d391e987982fbbd3", withExtension: "json"
        )
        let tokenString = try SSOBearerTokenIdentityResolver(identityClientProvider: IdentityClientProvider()).loadToken(
            fileURL: testTokenFileURL!
        ).accessToken
        XCTAssertEqual(expectedAccessToken, tokenString)
    }

    func testCreateSSOBearerTokenIdentityResolverLegacyProfile() async throws {
        _ = SSOBearerTokenIdentityResolver(
            profileName: "user",
            configFilePath: configPath,
            identityClientProvider: IdentityClientProvider()
        )
        // SUCCESS: creation didn't throw error
    }

    func testCreateSSOBearerTokenIdentityResolverTokenProviderProfile() async throws {
        _ = SSOBearerTokenIdentityResolver(
            profileName: "dev",
            configFilePath: configPath,
            identityClientProvider: IdentityClientProvider()
        )
        // SUCCESS: creation didn't throw error
    }
}
