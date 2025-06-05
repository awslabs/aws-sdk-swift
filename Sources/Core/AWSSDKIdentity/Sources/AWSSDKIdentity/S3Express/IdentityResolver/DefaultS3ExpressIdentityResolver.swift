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
        guard let identityProperties else { fatalError() }
        let identityCachedElement = getCachedIdentity(identityProperties: identityProperties)
        return try await identityCachedElement.accessIdentity()
    }

    private func getCachedIdentity(identityProperties: Attributes) -> S3ExpressIdentityCachedElement {
        let cacheKey = S3ExpressIdentityCachedElement.CacheKey(identityProperties: identityProperties)
        if let identityCachedElement = cache[cacheKey] {
            return identityCachedElement
        } else {
            let newIdentityCachedElement = S3ExpressIdentityCachedElement(resolver: self, identityProperties: identityProperties)
            cache[cacheKey] = newIdentityCachedElement
            return newIdentityCachedElement
        }
    }

    func remove(element: S3ExpressIdentityCachedElement, cacheKey: S3ExpressIdentityCachedElement.CacheKey) {
        // Check that the identity of the element is as expected, then remove that element from the cache.
        guard cache[cacheKey] === element else { return }
        cache.removeValue(forKey: cacheKey)
    }
}
