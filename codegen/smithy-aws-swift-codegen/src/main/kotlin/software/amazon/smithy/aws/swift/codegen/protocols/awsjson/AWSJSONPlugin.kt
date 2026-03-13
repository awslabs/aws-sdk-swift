package software.amazon.smithy.aws.swift.codegen.protocols.awsjson

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.swiftmodules.AWSJSONTypes

class AWSJSONPlugin : Plugin {
    override val className: Symbol = AWSJSONTypes.Plugin
}
