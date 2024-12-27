package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.aws.swift.codegen.AWSHTTPBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.middleware.MutateHeadersMiddleware
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.StreamingTrait
import software.amazon.smithy.model.traits.UnitTypeTrait
import software.amazon.smithy.protocol.traits.Rpcv2CborTrait
import software.amazon.smithy.swift.codegen.SyntheticClone
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.ContentLengthMiddleware
import software.amazon.smithy.swift.codegen.integration.middlewares.ContentTypeMiddleware
import software.amazon.smithy.swift.codegen.integration.middlewares.OperationInputBodyMiddleware
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.model.hasTrait
import software.amazon.smithy.swift.codegen.model.targetOrSelf

class RpcV2CborProtocolGenerator : AWSHTTPBindingProtocolGenerator(RpcV2CborCustomizations()) {
    override val defaultContentType = "application/cbor"
    override val protocol: ShapeId = Rpcv2CborTrait.ID

    override val shouldRenderEncodableConformance = true

    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext, defaultContentType: String):
        HttpBindingResolver = RPCV2CBORHttpBindingResolver(ctx, defaultContentType)

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {
        super.addProtocolSpecificMiddleware(ctx, operation)

        // Original instance of OperationInputBodyMiddleware checks if there is an HTTP Body, but for AWSJson protocols
        // we always need to have an InputBodyMiddleware
        operationMiddleware.removeMiddleware(operation, "OperationInputBodyMiddleware")
        operationMiddleware.appendMiddleware(operation, OperationInputBodyMiddleware(ctx.model, ctx.symbolProvider, true))

        val hasEventStreamResponse = ctx.model.expectShape(operation.outputShape).hasTrait<StreamingTrait>()
        val hasEventStreamRequest = ctx.model.expectShape(operation.inputShape).hasTrait<StreamingTrait>()

        // Determine the value of the Accept header
        val acceptHeaderValue = if (hasEventStreamResponse) {
            "application/vnd.amazon.eventstream"
        } else {
            "application/cbor"
        }

        // Determine the value of the Content-Type header
        val contentTypeValue = if (hasEventStreamRequest) {
            "application/vnd.amazon.eventstream"
        } else {
            defaultContentType
        }

        // Middleware to set smithy-protocol and Accept headers
        // Every request for the rpcv2Cbor protocol MUST contain a smithy-protocol header with the value of rpc-v2-cbor
        val smithyProtocolRequestHeaderMiddleware = MutateHeadersMiddleware(
            overrideHeaders = mapOf(
                "smithy-protocol" to "rpc-v2-cbor",
                "Accept" to acceptHeaderValue
            )
        )

        operationMiddleware.appendMiddleware(operation, smithyProtocolRequestHeaderMiddleware)
        operationMiddleware.appendMiddleware(operation, CborValidateResponseHeaderMiddleware)

        if (operation.hasHttpBody(ctx)) {
            operationMiddleware.appendMiddleware(operation, ContentTypeMiddleware(ctx.model, ctx.symbolProvider, contentTypeValue, true))
        }

        // Only set Content-Length header if the request input shape doesn't have an event stream
        if (!hasEventStreamRequest) {
            operationMiddleware.appendMiddleware(operation, ContentLengthMiddleware(ctx.model, true, false, false))
        }
    }

    /**
     * @return whether the operation input does _not_ target the unit shape ([UnitTypeTrait.UNIT])
     */
    private fun OperationShape.hasHttpBody(ctx: ProtocolGenerator.GenerationContext): Boolean {
        val input = ctx.model.expectShape(inputShape).targetOrSelf(ctx.model).let {
            // If the input has been synthetically cloned from the original (most likely),
            // pull the archetype and check _that_
            it.getTrait<SyntheticClone>()?.let { clone ->
                ctx.model.expectShape(clone.archetype).targetOrSelf(ctx.model)
            } ?: it
        }

        return input.id != UnitTypeTrait.UNIT
    }
}
