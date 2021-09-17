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
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class RetryMiddleware : MiddlewareRenderable {

    override val name = "RetryMiddleware"

    override val middlewareStep = MiddlewareStep.FINALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(model: Model, symbolProvider: SymbolProvider, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N(${middlewareParamsString(model, symbolProvider, op)}))", AWSClientRuntimeTypes.Core.RetryerMiddleware)
    }

    override fun middlewareParamsString(model: Model, symbolProvider: SymbolProvider, op: OperationShape): String {
        return "retryer: config.retryer"
    }
}
