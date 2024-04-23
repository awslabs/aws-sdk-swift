/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.rulesengine.language.syntax.parameters.Parameter
import software.amazon.smithy.rulesengine.language.syntax.parameters.ParameterType

private val Parameter.defaultValueLiteral: String
    get() {
        return when (type) {
            ParameterType.BOOLEAN -> default.get().toString()
            ParameterType.STRING -> "\"${default.get()}\""
        }
    }
