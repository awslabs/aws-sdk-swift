package software.amazon.smithy.aws.swift.codegen.protocols.awsjson

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKAWSJSONTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.Plugin

class AWSJSONPlugin: Plugin {
    override val className: Symbol = AWSSDKAWSJSONTypes.Plugin
}