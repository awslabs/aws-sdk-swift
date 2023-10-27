//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

///  A credentials provider that caches the credentials sourced from the provided credentials provider.
public struct CachedCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credentials provider that caches the credentials sourced from the provided credentials provider.
    /// Credentials sourced through this provider will be cached within it until their expiration time.
    /// When the cached credentials expire, new credentials will be fetched when next queried.
    ///
    /// - Parameters:
    ///   - source: The source credentials provider to get the credentials.
    ///   - refreshTime: The number of seconds that must pass before new credentials will be fetched again.
    public init(
        source: CredentialsProviding,
        refreshTime: TimeInterval
    ) throws {
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .cached(
            source: try source.getCRTCredentialsProvider(),
            refreshTime: refreshTime
        ))
    }
}
