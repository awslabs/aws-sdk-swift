/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.rulesengine.language.EndpointRuleSet
import software.amazon.smithy.rulesengine.language.syntax.parameters.Parameter
import software.amazon.smithy.rulesengine.language.syntax.parameters.ParameterType
import software.amazon.smithy.rulesengine.traits.ClientContextParamDefinition
import software.amazon.smithy.rulesengine.traits.ClientContextParamsTrait
import software.amazon.smithy.rulesengine.traits.ContextParamTrait
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.rulesengine.traits.StaticContextParamDefinition
import software.amazon.smithy.rulesengine.traits.StaticContextParamsTrait
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyTypes
import software.amazon.smithy.swift.codegen.utils.toLowerCamelCase

/**
 * Generates EndpointResolverMiddleware interception code.
 * Including creation of EndpointParams instance and pass it as middleware param along with EndpointResolver
 */
class OperationEndpointResolverMiddleware(
    val ctx: ProtocolGenerator.GenerationContext,
    val endpointResolverMiddlewareSymbol: Symbol,
) : MiddlewareRenderable {

    override val name = "EndpointResolverMiddleware"

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        renderEndpointParams(ctx, writer, op)

        // Write code that saves endpoint params to middleware context for use in auth scheme middleware when using rules-based auth scheme resolvers
        if (AuthSchemeResolverGenerator.usesRulesBasedAuthResolver(ctx)) {
            writer.write("context.attributes.set(key: \$N<EndpointParams>(name: \"EndpointParams\"), value: endpointParams)", SmithyTypes.AttributeKey)
        }

        super.renderSpecific(ctx, writer, op, operationStackName, "applyEndpoint")
    }

    override fun renderMiddlewareInit(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        op: OperationShape
    ) {
        val output = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op)
        writer.write(
            "\$N<\$N, EndpointParams>(endpointResolverBlock: { [config] in try config.endpointResolver.resolve(params: \$\$0) }, endpointParams: endpointParams)",
            endpointResolverMiddlewareSymbol,
            output
        )
    }

    private fun renderEndpointParams(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape) {
        val outputError = MiddlewareShapeUtils.outputErrorSymbol(op)
        val params = mutableListOf<String>()
        ctx.service.getTrait<EndpointRuleSetTrait>()?.ruleSet?.let { node ->
            val ruleSet = EndpointRuleSet.fromNode(node)
            val staticContextParams = op.getTrait<StaticContextParamsTrait>()?.parameters ?: emptyMap()
            val clientContextParams = ctx.service.getTrait<ClientContextParamsTrait>()?.parameters ?: emptyMap()
            val parameters = ruleSet.parameters.toList()
            parameters.toList()
                .sortedBy { it.name.toString() }
                .forEach { param ->
                    val memberName = param.name.toString().toLowerCamelCase()
                    val contextParam = ctx.model.expectShape(op.inputShape).members()
                        .firstOrNull { it.getTrait<ContextParamTrait>()?.name == param.name.toString() }
                    val value = resolveParameterValue(
                        param,
                        staticContextParams[param.name.toString()],
                        contextParam,
                        clientContextParams[param.name.toString()],
                        writer,
                        outputError
                    )
                    value?.let {
                        params.add("$memberName: $it")
                    }
                }
        }

        writer.write("let endpointParams = EndpointParams(${params.joinToString(separator = ", ")})")
    }

    /**
     * Resolve the parameter value based on the following order
     * 1. staticContextParams: direct value from the static context params
     * 2. contextParam: value from the input shape
     * 3. clientContextParams: value from the client config
     * 4. Built-In Bindings: value from the client config
     * 5. Built-in binding default values: default value from the built-in binding
     */
    private fun resolveParameterValue(
        param: Parameter,
        staticContextParam: StaticContextParamDefinition?,
        contextParam: MemberShape?,
        clientContextParam: ClientContextParamDefinition?,
        writer: SwiftWriter,
        outputError: Symbol
    ): String? {
        return when {
            staticContextParam != null -> {
                swiftParam(param.type, staticContextParam.value)
            }
            contextParam != null -> {
                return "input.${contextParam.memberName.toLowerCamelCase()}"
            }
            clientContextParam != null -> {
                when {
                    param.default.isPresent -> {
                        "config.${param.name.toString().toLowerCamelCase()} ?? ${param.defaultValueLiteral}"
                    }
                    else -> {
                        return "config.${param.name.toString().toLowerCamelCase()}"
                    }
                }
            }
            param.isBuiltIn -> {
                return when {
                    param.isRequired -> {
                        when {
                            param.default.isPresent -> {
                                "config.${param.name.toString().toLowerCamelCase()} ?? ${param.defaultValueLiteral}"
                            }
                            else -> {
                                // if the parameter is required, we must unwrap the optional value
                                writer.openBlock("guard let ${param.name.toString().toLowerCamelCase()} = config.${param.name.toString().toLowerCamelCase()} else {", "}") {
                                    writer.write("throw \$N.unknownError(\"Missing required parameter: \$L\")", SmithyTypes.ClientError, param.name.toString())
                                }
                                param.name.toString().toLowerCamelCase()
                            }
                        }
                    }
                    param.default.isPresent -> {
                        "config.${param.name.toString().toLowerCamelCase()} ?? ${param.defaultValueLiteral}"
                    }
                    else -> {
                        "config.${param.name.toString().toLowerCamelCase()}"
                    }
                }
            }
            else -> {
                // we can't resolve this param, skip it
                return null
            }
        }
    }
}

private val Parameter.defaultValueLiteral: String
    get() = swiftParam(type, default.get().toNode())

private fun swiftParam(parameterType: ParameterType, node: Node): String {
    return when (parameterType) {
        ParameterType.STRING -> "\"${node}\""
        ParameterType.BOOLEAN -> node.toString()
        ParameterType.STRING_ARRAY -> "[${node.expectArrayNode().map { "\"$it\"" }.joinToString(", ")}]"
    }
}
