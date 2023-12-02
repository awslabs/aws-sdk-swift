/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AUTH_SCHEME_RESOLVER
import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSServiceTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.swift.codegen.ENDPOINT_PARAMS
import software.amazon.smithy.aws.swift.codegen.ENDPOINT_RESOLVER
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.steps.OperationBuildStep

/**
 * Generates endpoint middleware for the service.
 */
class EndpointResolverMiddleware(
    private val writer: SwiftWriter,
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol
) : Middleware(writer, inputSymbol, OperationBuildStep(outputSymbol, outputErrorSymbol)) {

    override val id: String = "EndpointResolverMiddleware"

    override val typeName = "EndpointResolverMiddleware<$outputSymbol>"

    override val properties: MutableMap<String, Symbol> = mutableMapOf(
        ENDPOINT_RESOLVER to AWSServiceTypes.EndpointResolver,
        ENDPOINT_PARAMS to AWSServiceTypes.EndpointParams,
        AUTH_SCHEME_RESOLVER to AWSClientRuntimeTypes.Core.AuthSchemeResolver
    )

    override fun generateInit() {
        writer.openBlock(
            "public init($ENDPOINT_RESOLVER: \$N, $ENDPOINT_PARAMS: \$N, $AUTH_SCHEME_RESOLVER: \$N = \$N()) {",
            "}",
            AWSServiceTypes.EndpointResolver,
            AWSServiceTypes.EndpointParams,
            AWSClientRuntimeTypes.Core.AuthSchemeResolver,
            AWSClientRuntimeTypes.Core.DefaultAuthSchemeResolver
        ) {
            writer.write("self.\$L = \$L", ENDPOINT_RESOLVER, ENDPOINT_RESOLVER)
            writer.write("self.\$L = \$L", ENDPOINT_PARAMS, ENDPOINT_PARAMS)
            writer.write("self.\$L = \$L", AUTH_SCHEME_RESOLVER, AUTH_SCHEME_RESOLVER)
        }
    }

    override fun generateMiddlewareClosure() {
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        writer.write("let endpoint = try endpointResolver.resolve(params: endpointParams)")
            .write("")

        writer.write("var signingName: String? = nil")
        writer.write("var signingRegion: String? = nil")
        writer.write("var signingAlgorithm: String? = nil")
        writer.openBlock("if let authSchemes = endpoint.authSchemes() {", "}") {
            writer.write("let schemes = try authSchemes.map { try AuthScheme(from: \$$0) }")
            writer.write("let authScheme = try authSchemeResolver.resolve(authSchemes: schemes)")
            writer.write("signingAlgorithm = authScheme.name")
            writer.write("switch authScheme {")
            writer.write("case .sigV4(let param):")
            writer.indent()
            writer.write("signingName = param.signingName")
            writer.write("signingRegion = param.signingRegion")
            writer.dedent()
            writer.write("case .sigV4A(let param):")
            writer.indent()
            writer.write("signingName = param.signingName")
            writer.write("signingRegion = param.signingRegionSet?.first")
            writer.dedent()
            writer.write("case .none:")
            writer.indent()
            writer.write("break")
            writer.dedent()
            writer.write("}")
        }
        writer.write("")
        writer.write("let awsEndpoint = AWSEndpoint(endpoint: endpoint, signingName: signingName, signingRegion: signingRegion)")
            .write("")

        writer.write("""var host = """"")
            .openBlock("if let hostOverride = context.getHost() {", "} else {") {
                writer.write("host = hostOverride")
            }
            .indent()
            .write("""host = "\(context.getHostPrefix() ?? "")\(awsEndpoint.endpoint.host)"""")
            .dedent()
            .write("}")

        writer.write("")
        writer.openBlock("if let protocolType = awsEndpoint.endpoint.protocolType {", "}") {
            writer.write("input.withProtocol(protocolType)")
        }.write("")

        writer.openBlock("if let signingRegion = signingRegion {", "}") {
            writer.write("context.attributes.set(key: HttpContext.signingRegion, value: signingRegion)")
        }
        writer.openBlock("if let signingName = signingName {", "}") {
            writer.write("context.attributes.set(key: HttpContext.signingName, value: signingName)")
        }
        writer.openBlock("if let signingAlgorithm = signingAlgorithm {", "}") {
            writer.write("context.attributes.set(key: HttpContext.signingAlgorithm, value: signingAlgorithm)")
        }.write("")

        writer.openBlock("if let headers = endpoint.headers {", "}") {
            writer.write("input.withHeaders(headers)")
        }.write("")

        writer.write("input.withMethod(context.getMethod())")
            .indent()
            .write(".withHost(host)")
            .write(".withPort(awsEndpoint.endpoint.port)")
            .write(".withPath(awsEndpoint.endpoint.path.appendingPathComponent(context.getPath()))")
            .write(""".withHeader(name: "Host", value: host)""")
            .dedent()
            .write("")
    }

    override fun renderReturn() {
        writer.write("return try await next.handle(context: context, input: input)")
    }
}
