//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.BearerTokenIdentityResolver
import struct SmithyIdentity.BearerTokenIdentity
import struct Smithy.Attributes
import enum Smithy.ClientError

public struct DefaultBearerTokenIdentityResolverChain: BearerTokenIdentityResolver {
    public var chain: [any BearerTokenIdentityResolver]

    public init(chain: [any BearerTokenIdentityResolver]? = nil) throws {
        self.chain = try chain ?? [SSOBearerTokenIdentityResolver()]
    }

    public func getIdentity(
        identityProperties: Smithy.Attributes?
    ) async throws -> SmithyIdentity.BearerTokenIdentity {
        for resolver in chain {
            let token = try await resolver.getIdentity(identityProperties: nil)
            if !token.token.isEmpty { return token }
        }
        throw ClientError.authError("Bearer token identity could not be resolved.")
    }
}
