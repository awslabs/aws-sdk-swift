package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDeclaration
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftSymbol

object AWSSDKIdentityTypes {
    val DefaultBearerTokenIdentityResolverChain = runtimeSymbol("DefaultBearerTokenIdentityResolverChain", SwiftDeclaration.STRUCT)
    val DefaultAWSCredentialIdentityResolverChain = runtimeSymbol("DefaultAWSCredentialIdentityResolverChain", SwiftDeclaration.CLASS)
    val InternalClientKeys = runtimeSymbol("InternalClientKeys", SwiftDeclaration.ENUM)
    val IdentityProvidingSTSClient = runtimeSymbol("IdentityProvidingSTSClient", SwiftDeclaration.PROTOCOL)
    val AWSCredentialIdentityResolverError = runtimeSymbol("AWSCredentialIdentityResolverError", SwiftDeclaration.ENUM)
    val IdentityProvidingSTSClientError = runtimeSymbol("IdentityProvidingSTSClientError", SwiftDeclaration.ENUM)
    val AWSCredentialIdentity = runtimeSymbol("AWSCredentialIdentity", SwiftDeclaration.STRUCT)
}

private fun runtimeSymbol(
    name: String,
    declaration: SwiftDeclaration? = null,
): Symbol =
    SwiftSymbol.make(
        name,
        declaration,
        AWSSwiftDependency.AWS_SDK_IDENTITY,
        emptyList(),
        emptyList(),
    )
