/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class EndpointResolverMiddleware(
    val model: Model,
    val symbolProvider: SymbolProvider
) : MiddlewareRenderable {

    override val name = "EndpointResolverMiddleware"

    override val middlewareStep = MiddlewareStep.BUILDSTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val output = MiddlewareShapeUtils.outputSymbol(symbolProvider, model, op)
        val outputError = MiddlewareShapeUtils.outputErrorSymbol(op)
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N<\$N, \$N>(${middlewareParamsString()}))", AWSClientRuntimeTypes.Core.EndpointResolverMiddleware, output, outputError)
    }

    private fun middlewareParamsString(): String {
        return "endpointResolver: config.endpointResolver, serviceId: serviceName"
    }
}
