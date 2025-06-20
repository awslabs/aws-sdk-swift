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
    private var cachedCredentials: AWSCredentialIdentity?

    /// Credentials resolved through this resolver will be cached within it until their expiration time.
    /// When the cached credentials expire, new credentials will be fetched when next queried.
    ///
    /// - Parameters:
    ///   - underlyingResolver: The source credential identity resolver to get the credentials from.
    public init(
        underlyingResolver: any AWSCredentialIdentityResolver
    ) throws {
        self.underlyingResolver = underlyingResolver
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        if let cached = cachedCredentials, !shouldRefreshCredentials(expiration: cached.expiration) {
            return cached
        }

        let creds = try await underlyingResolver.getIdentity(identityProperties: identityProperties)
        cachedCredentials = creds
        return creds
    }

    private func shouldRefreshCredentials(expiration: Date?) -> Bool {
        guard let expiration else {
            return false // No expiration provided, assume no refresh is needed
        }

        let now = Date()
        let fiveMinutesBeforeExpiration = expiration.addingTimeInterval(-300)

        // Return true if now is after (expiration - 5 minutes).
        return now >= fiveMinutesBeforeExpiration
    }
}
