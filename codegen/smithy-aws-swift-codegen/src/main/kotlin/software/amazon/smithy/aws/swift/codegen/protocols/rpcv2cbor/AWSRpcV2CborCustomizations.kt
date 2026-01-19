package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKRPCv2CBORTypes
import software.amazon.smithy.codegen.core.Symbol

class AWSRpcV2CborCustomizations : AWSHTTPProtocolCustomizations() {
    override val configuratorSymbol: Symbol
        get() = AWSSDKRPCv2CBORTypes.Configurator
}
