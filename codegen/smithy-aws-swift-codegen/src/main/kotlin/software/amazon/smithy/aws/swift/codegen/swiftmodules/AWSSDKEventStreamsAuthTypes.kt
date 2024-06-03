package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.model.buildSymbol

object AWSSDKEventStreamsAuthTypes {
    val AWSMessageSigner = runtimeSymbol("AWSMessageSigner")
}

private fun runtimeSymbol(name: String): Symbol = buildSymbol {
    this.name = name
    this.namespace = AWSSwiftDependency.AWS_SDK_EVENT_STREAMS_AUTH.target
    dependency(AWSSwiftDependency.AWS_SDK_EVENT_STREAMS_AUTH)
}
