package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDeclaration
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftSymbol

object AWSSDKAWSJSONTypes {
    val ClientProtocol = runtimeSymbol("ClientProtocol", SwiftDeclaration.STRUCT)
    val Plugin = runtimeSymbol("Plugin", SwiftDeclaration.STRUCT)
}

private fun runtimeSymbol(
    name: String,
    declaration: SwiftDeclaration? = null,
    spiNames: List<String> = listOf(),
): Symbol =
    SwiftSymbol.make(
        name,
        declaration,
        AWSSwiftDependency.AWS_SDK_AWSJSON,
        emptyList(),
        spiNames,
    )
