/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.node.Node
import software.amazon.smithy.rulesengine.language.syntax.parameters.Parameter
import software.amazon.smithy.rulesengine.language.syntax.parameters.ParameterType

private val Parameter.defaultValueLiteral: String
    get() = swiftParam(type, default.get().toNode())

private fun swiftParam(parameterType: ParameterType, node: Node): String {
    return when (parameterType) {
        ParameterType.STRING -> "\"${node}\""
        ParameterType.BOOLEAN -> node.toString()
        ParameterType.STRING_ARRAY -> "[${node.expectArrayNode().map { "\"$it\"" }.joinToString(", ")}]"
    }
}
