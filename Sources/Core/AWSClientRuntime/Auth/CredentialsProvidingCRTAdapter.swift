//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

typealias CRTCredentialsProviding = AwsCommonRuntimeKit.CredentialsProviding
typealias CRTCredentialsProvider = AwsCommonRuntimeKit.CredentialsProvider

/// A credentials provider that adapts a credentials provider to `CRTCredentialsProvding`
struct CredentialsProvidingCRTAdapter: CRTCredentialsProviding {
    let credentialsProvider: any CredentialsProviding

    func getCredentials() async throws -> CRTCredentials {
        let credentials = try await credentialsProvider.getIdentity(identityProperties: Attributes())
        return try .init(credentials: credentials)
    }
}
