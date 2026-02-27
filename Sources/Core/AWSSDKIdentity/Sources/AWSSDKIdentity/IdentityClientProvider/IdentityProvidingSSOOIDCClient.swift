//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import InternalAWSSSOOIDC
import struct SmithyIdentity.BearerTokenIdentity

struct IdentityProvidingSSOOIDCClient {

    func createToken(
        region: String,
        clientID: String,
        clientSecret: String,
        refreshToken: String,
        credentialFeatureIDs: [String]
    ) async throws -> (refreshToken: String?, BearerTokenIdentity) {
        let ssoOIDCConfig = try await SSOOIDCClient.SSOOIDCClientConfig(
            region: region,
            httpInterceptorProviders: [CredentialFeatureIDInterceptorProvider(featureIDsToAdd: credentialFeatureIDs)]
        )
        let ssoOIDC = SSOOIDCClient(config: ssoOIDCConfig)
        let input = CreateTokenInput(
            clientId: clientID,
            clientSecret: clientSecret,
            grantType: "refresh_token",
            refreshToken: refreshToken
        )
        let out = try await ssoOIDC.createToken(input: input)
        let expiration = Foundation.Date().addingTimeInterval(Foundation.TimeInterval(out.expiresIn))
        let token = BearerTokenIdentity(token: out.accessToken ?? "", expiration: expiration)
        return (out.refreshToken, token)
    }
}
