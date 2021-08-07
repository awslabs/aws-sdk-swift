package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.knowledge.ServiceIndex
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.traits.OptionalAuthTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.MiddlewarePosition
import software.amazon.smithy.swift.codegen.integration.MiddlewareStep
import software.amazon.smithy.swift.codegen.integration.OperationMiddlewareRenderable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.expectTrait
import software.amazon.smithy.swift.codegen.model.hasTrait

open class AWSSigningMiddleware : OperationMiddlewareRenderable {

    override val name = "AWSSigningMiddleware"

    override val middlewareStep = MiddlewareStep.FINALIZESTEP

    override val position = MiddlewarePosition.BEFORE

    open fun renderConfigDeclaration(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape
    ) {
        writer.write("let sigv4Config = \$N(${middlewareParamsString(ctx, serviceShape, op)})", AWSClientRuntimeTypes.Signing.SigV4Config)
    }

    override fun render(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape,
        operationStackName: String
    ) {
        // FIXME handle indentation properly or do swift formatting after the fact
        renderConfigDeclaration(ctx, writer, serviceShape, op)
        writer.write(
            "$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()},\n" +
                "                                         middleware: \$N(config: sigv4Config))",
            AWSClientRuntimeTypes.Signing.SigV4Middleware
        )
    }

    override fun middlewareParamsString(
        ctx: ProtocolGenerator.GenerationContext,
        serviceShape: ServiceShape,
        op: OperationShape
    ): String {
        val hasUnsignedPayload = op.hasTrait<UnsignedPayloadTrait>()
        return "unsignedBody: $hasUnsignedPayload"
    }

    companion object {
        /**
         * Get the SigV4Trait auth name to sign request for
         *
         * @param serviceShape service shape for the API
         * @return the service name to use in the credential scope to sign for
         */
        fun signingServiceName(serviceShape: ServiceShape): String {
            val sigv4Trait = serviceShape.expectTrait<SigV4Trait>()
            return sigv4Trait.name
        }

        /**
         * Returns if the SigV4Trait is an auth scheme for the service and operation.
         *
         * @param model     model definition
         * @param service   service shape for the API
         * @param operation operation shape
         * @return if SigV4Trait is an auth scheme for the operation and service.
         */
        fun hasSigV4AuthScheme(model: Model, service: ServiceShape, operation: OperationShape): Boolean {
            val auth = ServiceIndex.of(model).getEffectiveAuthSchemes(service.id, operation.id)
            return auth.containsKey(SigV4Trait.ID) && !operation.hasTrait<OptionalAuthTrait>()
        }
    }
}
