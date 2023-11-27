/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSServiceTypes
import software.amazon.smithy.codegen.core.Symbol
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
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.utils.toLowerCamelCase

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

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val output = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op)
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
        val middlewareParamsString = "endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams"
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N<\$N>($middlewareParamsString))", AWSServiceTypes.EndpointResolverMiddleware, output)
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
                return when (param.type) {
                    ParameterType.STRING -> {
                        "\"${staticContextParam.value}\""
                    }

                    ParameterType.BOOLEAN -> {
                        staticContextParam.value.toString()
                    }
                }
            }
            contextParam != null -> {
                return "input.${contextParam.memberName.toLowerCamelCase()}"
            }
            clientContextParam != null -> {
                when {
                    param.default.isPresent -> {
                        "config.serviceSpecific.${param.name.toString().toLowerCamelCase()} ?? ${param.defaultValueLiteral}"
                    }
                    else -> {
                        return "config.serviceSpecific.${param.name.toString().toLowerCamelCase()}"
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
                                    writer.write("throw SdkError<\$N>.client(ClientError.unknownError((\"Missing required parameter: \$L\")))", outputError, param.name.toString())
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
    get() {
        return when (type) {
            ParameterType.BOOLEAN -> default.get().toString()
            ParameterType.STRING -> "\"${default.get()}\""
        }
    }
