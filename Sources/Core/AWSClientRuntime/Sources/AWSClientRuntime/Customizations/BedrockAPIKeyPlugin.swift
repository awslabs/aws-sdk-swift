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
import protocol ClientRuntime.Interceptor
import protocol ClientRuntime.HttpInterceptorProvider
import protocol ClientRuntime.AfterSerialization
import struct Smithy.Attributes
import struct Smithy.AttributeKey
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
import protocol SmithyIdentityAPI.IdentityResolver
import protocol SmithyIdentity.BearerTokenIdentityResolver
import struct SmithyIdentity.BearerTokenIdentity
import struct SmithyIdentity.StaticBearerTokenIdentityResolver

public struct BedrockAPIKeyPlugin: Plugin {

    public init() {}

    public func configureClient(clientConfiguration: any ClientConfiguration) async throws {
        guard let config = clientConfiguration as? DefaultHttpClientConfiguration else { return }
        config.addInterceptorProvider(BedrockAPIKeyInterceptorProvider())
    }
}

struct BedrockAPIKeyInterceptorProvider: HttpInterceptorProvider {

    func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return BedrockAPIKeyInterceptor<InputType, OutputType>()
    }
}

struct BedrockAPIKeyInterceptor<InputType, OutputType>: Interceptor {
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    func readBeforeSigning(context: some AfterSerialization<InputType, HTTPRequest>) async throws {

        // Check to see if there's a Bedrock bearer token set in the environment.  If not, return &
        // do nothing.
        guard let bearerToken = ProcessInfo.processInfo.environment["AWS_BEARER_TOKEN_BEDROCK"] else { return }

        // Get the operation context.
        let attributes = context.getAttributes()

        // Check if identityResolvers already contains a bearer token resolver.
        // If so, return immediately & use that instead of the Bedrock API token.
        let identityResolvers = attributes.getIdentityResolvers() ?? Attributes()
        let key = AttributeKey<any IdentityResolver>(name: "smithy.api#httpBearerAuth")
        guard !identityResolvers.contains(key: key) else { return }

        // Create a bearer token identity resolver with the resolved token, then
        // store it in the context.
        let identity = BearerTokenIdentity(token: bearerToken)
        let resolver = StaticBearerTokenIdentityResolver(token: identity)
        attributes.addIdentityResolver(value: resolver, schemeID: "smithy.api#httpBearerAuth")

        // Take the existing auth scheme preferences, add bearer token at the front, and store the
        // new auth scheme preferences back in the context.
        // Deduplicate httpBearerAuth in the auth scheme preferences list.
        let originalAuthSchemePreference = attributes.getAuthSchemePreference() ?? []
        let newAuthSchemePreference =
            ["smithy.api#httpBearerAuth"] + originalAuthSchemePreference.filter { !$0.hasSuffix("httpBearerAuth") }
        attributes.authSchemePreference = newAuthSchemePreference

        // Set the flag to add business metrics for the use of service-specific bearer token auth
        attributes.usesBearerServiceEnvVars = true
    }
}
