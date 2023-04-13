//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

typealias CRTCredentialsProviding = AwsCommonRuntimeKit.CredentialsProviding
typealias CRTCredentialsProvider = AwsCommonRuntimeKit.CredentialsProvider

/// A credentials provider that adapts a CRT credentials provider to `CredentialsProviding`
struct CRTCredentialsProviderAdapter: CredentialsProviding {
    let crtCredentialsProvider: CRTCredentialsProviding

    init(_ crtCredentialsProvider: CRTCredentialsProviding) {
        self.crtCredentialsProvider = crtCredentialsProvider
    }

    func getCredentials() async throws -> Credentials {
        let crtCredentials = try await crtCredentialsProvider.getCredentials()
        return try .init(crtCredentials: crtCredentials)
    }
}

/// A credentials provider that adapts a credentials provider to `CRTCredentialsProvding`
struct CredentialsProviderCRTAdapter: CRTCredentialsProviding {
    let credentialsProvider: CredentialsProviding

    init(credentialsProvider: CredentialsProviding) {
        self.credentialsProvider = credentialsProvider
    }

    func getCredentials() async throws -> CRTCredentials {
        let credentials = try await credentialsProvider.getCredentials()
        return try .init(credentials: credentials)
    }
}
