//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

typealias CRTCredentialsProvding = AwsCommonRuntimeKit.CredentialsProviding
typealias CRTCredentialsProvider = AwsCommonRuntimeKit.CredentialsProvider

/// A credentials provider that wraps a CRT credentials provider.
struct CRTCredentialsProviderWrapper: CredentialsProviding {
    let crtCredentialsProvider: CRTCredentialsProvding
    
    init(_ crtCredentialsProvider: CRTCredentialsProvding) {
        self.crtCredentialsProvider = crtCredentialsProvider
    }
    
    func getCredentials() async throws -> Credentials {
        let crtCredentials = try await crtCredentialsProvider.getCredentials()
        return try .init(crtCredentials: crtCredentials)
    }
}

extension CredentialsProvider {
    /// Creates a credentials provider using the provider returned by  `makeCRTProvider` to source the credentials.
    ///
    /// This is used to create credential providers from the CRT providers and allows us to inject in internal dependencies that we want to keep hidden.
    /// For example, this pattern allows us to inject in the filebased configuration store from the client instance, which is used to retireve and cache file base configurations.
    ///
    /// - Parameter makeCRTProvider: A function that creates a credentials provider conforming to `CRTCredentialsProvding` given CredentialsProvider.options
    ///
    /// - Returns: A credentials provider using the provider returned by  `makeCRTProvider` to source the credentials.
    static func makeWithCRTCredentialsProvider(
        _ makeCRTProvider: @escaping (Options) async throws -> CRTCredentialsProvding
    ) -> Self {
        self.init { options in
            let crtProvider = try await makeCRTProvider(options)
            return CRTCredentialsProviderWrapper(crtProvider)
        }
    }
}
