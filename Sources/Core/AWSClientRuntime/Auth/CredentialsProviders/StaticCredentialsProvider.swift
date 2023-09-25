//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// A credentials provider that provides a fixed set of credentials
public struct StaticCredentialsProvider: CredentialsSourcedByCRT {
    public typealias T = Credentials
    
    private let credentials: Credentials
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credentials provider for a fixed set of credentials
    ///
    /// - Parameter credentials: The credentials that this provider will provide.
    ///
    /// - Returns: A credentials provider for a fixed set of credentials
    public init(_ credentials: Credentials) throws {
        self.credentials = credentials
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .static(
            accessKey: credentials.accessKey,
            secret: credentials.secret,
            sessionToken: credentials.sessionToken
        ))
    }
    
    /// Returns AWS Credentials.
    ///
    /// - Parameters:
    ///   - identityProperties: Heterogeneous bag of properties that contain additional data required to resolve identity, if any.
    public func getIdentity(identityProperties: ClientRuntime.Attributes? = nil) async throws -> Credentials {
        return try await Credentials(crtCredentials: crtCredentialsProvider.getCredentials())
    }
}
