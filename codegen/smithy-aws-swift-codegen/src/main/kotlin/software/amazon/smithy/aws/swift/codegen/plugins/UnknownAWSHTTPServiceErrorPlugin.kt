package software.amazon.smithy.aws.swift.codegen.plugins

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.Plugin

class UnknownAWSHTTPServiceErrorPlugin : Plugin {
    override val className: Symbol
        get() = AWSClientRuntimeTypes.Core.UnknownAWSHTTPServiceErrorPlugin
}
