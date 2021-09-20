package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.hasTrait

class S3SigningMiddleware : MiddlewareRenderable {
    override val name = "AWSSigningMiddleware"

    override val middlewareStep = MiddlewareStep.FINALIZESTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(
        model: Model,
        symbolProvider: SymbolProvider,
        writer: SwiftWriter,
        op: OperationShape,
        operationStackName: String
    ) {
        renderConfigDeclaration(writer, op)
        writer.write(
            "$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N(config: sigv4Config))",
            AWSClientRuntimeTypes.Signing.SigV4Middleware
        )
    }
    private fun renderConfigDeclaration(
        writer: SwiftWriter,
        op: OperationShape
    ) {
        writer.addImport(AWSClientRuntimeTypes.Signing.SigV4Config)
        writer.write("let sigv4Config = \$N(${middlewareParamsString(op)})", AWSClientRuntimeTypes.Signing.SigV4Config)
    }

    private fun middlewareParamsString(op: OperationShape): String {
        val hasUnsignedPayload = op.hasTrait<UnsignedPayloadTrait>()
        return "useDoubleURIEncode: false, shouldNormalizeURIPath: false, signedBodyHeader: .contentSha256, unsignedBody: $hasUnsignedPayload"
    }
}
