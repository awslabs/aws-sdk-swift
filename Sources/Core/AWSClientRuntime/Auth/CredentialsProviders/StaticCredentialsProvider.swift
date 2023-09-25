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
}
