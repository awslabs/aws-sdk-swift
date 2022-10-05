/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.reterminus.EndpointRuleset
import software.amazon.smithy.aws.swift.codegen.middleware.EndpointResolverMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.rulesengine.traits.EndpointTestsTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.MiddlewareGenerator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.getOrNull
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.utils.toCamelCase

/**
 * Generates a per/service endpoint resolver (internal to the generated SDK) using endpoints.json
 */
class EndpointResolverGenerator() {
    fun render(ctx: ProtocolGenerator.GenerationContext) {
        val rootNamespace = ctx.settings.moduleName

        val ruleSetNode = ctx.service.getTrait<EndpointRuleSetTrait>()?.ruleSet
        val ruleSet = if (ruleSetNode != null) EndpointRuleset.fromNode(ruleSetNode) else null

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

        ctx.service.getTrait<EndpointTestsTrait>()?.let { testsTrait ->
            if (testsTrait.testCases.isEmpty()) {
                return
            }

            ctx.delegator.useFileWriter("./${ctx.settings.moduleName}Tests/EndpointResolverTest.swift") { swiftWriter ->
                EndpointTestGenerator(testsTrait, ruleSet, ctx).render(swiftWriter)
            }
        }
    }

    private fun renderResolverProtocol(writer: SwiftWriter) {
        writer.openBlock("public protocol \$L {", "}", AWSServiceTypes.EndpointResolver) {
            writer.write("func resolve(params: EndpointParams) throws -> \$L", ClientRuntimeTypes.Core.Endpoint)
        }
    }

    private fun renderResolver(writer: SwiftWriter, endpointRules: EndpointRuleset?) {
        writer.openBlock("public struct \$L: \$L  {", "}", AWSServiceTypes.DefaultEndpointResolver, AWSServiceTypes.EndpointResolver) {
            writer.write("")
            writer.write("private let engine: \$L", AWSClientRuntimeTypes.Core.AWSEndpointsRuleEngine)
            writer.write("private let ruleSetString = \$S", Node.printJson(endpointRules?.toNode()))
            writer.write("")
            writer.openBlock("public init() throws {", "}") {
                writer.write("engine = try \$L(ruleSetString: ruleSetString)", AWSClientRuntimeTypes.Core.AWSEndpointsRuleEngine)
            }
            writer.write("")
            writer.openBlock(
                "public func resolve(params: EndpointParams) throws -> \$L {", "}", ClientRuntimeTypes.Core.Endpoint
            ) {
                writer.write("let context = try \$L()", AWSClientRuntimeTypes.Core.AWSEndpointsRequestContext)
                endpointRules?.parameters?.toList()?.sortedBy { it.name.toString() }?.let { sortedParameters ->
                    sortedParameters.forEach { param ->
                        val memberName = param.name.toString().toCamelCase()
                        val paramName = param.name.toString()
                        writer.write("try context.add(name: \$S, value: params.\$L)", paramName, memberName)
                    }
                    writer.write("")
                }
                writer.openBlock("guard let crtResolvedEndpoint = try engine.resolve(context: context) else {", "}") {
                    writer.write("throw EndpointError.unresolved(\"Failed to resolved endpoint\")")
                }.write("")

                writer.openBlock("if crtResolvedEndpoint.getType() == .error {", "}") {
                    writer.write("let error = try crtResolvedEndpoint.getError()")
                    writer.write("throw EndpointError.unresolved(error)")
                }.write("")

                writer.openBlock("guard let url = try crtResolvedEndpoint.getURL() else {", "}") {
                    writer.write("assertionFailure(\"This must be a bug in either CRT or the rule engine, if the endpoint is not an error, it must have a url\")")
                    writer.write("throw EndpointError.unresolved(\"Failed to resolved endpoint\")")
                }.write("")

                writer.write("let headers = try crtResolvedEndpoint.getHeaders() ?? [:]")
                writer.write("let properties = try crtResolvedEndpoint.getProperties() ?? [:]")
                writer.write("return try Endpoint(urlString: url, headers: Headers(headers), properties: properties)")
            }
        }
    }
}
