package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes

class AWSRpcV2CborCustomizations : AWSHTTPProtocolCustomizations() {

    override val baseErrorSymbol: Symbol = ClientRuntimeTypes.RpcV2Cbor.RpcV2CborError
}