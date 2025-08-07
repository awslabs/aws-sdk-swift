//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import InternalAWSCognitoIdentity

protocol CognitoIdentityClientProtocol: Sendable {
    func getId(
        identityPoolId: String,
        logins: [String: String]?,
        region: String
    ) async throws -> String

    func getCredentialsForIdentity(
        identityId: String,
        logins: [String: String]?,
        region: String
    ) async throws -> AWSCredentialIdentity
}

struct IdentityProvidingCognitoIdentityClient: CognitoIdentityClientProtocol, Swift.Sendable {
    func getId(
        identityPoolId: String,
        logins: [String: String]?,
        region: String
    ) async throws -> String {
        let config = try await CognitoIdentityClient.CognitoIdentityClientConfiguration(region: region)
        let client = CognitoIdentityClient(config: config)
        let input = GetIdInput(identityPoolId: identityPoolId, logins: logins)
        let output = try await client.getId(input: input)

        guard let identityId = output.identityId else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "CognitoAWSCredentialIdentityResolver: Failed to get identity ID from Cognito Identity"
            )
        }

        return identityId
    }

    func getCredentialsForIdentity(
        identityId: String,
        logins: [String: String]?,
        region: String
    ) async throws -> AWSCredentialIdentity {
        let config = try await CognitoIdentityClient.CognitoIdentityClientConfiguration(region: region)
        let client = CognitoIdentityClient(config: config)
        let input = GetCredentialsForIdentityInput(identityId: identityId, logins: logins)
        let output = try await client.getCredentialsForIdentity(input: input)

        guard let credentials = output.credentials,
              let accessKey = credentials.accessKeyId,
              let secretKey = credentials.secretKey else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "CognitoAWSCredentialIdentityResolver: Failed to get credentials from Cognito Identity"
            )
        }

        return AWSCredentialIdentity(
            accessKey: accessKey,
            secret: secretKey,
            expiration: credentials.expiration,
            sessionToken: credentials.sessionToken
        )
    }
}
