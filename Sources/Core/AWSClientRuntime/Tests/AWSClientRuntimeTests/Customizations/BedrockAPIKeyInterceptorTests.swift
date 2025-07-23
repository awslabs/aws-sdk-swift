//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
import SmithyHTTPAPI
@testable import AWSClientRuntime
import Smithy
import SmithyIdentity

final class BedrockAPIKeyInterceptorTests: XCTestCase {
    let envVarName = "AWS_BEARER_TOKEN_BEDROCK"
    let bearerTokenIdentityResolverKey = AttributeKey<any BearerTokenIdentityResolver>(name: "smithy.api#httpBearerAuth")

    // MARK: - authSchemePreference

    func test_authSchemePreference_unsetWhenBearerTokenIsNotUsed() async throws {
        unsetenv(envVarName)
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        let authSchemePreference = context.authSchemePreference ?? []
        XCTAssertTrue(authSchemePreference.isEmpty)
    }

    func test_authSchemePreference_setWithBearerAuthPreferredWhenBearerTokenIsUsed() async throws {
        setenv(envVarName, "abc", 1)
        defer { unsetenv(envVarName) }
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        context.authSchemePreference = ["aws.auth#sigv4", "some.other.domain#enigma"]
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        let authSchemePreference = context.authSchemePreference
        XCTAssertEqual(authSchemePreference, ["smithy.api#httpBearerAuth", "aws.auth#sigv4", "some.other.domain#enigma"])
    }

    func test_authSchemePreference_deduplicatesPreferredAuthSchemesWhenBearerTokenIsUsed() async throws {
        setenv(envVarName, "abc", 1)
        defer { unsetenv(envVarName) }
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        context.authSchemePreference = ["aws.auth#sigv4", "smithy.api#httpBearerAuth", "some.other.domain#enigma", "httpBearerAuth"]
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        let authSchemePreference = context.authSchemePreference
        XCTAssertEqual(authSchemePreference, ["smithy.api#httpBearerAuth", "aws.auth#sigv4", "some.other.domain#enigma"])
    }

    // MARK: - bearerTokenIdentityResolver

    func test_bearerTokenIdentityResolver_unsetWhenBearerTokenIsNotUsed() async throws {
        unsetenv(envVarName)
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        let identityResolvers = context.getIdentityResolvers() ?? Attributes()
        let bearerTokenIdentityResolver = identityResolvers.get(key: bearerTokenIdentityResolverKey)
        XCTAssertNil(bearerTokenIdentityResolver)
    }

    func test_bearerTokenIdentityResolver_resolverUnchangedWhenExplicitlySetAndBearerTokenIsUsed() async throws {
        setenv(envVarName, "abc", 1)
        defer { unsetenv(envVarName) }
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        let explicitIdentity = BearerTokenIdentity(token: "explicit")
        let explicitResolver = StaticBearerTokenIdentityResolver(token: explicitIdentity)
        context.addIdentityResolver(value: explicitResolver, schemeID: "smithy.api#httpBearerAuth")
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        let identityResolvers = try XCTUnwrap(context.getIdentityResolvers())
        let bearerTokenIdentityResolver = try XCTUnwrap(identityResolvers.get(key: bearerTokenIdentityResolverKey))
        let bearerTokenIdentity = try await bearerTokenIdentityResolver.getIdentity(identityProperties: Attributes())
        XCTAssertEqual(bearerTokenIdentity.token, "explicit")
    }

    func test_bearerTokenIdentityResolver_setWhenBearerTokenIsUsed() async throws {
        setenv(envVarName, "abc", 1)
        defer { unsetenv(envVarName) }
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        let identityResolvers = try XCTUnwrap(context.getIdentityResolvers())
        let bearerTokenIdentityResolver = try XCTUnwrap(identityResolvers.get(key: bearerTokenIdentityResolverKey))
        let bearerTokenIdentity = try await bearerTokenIdentityResolver.getIdentity(identityProperties: Attributes())
        XCTAssertEqual(bearerTokenIdentity.token, "abc")
    }

    // MARK: - usesBearerServiceEnvVars

    func test_usesBearerServiceEnvVars_unsetWhenBearerTokenIsNotUsed() async throws {
        unsetenv(envVarName)
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        XCTAssertFalse(context.usesBearerServiceEnvVars)
    }

    func test_usesBearerServiceEnvVars_setWhenBearerTokenIsUsed() async throws {
        setenv(envVarName, "abc", 1)
        defer { unsetenv(envVarName) }
        let subject = BedrockAPIKeyInterceptor<String, String>()
        let context = Context(attributes: Attributes())
        let interceptorContext = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(input: "", attributes: context)

        try await subject.readBeforeSigning(context: interceptorContext)

        XCTAssertTrue(context.usesBearerServiceEnvVars)
    }
}
