/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.reterminus.EndpointRuleset
import software.amazon.smithy.aws.swift.codegen.AWSServiceTypes
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.rulesengine.traits.ClientContextParamsTrait
import software.amazon.smithy.rulesengine.traits.ContextParamTrait
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.rulesengine.traits.StaticContextParamsTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.getOrNull
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.utils.toCamelCase

/**
 * Generates EndpointResolverMiddleware interception code.
 * Including creation of EndpointParams instance and pass it as middleware param along with EndpointResolver
 */
class OperationEndpointResolverMiddleware(
    val ctx: ProtocolGenerator.GenerationContext,
) : MiddlewareRenderable {

    override val name = "EndpointResolverMiddleware"

    override val middlewareStep = MiddlewareStep.BUILDSTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val output = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op)
        val outputError = MiddlewareShapeUtils.outputErrorSymbol(op)
        val params = mutableListOf<String>()
        ctx.service.getTrait<EndpointRuleSetTrait>()?.ruleSet?.let { node ->
            val ruleSet = EndpointRuleset.fromNode(node)
            val staticContextParams = op.getTrait<StaticContextParamsTrait>()?.parameters ?: emptyMap()
            val clientContextParams =
                ctx.service.getTrait<ClientContextParamsTrait>()?.parameters ?: emptyMap()
            val parameters = ruleSet.parameters.toList()
            parameters.toList()
                .sortedBy { it.name.toString() }
                .forEach { param ->
                    val memberName = param.name.toString().toCamelCase()
                    val contextParam = ctx.model.expectShape(op.inputShape).members()
                        .firstOrNull { it.getTrait<ContextParamTrait>()?.name == param.name.toString() }
                    if (staticContextParams.containsKey(param.name.toString())) {
                        // check static context params
                        params.add("$memberName: ${staticContextParams[param.name.toString()]?.value}")
                    } else if (contextParam != null) {
                        // check context params that comes from the input shape
                        params.add("$memberName: input.${contextParam.memberName.toCamelCase()}")
                    } else if (param.builtIn.getOrNull() != null) {
                        // check the built-in params that comes from the client config
                        val defaultValue = if (param.isRequired) " ?? ${param.defaultValue.getOrNull()}" else ""
                        params.add("$memberName: config.${param.name.toString().toCamelCase()}$defaultValue")
                    } else if (param.defaultValue.getOrNull() != null) {
                        // check if the param has a default value
                        params.add("$memberName: ${param.defaultValue.getOrNull().toString().toCamelCase()}")
                    }
                }
        }
        writer.write("let endpointParams = EndpointParams(${params.joinToString(separator = ", ")})")
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N<\$N, \$N>(${middlewareParamsString()}))", AWSServiceTypes.EndpointResolverMiddleware, output, outputError)
    }

    private fun middlewareParamsString(): String {
        return "endpointResolver: config.endpointResolver, endpointParams: endpointParams"
    }
}
