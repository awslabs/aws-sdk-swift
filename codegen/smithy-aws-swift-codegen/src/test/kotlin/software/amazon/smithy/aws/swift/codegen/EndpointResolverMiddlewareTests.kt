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
            public struct EndpointResolverMiddleware<OperationStackOutput: ClientRuntime.HttpResponseBinding, OperationStackError: ClientRuntime.HttpResponseBinding>: ClientRuntime.Middleware {
                public let id: Swift.String = "EndpointResolverMiddleware"
            
                let endpointResolver: EndpointResolver
            
                let endpointParams: EndpointParams
            
                public init(endpointResolver: EndpointResolver, endpointParams: EndpointParams) {
                    self.endpointResolver = endpointResolver
                    self.endpointParams = endpointParams
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
            
                    guard let authScheme = endpoint.authScheme(name: "sigv4") else {
                        throw ClientRuntime.SdkError<OperationStackError>.client(ClientError.unknownError(("Unable to resolve endpoint. Unsupported auth scheme.")))
                    }
            
                    let awsEndpoint = AWSEndpoint(endpoint: endpoint, signingName: authScheme["signingName"] as? String, signingRegion: authScheme["signingRegion"] as? String)
            
                    var host = ""
                    if let hostOverride = context.getHost() {
                        host = hostOverride
                    } else {
                        host = "\(context.getHostPrefix() ?? "")\(awsEndpoint.endpoint.host)"
                    }
            
                    if let protocolType = awsEndpoint.endpoint.protocolType {
                        input.withProtocol(protocolType)
                    }
            
                    var updatedContext = context
                    if let signingRegion = awsEndpoint.signingRegion {
                        updatedContext.attributes.set(key: HttpContext.signingRegion, value: signingRegion)
                    }
                    if let signingName = awsEndpoint.signingName {
                        updatedContext.attributes.set(key: HttpContext.signingName, value: signingName)
                    }
            
                    input.withMethod(context.getMethod())
                        .withHost(host)
                        .withPort(awsEndpoint.endpoint.port)
                        .withPath(context.getPath())
                        .withHeader(name: "Host", value: host)
            
                    return try await next.handle(context: updatedContext, input: input)
                }
            
                public typealias MInput = ClientRuntime.SdkHttpRequestBuilder
                public typealias MOutput = ClientRuntime.OperationOutput<OperationStackOutput>
                public typealias Context = ClientRuntime.HttpContext
            }
        """.trimIndent()
        contents.shouldContainOnlyOnce(expected)
    }
}
