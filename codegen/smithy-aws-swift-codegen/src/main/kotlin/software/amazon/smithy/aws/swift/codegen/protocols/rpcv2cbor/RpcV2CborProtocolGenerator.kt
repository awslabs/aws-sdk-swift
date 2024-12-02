package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.aws.swift.codegen.AWSHTTPBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.middleware.MutateHeadersMiddleware
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.protocol.traits.Rpcv2CborTrait
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class RpcV2CborProtocolGenerator : AWSHTTPBindingProtocolGenerator(RpcV2CborCustomizations()) {
    override val defaultContentType = "application/cbor"
    override val protocol: ShapeId = Rpcv2CborTrait.ID

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {
        super.addProtocolSpecificMiddleware(ctx, operation)

        // Every request for the rpcv2Cbor protocol MUST contain a smithy-protocol header with the value of rpc-v2-cbor
        val smithyProtocolRequestHeaderMiddleware = MutateHeadersMiddleware(overrideHeaders = mapOf("smithy-protocol" to "rpc-v2-cbor"))

        operationMiddleware.appendMiddleware(operation, smithyProtocolRequestHeaderMiddleware)
        operationMiddleware.appendMiddleware(operation, RpcV2CborValidateResponseHeaderMiddleware)
    }
}