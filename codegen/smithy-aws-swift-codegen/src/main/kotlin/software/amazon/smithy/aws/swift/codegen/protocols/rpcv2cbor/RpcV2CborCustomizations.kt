package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.traits.TimestampFormatTrait

class RpcV2CborCustomizations : AWSHTTPProtocolCustomizations() {

    override val baseErrorSymbol: Symbol = AWSClientRuntimeTypes.RpcV2Cbor.RpcV2CborError

    // Timestamp format is not used in RpcV2Cbor since it's a binary protocol. We seem to be missing an abstraction
    // between text-based and binary-based protocols
    override val defaultTimestampFormat = TimestampFormatTrait.Format.UNKNOWN

//    override fun alwaysHasHttpBody(): Boolean {
//        return true
//    }
}