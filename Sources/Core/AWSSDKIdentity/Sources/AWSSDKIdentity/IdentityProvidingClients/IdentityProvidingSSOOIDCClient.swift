//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct SmithyIdentity.BearerTokenIdentity

public protocol IdentityProvidingSSOOIDCClient: Sendable {
    func createToken(
        region: String,
        clientID: String,
        clientSecret: String,
        refreshToken: String
    ) async throws -> (refreshToken: String, BearerTokenIdentity)
}
