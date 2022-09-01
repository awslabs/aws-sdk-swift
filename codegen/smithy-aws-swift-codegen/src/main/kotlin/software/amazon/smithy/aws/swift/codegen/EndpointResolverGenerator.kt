/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.reterminus.EndpointRuleset
import software.amazon.smithy.aws.swift.codegen.middleware.EndpointResolverMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.rulesengine.traits.EndpointTestsTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.MiddlewareGenerator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.getTrait

/**
 * Generates a per/service endpoint resolver (internal to the generated SDK) using endpoints.json
 */
class EndpointResolverGenerator() {
    fun render(ctx: ProtocolGenerator.GenerationContext) {
        val rootNamespace = ctx.settings.moduleName

        ctx.delegator.useFileWriter("./$rootNamespace/EndpointResolver.swift") {
            val ruleSetNode = ctx.service.getTrait<EndpointRuleSetTrait>()?.ruleSet
            val ruleSet = if (ruleSetNode != null) EndpointRuleset.fromNode(ruleSetNode) else null
            val endpointParamsGenerator = EndpointParamsGenerator(ruleSet)
            endpointParamsGenerator.render(it)
        }

        ctx.delegator.useFileWriter("./$rootNamespace/EndpointResolver.swift") {
            renderResolverProtocol(it)
            it.write("")
            renderResolver(it)
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
                EndpointTestGenerator(testsTrait, ctx).render(swiftWriter)
            }
        }
    }

    private fun renderResolverProtocol(writer: SwiftWriter) {
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)

        writer.openBlock("public protocol EndpointResolver {", "}") {
            writer.write("func resolve(params: EndpointParams) throws -> \$L", ClientRuntimeTypes.Core.Endpoint)
        }
    }

    private fun renderResolver(writer: SwiftWriter) {
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)

        writer.openBlock("public struct DefaultEndpointResolver: EndpointResolver  {", "}") {
            writer.write("public init() {}")
            writer.openBlock(
                "public func resolve(params: EndpointParams) throws -> \$L {", "}", ClientRuntimeTypes.Core.Endpoint
            ) {
                writer.write("fatalError(\"EndpointResolver not implemented\")")
            }
        }
    }
}
