/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class UserAgentMiddleware(val settings: SwiftSettings) : MiddlewareRenderable {

    override val name = "UserAgentMiddleware"

    override val middlewareStep = MiddlewareStep.BUILDSTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write("let apiMetadata = \$N(serviceId: serviceName, version: \"${settings.moduleVersion}\")", AWSClientRuntimeTypes.Core.APIMetadata)
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N(${middlewareParamsString()}))", AWSClientRuntimeTypes.Core.UserAgentMiddleware)
    }

    private fun middlewareParamsString(): String {
        return "metadata: ${AWSClientRuntimeTypes.Core.AWSUserAgentMetadata}.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)"
    }
}
