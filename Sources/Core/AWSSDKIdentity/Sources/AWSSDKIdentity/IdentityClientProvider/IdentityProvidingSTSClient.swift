//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.ServiceError
import Foundation
import InternalAWSSTS
import struct Smithy.Attributes
import struct SmithyIdentity.StaticAWSCredentialIdentityResolver

/// nonRecoverableSTSError returns a NonRecoverableCredentialError if STS returned an error retrying can't fix.
private func nonRecoverableSTSError(_ error: any Error) -> NonRecoverableCredentialError? {
    let message: String
    switch (error as? ServiceError)?.errorCode {
    case "AccessDenied": message = "The role's trust policy does not allow this principal to assume it."
    case "IDPRejectedClaim": message = "The identity provider rejected the web identity token."
    case "InvalidIdentityToken": message = "The web identity token is invalid or malformed."
    case "MalformedPolicyDocument": message = "The session policy document is malformed."
    case "PackedPolicyTooLarge": message = "The session policy is too large."
    case "RegionDisabled": message = "STS is not activated in this region."
    default: return nil
    }
    return NonRecoverableCredentialError(underlying: error, actionableMessage: message)
}

struct IdentityProvidingSTSClient: Swift.Sendable {

    func assumeRoleWithCreds(
        creds: AWSCredentialIdentity,
        roleARN: String,
        roleSessionName: String,
        durationSeconds: Foundation.TimeInterval,
        credentialFeatureIDs: [String]
    ) async throws -> AWSCredentialIdentity {
        let stsConfig = try await STSClient.STSClientConfig(
            awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(creds)
        )
        let sts = STSClient(config: stsConfig)
        let out: AssumeRoleOutput
        do {
            out = try await sts.assumeRole(
                input: AssumeRoleInput(
                    durationSeconds: Int(durationSeconds),
                    roleArn: roleARN,
                    roleSessionName: roleSessionName
                )
            )
        } catch {
            throw nonRecoverableSTSError(error) ?? error
        }
        guard let creds = out.credentials, let accessKey = creds.accessKeyId, let secretKey = creds.secretAccessKey
        else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSAssumeRoleAWSCredentialIdentityResolver:Failed to retrieve credentials from STS with assume role."
            )
        }
        var properties = Smithy.Attributes()
        if credentialFeatureIDs.last == CredentialFeatureID.CREDENTIALS_STS_ASSUME_ROLE.rawValue {
            properties.set(
                key: AWSIdentityPropertyKeys.credentialFeatureIDs,
                value: credentialFeatureIDs
            )
        } else {
            properties.set(
                key: AWSIdentityPropertyKeys.credentialFeatureIDs,
                value: credentialFeatureIDs + [CredentialFeatureID.CREDENTIALS_STS_ASSUME_ROLE.rawValue]
            )
        }
        return AWSCredentialIdentity(
            accessKey: accessKey,
            secret: secretKey,
            expiration: creds.expiration,
            sessionToken: creds.sessionToken,
            properties: properties
        )
    }

    func getCredentialsWithWebIdentity(
        region: String,
        roleARN: String,
        roleSessionName: String,
        webIdentityToken: String,
        credentialFeatureIDs: [String]
    ) async throws -> AWSCredentialIdentity {
        let stsConfig = try await STSClient.STSClientConfig(
            region: region,
            httpInterceptorProviders: [CredentialFeatureIDInterceptorProvider(featureIDsToAdd: credentialFeatureIDs)]
        )
        let sts = STSClient(config: stsConfig)
        var out: AssumeRoleWithWebIdentityOutput
        do {
            out = try await sts.assumeRoleWithWebIdentity(input: AssumeRoleWithWebIdentityInput(
                roleArn: roleARN, roleSessionName: roleSessionName, webIdentityToken: webIdentityToken
            ))
        } catch is ExpiredTokenException {
            throw IdentityProvidingSTSClientError.expiredTokenException
        } catch is IDPCommunicationErrorException {
            throw IdentityProvidingSTSClientError.idpCommunicationErrorException
        } catch {
            if let nonRecoverable = nonRecoverableSTSError(error) { throw nonRecoverable }
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver: " +
                "Failed to retrieve credentials from STS with web identity token."
            )
        }
        guard let creds = out.credentials, let access = creds.accessKeyId, let secret = creds.secretAccessKey else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver: " +
                "Failed to retrieve credentials from STS with web identity token."
            )
        }
        var properties = Attributes()
        properties.set(
            key: AWSIdentityPropertyKeys.credentialFeatureIDs,
            value: credentialFeatureIDs + [CredentialFeatureID.CREDENTIALS_STS_ASSUME_ROLE_WEB_ID.rawValue]
        )
        return AWSCredentialIdentity(
            accessKey: access,
            secret: secret,
            expiration: creds.expiration,
            sessionToken: creds.sessionToken,
            properties: properties
        )
    }
}

// This enum wraps STS model's errors so that STSWebIdentity creds resolver doesn't need the actual error types.
public enum IdentityProvidingSTSClientError: Error {
    case expiredTokenException
    case idpCommunicationErrorException
}
