package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDeclaration
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftSymbol

object AWSSDKIdentityAPITypes {
    val S3ExpressIdentity = runtimeSymbol("S3ExpressIdentity", SwiftDeclaration.STRUCT)
    val S3ExpressIdentityResolver = runtimeSymbol("S3ExpressIdentityResolver", SwiftDeclaration.PROTOCOL)
}

private fun runtimeSymbol(
    name: String,
    declaration: SwiftDeclaration? = null,
): Symbol =
    SwiftSymbol.make(
        name,
        declaration,
        AWSSwiftDependency.AWS_SDK_IDENTITY_API,
        emptyList(),
        emptyList(),
    )
