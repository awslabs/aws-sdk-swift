/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.reterminus.EndpointRuleset
import software.amazon.smithy.aws.reterminus.lang.parameters.Parameter
import software.amazon.smithy.aws.reterminus.lang.parameters.ParameterType
import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.getOrNull
import software.amazon.smithy.swift.codegen.model.boxed
import software.amazon.smithy.swift.codegen.model.defaultValue
import software.amazon.smithy.swift.codegen.utils.toCamelCase

/**
 * Generates EndpointParams struct for the service
 */
class EndpointParamsGenerator(private val endpointRules: EndpointRuleset?) {
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
                val memberName = param.name.toString().toCamelCase()
                val memberSymbol = param.toSymbol()
                val terminator = if (index != parameters.lastIndex) ", " else ""
                writer.write("$memberName: \$D$terminator", memberSymbol)
            }
        }

        writer.openBlock("{", "}") {
            parameters.forEach {
                val memberName = it.name.toString().toCamelCase()
                writer.write("self.\$1L = \$1L", memberName)
            }
        }
    }

    private fun renderMembers(writer: SwiftWriter, parameters: List<Parameter>) {
        parameters.forEach { param ->
            val memberName = param.name.toString().toCamelCase()
            val memberSymbol = param.toSymbol()
            val optional = if (param.isRequired) "" else "?"
            val documentation = param.documentation.getOrNull()
            if (documentation != null) {
                writer.write("/// $documentation")
            }
            writer.write("public let \$L: \$L$optional", memberName, memberSymbol)
        }
    }
}

fun Parameter.toSymbol(): Symbol {
    val swiftType = when (this.type) {
        ParameterType.STRING -> SwiftTypes.String
        ParameterType.BOOLEAN -> SwiftTypes.Bool
        else -> throw CodegenException("Unsupported parameter type: ${this.type}")
    }
    var builder = Symbol.builder().name(swiftType.fullName)
    if (!this.isRequired) {
        builder = builder.boxed()
    }

    this.defaultValue.ifPresent { defaultValue ->
        builder.defaultValue(defaultValue.toString())
    }

    return builder.build()
}
