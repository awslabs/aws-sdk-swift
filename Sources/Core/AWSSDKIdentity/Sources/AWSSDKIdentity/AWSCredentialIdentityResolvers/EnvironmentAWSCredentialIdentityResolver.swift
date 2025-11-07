//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo
import struct Smithy.Attributes
@_spi(AWSCredentialIdentityResolver) import struct SmithyIdentity.AWSCredentialIdentity
import protocol SmithyIdentity.AWSCredentialIdentityResolver

/// A credential identity resolver that resolves credentials from the following environment variables:
/// - `AWS_ACCESS_KEY_ID`
/// - `AWS_SECRET_ACCESS_KEY`
/// - `AWS_SESSION_TOKEN` (optional)
/// - `AWS_ACCOUNT_ID` (optional)
public struct EnvironmentAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    public init() {}

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        let env = ProcessInfo.processInfo.environment

        guard let accessKey = env["AWS_ACCESS_KEY_ID"], !accessKey.isEmpty else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "EnvironmentAWSCredentialsResolver: AWS_ACCESS_KEY_ID is not set. Failed to resolve credentials."
            )
        }

        guard let secretKey = env["AWS_SECRET_ACCESS_KEY"], !secretKey.isEmpty else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "EnvironmentAWSCredentialsResolver: AWS_SECRET_ACCESS_KEY is not set. Failed to resolve credentials."
            )
        }

        var properties = Attributes()
        properties.set(
            key: AWSIdentityPropertyKeys.credentialFeatureIDs,
            value: [CredentialFeatureID.CREDENTIALS_ENV_VARS.rawValue]
        )
        return AWSCredentialIdentity(
            accessKey: accessKey,
            secret: secretKey,
            accountID: env["AWS_ACCOUNT_ID"],
            sessionToken: env["AWS_SESSION_TOKEN"],
            properties: properties
        )
    }
}
