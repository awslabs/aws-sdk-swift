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

class Sha256TreeHashMiddleware(private val symbolProvider: SymbolProvider, private val model: Model) : MiddlewareRenderable {
    override val name = "Sha256TreeHashMiddleware"

    override val middlewareStep = MiddlewareStep.FINALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val outputShape = MiddlewareShapeUtils.outputSymbol(symbolProvider, model, op)
        val outputErrorShapeName = MiddlewareShapeUtils.outputErrorSymbolName(op)
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N<\$N, $outputErrorShapeName>())", AWSClientRuntimeTypes.Core.Sha256TreeHashMiddleware, outputShape)
    }
}
