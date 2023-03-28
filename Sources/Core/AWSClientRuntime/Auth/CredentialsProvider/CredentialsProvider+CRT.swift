//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

typealias CRTCredentialsProvding = AwsCommonRuntimeKit.CredentialsProviding
typealias CRTCredentialsProvider = AwsCommonRuntimeKit.CredentialsProvider

/// A credentials provider that adapts a CRT credentials provider to `CredentialsProviding`
struct CRTCredentialsProviderAdapter: CredentialsProviding {
    let crtCredentialsProvider: CRTCredentialsProvding
    
    init(_ crtCredentialsProvider: CRTCredentialsProvding) {
        self.crtCredentialsProvider = crtCredentialsProvider
    }
    
    func getCredentials() async throws -> Credentials {
        let crtCredentials = try await crtCredentialsProvider.getCredentials()
        return try .init(crtCredentials: crtCredentials)
    }
}

/// A credentials provider that adapts a credentials provider to `CRTCredentialsProvding`
struct CredentialsProviderCRTAdapter: CRTCredentialsProvding {
    let credentialsProvider: CredentialsProviding

    init(credentialsProvider: CredentialsProviding) {
        self.credentialsProvider = credentialsProvider
    }

    func getCredentials() async throws -> CRTCredentials {
        let credentials = try await credentialsProvider.getCredentials()
        return try .init(credentials: credentials)
    }
}

extension CredentialsProvider {
    /// Creates a credentials provider that sources credentials from a CRT credentials provider
    ///
    /// This is used to create credential providers from the CRT providers and allows us to inject in internal dependencies that we want to keep hidden.
    /// For example, this pattern allows us to inject in the filebased configuration store from the client instance, which is used to retireve and cache file base configurations.
    ///
    /// - Parameter makeCRTProvider: A function that creates a credentials provider conforming to `CRTCredentialsProvding` given CredentialsProvider.options
    ///
    /// - Returns: A credentials provider using the provider returned by  `makeCRTProvider` to source the credentials.
    static func makeWithCRTCredentialsProvider(
        identifier: String,
        _ makeCRTProvider: @escaping (Configuration) async throws -> CRTCredentialsProvding
    ) -> Self {
        self.init(identifier: identifier) { configuration in
            let crtProvider = try await makeCRTProvider(configuration)
            return CRTCredentialsProviderAdapter(crtProvider)
        }
    }
}
