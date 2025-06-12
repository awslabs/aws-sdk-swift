//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.Attributes

public actor DefaultS3ExpressIdentityResolver: S3ExpressIdentityResolver {
    private typealias CacheType = [S3ExpressIdentityCachedElement.CacheKey: S3ExpressIdentityCachedElement]

    private var cache: CacheType = [:]

    public init() {}

    public func getIdentity(identityProperties: Attributes?) async throws -> S3ExpressIdentity {
        guard let identityProperties else { throw S3ExpressClientError.missingIdentityProperties }
        let identityCachedElement = try getCachedIdentity(identityProperties: identityProperties)
        return try await identityCachedElement.accessIdentity()
    }

    // Gets the cached identity if one is in the cache.
    // If no identity is cached for the current request, create one, put it in the cache, and return it.
    private func getCachedIdentity(identityProperties: Attributes) throws -> S3ExpressIdentityCachedElement {
        let cacheKey = try S3ExpressIdentityCachedElement.CacheKey(identityProperties: identityProperties)
        if let identityCachedElement = cache[cacheKey] {
            return identityCachedElement
        } else {
            let newIdentityCachedElement =
                try S3ExpressIdentityCachedElement(resolver: self, identityProperties: identityProperties)
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
