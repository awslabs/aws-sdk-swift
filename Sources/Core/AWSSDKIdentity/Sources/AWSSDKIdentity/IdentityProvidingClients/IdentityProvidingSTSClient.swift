//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Protocol that allows InternalAWSSTSClient to be used by the STSWebIdentityAWSCredentialIdentityResolver without a direct dependency on it.
///
/// The `IdentityProvidingSTSClient` type that conforms to this protocol is code-generated along with the Internal STS client.
public protocol IdentityProvidingSTSClient {
    func getCredentialsWithWebIdentity(
        region: String,
        roleARN: String,
        roleSessionName: String,
        webIdentityToken: String
    ) async throws -> AWSCredentialIdentity
}

// This enum wraps STS model's errors so that STSWebIdentity creds resolver doesn't need the actual error types.
public enum IdentityProvidingSTSClientError: Error {
    case expiredTokenException
    case idpCommunicationErrorException
}
