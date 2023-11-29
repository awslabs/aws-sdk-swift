/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.middleware.EndpointResolverMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.MiddlewareGenerator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter

class EndpointResolverMiddlewareTests {
    @Test
    fun `test endpoint resolver middleware`() {
        val writer = SwiftWriter("testName")
        val inputSymbol = Symbol.builder().name("SdkHttpRequestBuilder").build()
        val outputSymbol = Symbol.builder().name("OperationStackOutput").build()
        val outputErrorSymbol = Symbol.builder().name("OperationStackError").build()
        val middleware = EndpointResolverMiddleware(writer, inputSymbol, outputSymbol, outputErrorSymbol)
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
        MiddlewareGenerator(writer, middleware).generate()
        val contents = writer.toString()
        val expected = """
public struct EndpointResolverMiddleware<OperationStackOutput>: ClientRuntime.Middleware {
    public let id: Swift.String = "EndpointResolverMiddleware"

    let endpointResolver: EndpointResolver

    let endpointParams: EndpointParams

    let authSchemeResolver: AWSClientRuntime.AuthSchemeResolver

    public init(endpointResolver: EndpointResolver, endpointParams: EndpointParams, authSchemeResolver: AWSClientRuntime.AuthSchemeResolver = AWSClientRuntime.DefaultAuthSchemeResolver()) {
        self.endpointResolver = endpointResolver
        self.endpointParams = endpointParams
        self.authSchemeResolver = authSchemeResolver
    }

    public func handle<H>(context: Context,
                  input: ClientRuntime.SdkHttpRequestBuilder,
                  next: H) async throws -> ClientRuntime.OperationOutput<OperationStackOutput>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context
    {
        let endpoint = try endpointResolver.resolve(params: endpointParams)

        var signingName: String? = nil
        var signingRegion: String? = nil
        var signingAlgorithm: String? = nil
        if let authSchemes = endpoint.authSchemes() {
            let schemes = try authSchemes.map { try AuthScheme(from: ${'$'}0) }
            let authScheme = try authSchemeResolver.resolve(authSchemes: schemes)
            signingAlgorithm = authScheme.name
            switch authScheme {
            case .sigV4(let param):
                signingName = param.signingName
                signingRegion = param.signingRegion
            case .sigV4A(let param):
                signingName = param.signingName
                signingRegion = param.signingRegionSet?.first
            case .none:
                break
            }
        }

        let awsEndpoint = AWSEndpoint(endpoint: endpoint, signingName: signingName, signingRegion: signingRegion)

        var host = ""
        if let hostOverride = context.getHost() {
            host = hostOverride
        } else {
            host = "\(context.getHostPrefix() ?? "")\(awsEndpoint.endpoint.host)"
        }

        if let protocolType = awsEndpoint.endpoint.protocolType {
            input.withProtocol(protocolType)
        }

        if let signingRegion = signingRegion {
            context.attributes.set(key: HttpContext.signingRegion, value: signingRegion)
        }
        if let signingName = signingName {
            context.attributes.set(key: HttpContext.signingName, value: signingName)
        }
        if let signingAlgorithm = signingAlgorithm {
            context.attributes.set(key: HttpContext.signingAlgorithm, value: signingAlgorithm)
        }

        if let headers = endpoint.headers {
            input.withHeaders(headers)
        }

        input.withMethod(context.getMethod())
            .withHost(host)
            .withPort(awsEndpoint.endpoint.port)
            .withPath(awsEndpoint.endpoint.path.appendingPathComponent(context.getPath()))
            .withHeader(name: "Host", value: host)

        return try await next.handle(context: context, input: input)
    }

    public typealias MInput = ClientRuntime.SdkHttpRequestBuilder
    public typealias MOutput = ClientRuntime.OperationOutput<OperationStackOutput>
    public typealias Context = ClientRuntime.HttpContext
}
"""
        contents.shouldContainOnlyOnce(expected)
    }
}
