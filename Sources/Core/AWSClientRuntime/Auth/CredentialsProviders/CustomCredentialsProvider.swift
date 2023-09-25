//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// Creates a credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
struct CustomCredentialsProvider: CredentialsSourcedByCRT {
    public typealias T = Credentials

    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
    ///
    /// - Parameter provider: An object confirming to `CredentialsProviding` to source the credentials.
    ///
    /// - Returns: A credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
    init(_ provider: any CredentialsProviding) throws {
        self.crtCredentialsProvider = try CRTCredentialsProvider(
            provider: CredentialsProvidingCRTAdapter(credentialsProvider: provider)
        )
    }
    
    /// Returns AWS Credentials.
    ///
    /// - Parameters:
    ///   - identityProperties: Heterogeneous bag of properties that contain additional data required to resolve identity, if any.
    public func getIdentity(identityProperties: ClientRuntime.Attributes? = nil) async throws -> Credentials {
        return try await Credentials(crtCredentials: crtCredentialsProvider.getCredentials())
    }
}
