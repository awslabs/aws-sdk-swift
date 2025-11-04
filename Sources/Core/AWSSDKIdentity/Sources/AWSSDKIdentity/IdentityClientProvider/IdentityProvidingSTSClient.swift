//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import InternalAWSSTS
import struct Smithy.Attributes
import struct SmithyIdentity.StaticAWSCredentialIdentityResolver
import protocol AWSClientRuntime.AWSServiceError

struct IdentityProvidingSTSClient: Swift.Sendable {

    func assumeRoleWithCreds(
        creds: AWSCredentialIdentity,
        roleARN: String,
        roleSessionName: String,
        durationSeconds: Foundation.TimeInterval,
        credentialFeatureIDs: [String]
    ) async throws -> AWSCredentialIdentity {
        let stsConfig = try await STSClient.STSClientConfiguration()
        stsConfig.awsCredentialIdentityResolver = StaticAWSCredentialIdentityResolver(creds)
        let sts = STSClient(config: stsConfig)
        let out = try await sts.assumeRole(
            input: AssumeRoleInput(
                durationSeconds: Int(durationSeconds),
                roleArn: roleARN,
                roleSessionName: roleSessionName
            )
        )
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
        let stsConfig = try await STSClient.STSClientConfiguration(region: region)
        stsConfig.addInterceptorProvider(CredentialFeatureIDInterceptorProvider(featureIDsToAdd: credentialFeatureIDs))
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
        } catch let error as AWSServiceError {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver.assumeRoleWithWebIdentity: " +
                "Unhandled AWS service error of type: \(error.errorCode)"
            )
        } catch {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver.assumeRoleWithWebIdentity: " +
                "Unhandled error: \(error)"
            )
        }

        // Safe-unwrap credential fields from the assumeRoleWithWebIdentity response
        guard let creds = out.credentials, let access = creds.accessKeyId, let secret = creds.secretAccessKey else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver: " +
                "Received credentials did not contain necessary fields"
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
