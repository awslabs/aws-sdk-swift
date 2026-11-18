//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Date
import struct Foundation.TimeInterval
import struct Smithy.Attributes
import protocol SmithyIdentity.AWSCredentialIdentityResolver

///  A credential identity resolver that caches the credentials sourced from the provided resolver.
public actor CachedAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let underlyingResolver: any AWSCredentialIdentityResolver
    private let refreshTime: TimeInterval
    private var lastFetched: Date?
    private var cachedCredentials: AWSCredentialIdentity?
    private let now: @Sendable () async -> Date

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
        self.init(source: source, refreshTime: refreshTime, now: { Date() })
    }

    /// Creates a resolver that uses the provided closure as its clock.  Intended for testing.
    ///
    /// - Parameters:
    ///   - source: The source credential identity resolver to get the credentials.
    ///   - refreshTime: The number of seconds that must pass before new credentials will be fetched again.
    ///   - now: A closure that returns the current time.
    init(
        source: any AWSCredentialIdentityResolver,
        refreshTime: TimeInterval,
        now: @escaping @Sendable () async -> Date
    ) {
        self.underlyingResolver = source
        self.refreshTime = refreshTime
        self.now = now
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        if let cached = cachedCredentials, !(await shouldRefreshCredentials()) {
            return cached
        }

        let creds = try await underlyingResolver.getIdentity(identityProperties: identityProperties)
        lastFetched = await now()
        cachedCredentials = creds
        return creds
    }

    private func shouldRefreshCredentials() async -> Bool {
        let currentTime = await now()
        // It's safe to force-unwrap because this line is reached only if credentials have been cached at least once before,
        //  and the lastFetched is set to a non-nil Date value.
        let refreshAfter = lastFetched!.addingTimeInterval(refreshTime)
        return currentTime >= refreshAfter
    }
}
