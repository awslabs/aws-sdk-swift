//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.DefaultClientConfiguration
import protocol ClientRuntime.DefaultHttpClientConfiguration
@_spi(ClientConfigWrapper) import enum ClientRuntime.IdentityPropertyKeys
import struct Smithy.Attributes
import struct SmithyIdentity.StaticAWSCredentialIdentityResolver

public actor DefaultS3ExpressIdentityResolver: S3ExpressIdentityResolver {
    private typealias CacheType = [S3ExpressIdentityCachedElement.CacheKey: S3ExpressIdentityCachedElement]

    // Cached S3 Express sessions, keyed per bucket and per base AWS credentials.
    private var cache: CacheType = [:]

    public init() {}

    public func getIdentity(identityProperties: Attributes?) async throws -> S3ExpressIdentity {
        guard let identityProperties else { throw S3ExpressClientError.missingIdentityProperties }
        guard let wrapper = identityProperties.get(key: IdentityPropertyKeys.clientConfigWrapper),
              var httpConfig = wrapper.clientConfig as? any DefaultHttpClientConfiguration else {
            throw S3ExpressClientError.clientConfigNotProvided
        }

        // Resolve the base credentials of the requesting client on every request.
        // The session cache is keyed on them, so a session is only reused by a caller
        // that holds the same base credentials that created it.
        let baseCredentials = try await httpConfig.awsCredentialIdentityResolver
            .getIdentity(identityProperties: identityProperties)

        // Pin a copy of the config to those credentials, so CreateSession and every refresh
        // of the cached session are signed with exactly the credentials in the cache key.
        httpConfig.awsCredentialIdentityResolver = StaticAWSCredentialIdentityResolver(baseCredentials)
        guard let pinnedConfig = httpConfig as? any DefaultClientConfiguration else {
            throw S3ExpressClientError.clientConfigNotProvided
        }

        let cacheKey = try S3ExpressIdentityCachedElement.CacheKey(
            identityProperties: identityProperties,
            baseCredentials: baseCredentials
        )
        let identityCachedElement = getCachedIdentity(
            cacheKey: cacheKey,
            identityProperties: identityProperties,
            clientConfig: PinnedClientConfig(pinnedConfig)
        )
        return try await identityCachedElement.accessIdentity()
    }

    // Gets the cached identity if one is in the cache for this bucket and these base credentials.
    // If no identity is cached for the current request, create one, put it in the cache, and return it.
    private func getCachedIdentity(
        cacheKey: S3ExpressIdentityCachedElement.CacheKey,
        identityProperties: Attributes,
        clientConfig: PinnedClientConfig
    ) -> S3ExpressIdentityCachedElement {
        if let identityCachedElement = cache[cacheKey] {
            return identityCachedElement
        } else {
            let newIdentityCachedElement = S3ExpressIdentityCachedElement(
                resolver: self,
                identityProperties: identityProperties,
                cacheKey: cacheKey,
                clientConfig: clientConfig
            )
            cache[cacheKey] = newIdentityCachedElement
            return newIdentityCachedElement
        }
    }

    // Check that the identity of the element is as expected, then remove that element from the cache.
    // The identity check ensures that the new element is not removed if a refresh has taken place.
    func remove(element: S3ExpressIdentityCachedElement, cacheKey: S3ExpressIdentityCachedElement.CacheKey) {
        guard cache[cacheKey] === element else { return }
        cache.removeValue(forKey: cacheKey)
    }
}
