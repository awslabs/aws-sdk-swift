/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.swift.codegen.integration.plugins

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.model.buildSymbol

class DefaultAWSClientPlugin : Plugin {
    override val className: Symbol
        get() = buildSymbol {
            this.name = "DefaultAWSClientPlugin"
            this.namespace = AWSSwiftDependency.AWS_CLIENT_RUNTIME.target
            dependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
        }

    override val isDefault: Boolean
        get() = true

    override fun customInitialization(writer: SwiftWriter) {
        writer.writeInline("\$L(clientName: self.clientName)", className)
    }
}
