//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Foundation.TimeInterval
import struct Foundation.Date
import struct Smithy.Attributes

///  A credential identity resolver that caches the credentials sourced from the provided resolver.
public actor CachedAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let underlyingResolver: any AWSCredentialIdentityResolver
    private let refreshTime: TimeInterval
    private var lastFetched: Date?
    private var cachedCredentials: AWSCredentialIdentity?

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
        self.underlyingResolver = source
        self.refreshTime = refreshTime
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        if let cached = cachedCredentials, !shouldRefreshCredentials() {
            return cached
        }

        let creds = try await underlyingResolver.getIdentity(identityProperties: identityProperties)
        lastFetched = Date()
        cachedCredentials = creds
        return creds
    }

    private func shouldRefreshCredentials() -> Bool {
        let now = Date()
        // It's safe to force-unwrap because this line is reached only if credentials have been cached at least once before,
        //  and the lastFetched is set to a non-nil Date value.
        let refreshAfter = lastFetched!.addingTimeInterval(refreshTime)
        return now >= refreshAfter
    }
}
