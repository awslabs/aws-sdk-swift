//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

/// A type that can provide credentials for authenticating with an AWS service
public protocol CredentialsProviding {
    /// Returns credentials for authenticating with an AWS service
    func getCredentials() async throws -> Credentials
}

extension CredentialsProviding {
    /// Returns the underlying `CRTCredentialsProvider`.
    /// If `self` is not backed by a `CRTCredentialsProvider` then this wraps `self` in a `CustomCredentialsProvider` which will create a `CRTCredentialsProvider`.
    func getCRTCredentialsProvider() throws -> CRTCredentialsProvider {
        let providerSourcedByCRT = try self as? CredentialsSourcedByCRT ?? CustomCredentialsProvider(self)
        return providerSourcedByCRT.crtCredentialsProvider
    }
}
