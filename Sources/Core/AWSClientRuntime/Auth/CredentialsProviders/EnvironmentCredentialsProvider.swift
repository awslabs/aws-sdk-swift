//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// A credentials provider that sources credentials from the following environment variables:
/// - `AWS_ACCESS_KEY_ID`
/// - `AWS_SECRET_ACCESS_KEY`
/// - `AWS_SESSION_TOKEN`
public struct EnvironmentCredentialsProvider: CredentialsSourcedByCRT {
    public typealias T = Credentials
    
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credentials provider that sources credentials from the following environment variables:
    /// - `AWS_ACCESS_KEY_ID`
    /// - `AWS_SECRET_ACCESS_KEY`
    /// - `AWS_SESSION_TOKEN`
    public init() throws {
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .environment())
    }
    
    /// Returns AWS Credentials.
    ///
    /// - Parameters:
    ///   - identityProperties: Heterogeneous bag of properties that contain additional data required to resolve identity, if any.
    public func getIdentity(identityProperties: ClientRuntime.Attributes? = nil) async throws -> Credentials {
        return try await Credentials(crtCredentials: crtCredentialsProvider.getCredentials())
    }
}
