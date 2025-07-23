package software.amazon.smithy.aws.swift.codegen.plugins

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.Plugin

class BedrockAPIKeyPlugin : Plugin {
    override val className: Symbol = AWSClientRuntimeTypes.Customizations.BedrockAPIKeyPlugin
    override val isDefault: Boolean = true
}
