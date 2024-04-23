/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.endpoint.EndpointResolverMiddleware

/**
 * Generates AWS endpoint middleware for the service.
 */
class AWSEndpointResolverMiddleware(
    private val writer: SwiftWriter,
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol
) : EndpointResolverMiddleware(writer, inputSymbol, outputSymbol, outputErrorSymbol) {

    override val id: String = "EndpointResolverMiddleware"

    override val typeName = "EndpointResolverMiddleware<$outputSymbol>"

    override fun generateMiddlewareClosure() {
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        writer.write("let endpoint = try endpointResolver.resolve(params: endpointParams)")
            .write("")

        writer.write("var signingName: String? = nil")
        writer.write("var signingRegion: String? = nil")
        writer.write("var signingAlgorithm: String? = nil")
        writer.openBlock("if let authSchemes = endpoint.authSchemes() {", "}") {
            writer.write("let schemes = try authSchemes.map { try EndpointAuthScheme(from: \$$0) }")
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
            writer.write("context.attributes.set(key: AttributeKeys.signingRegion, value: signingRegion)")
            writer.write("context.attributes.set(key: AttributeKeys.selectedAuthScheme, value: context.getSelectedAuthScheme()?.getCopyWithUpdatedSigningProperty(key: AttributeKeys.signingRegion, value: signingRegion))")
        }
        writer.openBlock("if let signingName = signingName {", "}") {
            writer.write("context.attributes.set(key: AttributeKeys.signingName, value: signingName)")
            writer.write("context.attributes.set(key: AttributeKeys.selectedAuthScheme, value: context.getSelectedAuthScheme()?.getCopyWithUpdatedSigningProperty(key: AttributeKeys.signingName, value: signingName))")
        }
        writer.openBlock("if let signingAlgorithm = signingAlgorithm {", "}") {
            writer.write("context.attributes.set(key: AttributeKeys.signingAlgorithm, value: AWSSigningAlgorithm(rawValue: signingAlgorithm))")
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
}
