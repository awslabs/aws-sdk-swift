//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo
import protocol ClientRuntime.Plugin
import protocol ClientRuntime.ClientConfiguration
import protocol ClientRuntime.DefaultHttpClientConfiguration
import struct SmithyIdentity.BearerTokenIdentity
import struct SmithyIdentity.StaticBearerTokenIdentityResolver

public struct BedrockAPIKeyPlugin: Plugin {

    public init() {}

    public func configureClient(clientConfiguration: any ClientRuntime.ClientConfiguration) async throws {
        guard var config = clientConfiguration as? DefaultHttpClientConfiguration else { return }
        guard let bearerToken = ProcessInfo.processInfo.environment["AWS_BEARER_TOKEN_BEDROCK"] else { return }
        config.authSchemePreference = ["smithy.api#httpBearerAuth"] + (config.authSchemePreference ?? [])
        let identity = BearerTokenIdentity(token: bearerToken)
        config.bearerTokenIdentityResolver = StaticBearerTokenIdentityResolver(token: identity)
    }
}
