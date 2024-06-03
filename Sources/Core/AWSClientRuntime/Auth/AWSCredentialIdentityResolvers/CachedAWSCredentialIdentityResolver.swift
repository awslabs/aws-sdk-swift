//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentityAPI.AWSCredentialIdentityResolver
import protocol AWSSDKIdentity.AWSCredentialIdentityResolvedByCRT
import AwsCommonRuntimeKit
import Foundation

///  A credential identity resolver that caches the credentials sourced from the provided resolver.
public struct CachedAWSCredentialIdentityResolver: AWSCredentialIdentityResolvedByCRT {
    public let crtAWSCredentialIdentityResolver: AwsCommonRuntimeKit.CredentialsProvider

    /// Credentials resolved through this resolver will be cached within it until their expiration time.
    /// When the cached credentials expire, new credentials will be fetched when next queried.
    ///
    /// - Parameters:
    ///   - source: The source credential identity resolver to get the credentials.
    ///   - refreshTime: The number of seconds that must pass before new credentials will be fetched again.
    public init(
        source: any AWSCredentialIdentityResolver,
        refreshTime: TimeInterval
    ) throws {
        self.crtAWSCredentialIdentityResolver = try AwsCommonRuntimeKit.CredentialsProvider(source: .cached(
            source: try source.getCRTAWSCredentialIdentityResolver(),
            refreshTime: refreshTime
        ))
    }
}
