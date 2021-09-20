/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes.AWSJSON.XAmzTargetMiddleware
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.ServiceGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class AWSXAmzTargetMiddleware(val serviceShape: ServiceShape) : MiddlewareRenderable {

    override val name = "AWSXAmzTargetMiddleware"

    override val middlewareStep = MiddlewareStep.SERIALIZESTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(
        model: Model,
        symbolProvider: SymbolProvider,
        writer: SwiftWriter,
        op: OperationShape,
        operationStackName: String
    ) {
        val inputShapeName = ServiceGenerator.getOperationInputShapeName(symbolProvider, model, op)
        val outputShapeName = ServiceGenerator.getOperationOutputShapeName(symbolProvider, model, op)
        val outputErrorName = ServiceGenerator.getOperationErrorShapeName(op)
        writer.addImport(XAmzTargetMiddleware)
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N<$inputShapeName, $outputShapeName, $outputErrorName>(${middlewareParamsString(op)}))", XAmzTargetMiddleware)
    }

    private fun middlewareParamsString(op: OperationShape): String {
        val xAmzTargetValue = xAmzTargetValue(serviceShape, op)
        return "xAmzTarget: \"${xAmzTargetValue}\""
    }

    private fun xAmzTargetValue(serviceShape: ServiceShape, op: OperationShape): String {
        return "${serviceShape.id.name}.${op.id.name}"
    }
}
