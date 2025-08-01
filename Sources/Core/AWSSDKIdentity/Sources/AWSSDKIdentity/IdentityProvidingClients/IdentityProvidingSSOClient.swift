//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public protocol IdentityProvidingSSOClient: Sendable {
    func getCredentialsWithSSOToken(
        region: String,
        accessToken: String,
        accountID: String,
        roleName: String,
        credentialFeatureIDs: [String]
    ) async throws -> AWSCredentialIdentity
}
