/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSServiceTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.swift.codegen.ENDPOINT_PARAMS
import software.amazon.smithy.aws.swift.codegen.ENDPOINT_RESOLVER
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
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

    override val typeName =
        "EndpointResolverMiddleware<$outputSymbol: ${ClientRuntimeTypes.Http.HttpResponseBinding}, $outputErrorSymbol: ${ClientRuntimeTypes.Http.HttpResponseBinding}>"

    override val properties: MutableMap<String, Symbol> = mutableMapOf(
        ENDPOINT_RESOLVER to AWSServiceTypes.EndpointResolver, ENDPOINT_PARAMS to AWSServiceTypes.EndpointParams
    )

    override fun generateInit() {
        writer.openBlock(
            "public init($ENDPOINT_RESOLVER: \$N, $ENDPOINT_PARAMS: \$N) {",
            "}",
            AWSServiceTypes.EndpointResolver,
            AWSServiceTypes.EndpointParams
        ) {
            writer.write("self.\$L = \$L", ENDPOINT_RESOLVER, ENDPOINT_RESOLVER)
            writer.write("self.\$L = \$L", ENDPOINT_PARAMS, ENDPOINT_PARAMS)
        }
    }

    override fun generateMiddlewareClosure() {
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.packageName)
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.packageName)
        writer.write("let endpoint = try endpointResolver.resolve(params: endpointParams)")

        writer.write("")
        writer.openBlock("guard let authScheme = endpoint.authScheme(name: \"sigv4\") else {", "}") {
            writer.write(
                "throw \$N.client(ClientError.unknownError((\"Unable to resolve endpoint. Missing auth scheme.\")))",
                errorType
            )
        }

        writer.write("")
        writer.write("let awsEndpoint = AWSEndpoint(endpoint: endpoint, signingName: authScheme[\"signingName\"] as? String, signingRegion: authScheme[\"signingRegion\"] as? String)")

        writer.write("")
        writer.write("var host = \"\"")
        writer.openBlock("if let hostOverride = context.getHost() {", "} else {") {
            writer.write("host = hostOverride")
        }
        writer.indent().write("host = \"\\(context.getHostPrefix() ?? \"\")\\(awsEndpoint.endpoint.host)\"").dedent()
            .write("}")

        writer.write("")
        writer.openBlock("if let protocolType = awsEndpoint.endpoint.protocolType {", "}") {
            writer.write("input.withProtocol(protocolType)")
        }

        writer.write("")
        writer.write("var updatedContext = context")
        writer.openBlock("if let signingRegion = awsEndpoint.signingRegion {", "}") {
            writer.write("updatedContext.attributes.set(key: HttpContext.signingRegion, value: signingRegion)")
        }
        writer.openBlock("if let signingName = awsEndpoint.signingName {", "}") {
            writer.write("updatedContext.attributes.set(key: HttpContext.signingName, value: signingName)")
        }

        writer.write("")
        writer.write("input.withMethod(context.getMethod())")
        writer.indent()
        writer.write(".withHost(host)")
        writer.write(".withPort(awsEndpoint.endpoint.port)")
        writer.write(".withPath(context.getPath())")
        writer.write(".withHeader(name: \"Host\", value: host)")
        writer.dedent()
        writer.write("")
    }

    override fun renderReturn() {
        writer.write("return try await next.handle(context: updatedContext, input: input)")
    }
}
