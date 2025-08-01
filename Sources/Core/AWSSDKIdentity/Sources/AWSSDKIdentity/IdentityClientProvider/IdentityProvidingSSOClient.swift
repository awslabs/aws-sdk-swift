//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import InternalAWSSSO
import struct Smithy.Attributes

struct IdentityProvidingSSOClient {

    func getCredentialsWithSSOToken(
        region: String,
        accessToken: String,
        accountID: String,
        roleName: String,
        credentialFeatureIDs: [String]
    ) async throws -> AWSCredentialIdentity {
        let ssoConfig = try await SSOClient.SSOClientConfiguration(region: region)
        ssoConfig.addInterceptorProvider(CredentialFeatureIDInterceptorProvider(featureIDsToAdd: credentialFeatureIDs))
        let sso = SSOClient(config: ssoConfig)
        let input = GetRoleCredentialsInput(accessToken: accessToken, accountId: accountID, roleName: roleName)
        let out = try await sso.getRoleCredentials(input: input)
        guard let accessKey = out.roleCredentials?.accessKeyId, let secretKey = out.roleCredentials?.secretAccessKey
        else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "SSOAWSCredentialIdentityResolver: Failed to retrieve temporary credentials using SSO token."
            )
        }
        var expiration: Foundation.Date?
        if let expiresIn = out.roleCredentials?.expiration {
            expiration = Foundation.Date().addingTimeInterval(Foundation.TimeInterval(expiresIn))
        }
        var properties = Smithy.Attributes()
        if credentialFeatureIDs.last == CredentialFeatureID.CREDENTIALS_PROFILE_SSO_LEGACY.rawValue {
            properties.set(
                key: AWSIdentityPropertyKeys.credentialFeatureIDs,
                value: credentialFeatureIDs + [CredentialFeatureID.CREDENTIALS_SSO_LEGACY.rawValue]
            )
        } else if credentialFeatureIDs.last == CredentialFeatureID.CREDENTIALS_PROFILE_SSO.rawValue {
            properties.set(
                key: AWSIdentityPropertyKeys.credentialFeatureIDs,
                value: credentialFeatureIDs + [CredentialFeatureID.CREDENTIALS_SSO.rawValue]
            )
        } else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "SSOAWSCredentialIdentityResolver: Invalid last feature ID found. This should never happen."
            )
        }
        return AWSCredentialIdentity(
            accessKey: accessKey,
            secret: secretKey,
            accountID: accountID,
            expiration: expiration,
            sessionToken: out.roleCredentials?.sessionToken,
            properties: properties
        )
    }
}
