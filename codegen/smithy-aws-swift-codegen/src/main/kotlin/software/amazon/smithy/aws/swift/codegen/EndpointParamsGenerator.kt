/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.rulesengine.language.EndpointRuleSet
import software.amazon.smithy.rulesengine.language.syntax.parameters.Parameter
import software.amazon.smithy.rulesengine.language.syntax.parameters.ParameterType
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.model.boxed
import software.amazon.smithy.swift.codegen.model.defaultValue
import software.amazon.smithy.swift.codegen.utils.toLowerCamelCase

/**
 * Generates EndpointParams struct for the service
 */
class EndpointParamsGenerator(private val endpointRules: EndpointRuleSet?) {
    fun render(writer: SwiftWriter) {
        writer.openBlock("public struct EndpointParams {", "}") {
            endpointRules?.parameters?.toList()?.sortedBy { it.name.toString() }?.let { sortedParameters ->
                renderMembers(writer, sortedParameters)
                writer.write("")
                renderInit(writer, sortedParameters)
            }
        }
    }

    private fun renderInit(writer: SwiftWriter, parameters: List<Parameter>) {
        writer.openBlock("public init(", ")") {
            for ((index, param) in parameters.withIndex()) {
                val memberName = param.name.toString().toLowerCamelCase()
                val memberSymbol = param.toSymbol()
                val terminator = if (index != parameters.lastIndex) "," else ""
                writer.write("$memberName: \$D$terminator", memberSymbol)
            }
        }

        writer.openBlock("{", "}") {
            parameters.forEach {
                val memberName = it.name.toString().toLowerCamelCase()
                writer.write("self.\$1L = \$1L", memberName)
            }
        }
    }

    private fun renderMembers(writer: SwiftWriter, parameters: List<Parameter>) {
        parameters.forEach { param ->
            val memberName = param.name.toString().toLowerCamelCase()
            val memberSymbol = param.toSymbol()
            val optional = if (param.isRequired) "" else "?"
            param.documentation.orElse(null)?.let { writer.write("/// $it") }
            writer.write("public let \$L: \$L$optional", memberName, memberSymbol)
        }
    }
}

fun Parameter.toSymbol(): Symbol {
    val swiftType = when (type) {
        ParameterType.STRING -> SwiftTypes.String
        ParameterType.BOOLEAN -> SwiftTypes.Bool
        else -> throw CodegenException("Unsupported parameter type: $type")
    }
    var builder = Symbol.builder().name(swiftType.fullName)
    if (!isRequired) {
        builder = builder.boxed()
    }

    default.ifPresent { defaultValue ->
        builder.defaultValue(defaultValue.toString())
    }

    return builder.build()
}
