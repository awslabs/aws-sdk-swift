//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyIdentityAPI
import SmithyIdentity
import AWSSDKIdentity
import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// A credential identity resolver that provides a fixed set of credentials
public struct StaticAWSCredentialIdentityResolver: AWSCredentialIdentityResolvedByCRT {
    private let credentials: AWSCredentialIdentity
    public let crtAWSCredentialIdentityResolver: AwsCommonRuntimeKit.CredentialsProvider

    /// Creates a credential identity resolver for a fixed set of credentials
    ///
    /// - Parameter credentials: The credentials that this provider will provide.
    ///
    /// - Returns: A credential identity resolver for a fixed set of credentials
    public init(_ credentials: AWSCredentialIdentity) throws {
        self.credentials = credentials
        self.crtAWSCredentialIdentityResolver = try AwsCommonRuntimeKit.CredentialsProvider(source: .static(
            accessKey: credentials.accessKey,
            secret: credentials.secret,
            sessionToken: credentials.sessionToken
        ))
    }
}
