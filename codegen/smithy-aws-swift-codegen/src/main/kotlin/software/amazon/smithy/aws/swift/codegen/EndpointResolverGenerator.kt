/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.middleware.EndpointResolverMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.rulesengine.language.EndpointRuleSet
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.MiddlewareGenerator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.utils.toLowerCamelCase

/**
 * Generates a per/service endpoint resolver (internal to the generated SDK)
 */
class EndpointResolverGenerator() {
    fun render(ctx: ProtocolGenerator.GenerationContext) {
        val rootNamespace = ctx.settings.moduleName

        val ruleSetNode = ctx.service.getTrait<EndpointRuleSetTrait>()?.ruleSet
        val ruleSet = if (ruleSetNode != null) EndpointRuleSet.fromNode(ruleSetNode) else null

        ctx.delegator.useFileWriter("./$rootNamespace/EndpointResolver.swift") {
            val endpointParamsGenerator = EndpointParamsGenerator(ruleSet)
            endpointParamsGenerator.render(it)
        }

        ctx.delegator.useFileWriter("./$rootNamespace/EndpointResolver.swift") {
            renderResolverProtocol(it)
            it.write("")
            renderResolver(it, ruleSet)
            val inputSymbol = Symbol.builder().name("SdkHttpRequestBuilder").build()
            val outputSymbol = Symbol.builder().name("OperationStackOutput").build()
            val outputErrorSymbol = Symbol.builder().name("OperationStackError").build()
            val middleware = EndpointResolverMiddleware(it, inputSymbol, outputSymbol, outputErrorSymbol)
            it.addImport(SwiftDependency.CLIENT_RUNTIME.target)
            it.write("")
            MiddlewareGenerator(it, middleware).generate()
        }
    }

    private fun renderResolverProtocol(writer: SwiftWriter) {
        writer.openBlock("public protocol \$L {", "}", AWSServiceTypes.EndpointResolver) {
            writer.write("func resolve(params: EndpointParams) throws -> \$L", ClientRuntimeTypes.Core.Endpoint)
        }
    }

    private fun renderResolver(writer: SwiftWriter, endpointRules: EndpointRuleSet?) {
        writer.openBlock("public struct \$L: \$L  {", "}", AWSServiceTypes.DefaultEndpointResolver, AWSServiceTypes.EndpointResolver) {
            writer.write("")
            endpointRules?.let {
                writer.write("private let engine: \$L", AWSClientRuntimeTypes.Core.AWSEndpointsRuleEngine)
                writer.write("private let ruleSet = \$S", Node.printJson(endpointRules.toNode()))
            }
            writer.write("")
            writer.openBlock("public init() throws {", "}") {
                endpointRules?.let {
                    writer.write("engine = try \$L(ruleSet: ruleSet)", AWSClientRuntimeTypes.Core.AWSEndpointsRuleEngine)
                }
            }
            writer.write("")
            writer.openBlock(
                "public func resolve(params: EndpointParams) throws -> \$L {", "}", ClientRuntimeTypes.Core.Endpoint
            ) {
                endpointRules?.let {
                    writer.write("let context = try \$L()", AWSClientRuntimeTypes.Core.AWSEndpointsRequestContext)
                    endpointRules.parameters?.toList()?.sortedBy { it.name.toString() }?.let { sortedParameters ->
                        sortedParameters.forEach { param ->
                            val memberName = param.name.toString().toLowerCamelCase()
                            val paramName = param.name.toString()
                            writer.write("try context.add(name: \$S, value: params.\$L)", paramName, memberName)
                        }
                        writer.write("")
                    }
                    writer.openBlock("guard let crtResolvedEndpoint = try engine.resolve(context: context) else {", "}") {
                        writer.write("throw EndpointError.unresolved(\"Failed to resolved endpoint\")")
                    }.write("")

                    writer.openBlock("if crtResolvedEndpoint.getType() == .error {", "}") {
                        writer.write("let error = crtResolvedEndpoint.getError()")
                        writer.write("throw EndpointError.unresolved(error)")
                    }.write("")

                    writer.openBlock("guard let url = crtResolvedEndpoint.getURL() else {", "}") {
                        writer.write("assertionFailure(\"This must be a bug in either CRT or the rule engine, if the endpoint is not an error, it must have a url\")")
                        writer.write("throw EndpointError.unresolved(\"Failed to resolved endpoint\")")
                    }.write("")

                    writer.write("let headers = crtResolvedEndpoint.getHeaders() ?? [:]")
                    writer.write("let properties = crtResolvedEndpoint.getProperties() ?? [:]")
                    writer.write("return try Endpoint(urlString: url, headers: Headers(headers), properties: properties)")
                } ?: run {
                    writer.write("fatalError(\"EndpointResolver not implemented\")")
                }
            }
        }
    }
}
