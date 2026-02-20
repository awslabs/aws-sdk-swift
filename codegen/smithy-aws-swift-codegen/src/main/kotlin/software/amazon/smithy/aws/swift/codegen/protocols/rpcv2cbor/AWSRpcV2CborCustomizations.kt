package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKRPCv2CBORTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.protocols.rpcv2cbor.RPCv2CBORPlugin

class AWSRpcV2CborCustomizations : AWSHTTPProtocolCustomizations() {
    override val plugins: List<Plugin> = listOf(RPCv2CBORPlugin())
    override val clientProtocolSymbol: Symbol = AWSSDKRPCv2CBORTypes.ClientProtocol
}
