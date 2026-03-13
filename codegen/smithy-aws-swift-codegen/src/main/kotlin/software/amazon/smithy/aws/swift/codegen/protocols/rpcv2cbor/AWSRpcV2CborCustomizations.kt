package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.protocols.rpcv2cbor.RPCv2CBORPlugin
import software.amazon.smithy.swift.codegen.swiftmodules.RPCv2CBORTypes

class AWSRpcV2CborCustomizations : AWSHTTPProtocolCustomizations() {
    override val plugins: List<Plugin> = listOf(RPCv2CBORPlugin())

    override fun renderClientProtocol(writer: SwiftWriter): String {
        return writer.format("\$N()", RPCv2CBORTypes.HTTPClientProtocol)
    }
}
