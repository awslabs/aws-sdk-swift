package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDeclaration
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftSymbol

object AWSSDKIdentityTypes {
    val DefaultBearerTokenIdentityResolverChain =
        runtimeSymbol(
            "DefaultBearerTokenIdentityResolverChain",
            SwiftDeclaration.STRUCT,
            spiNames = listOf("ClientConfigDefaultIdentityResolver"),
        )
    val DefaultS3ExpressIdentityResolver = runtimeSymbol("DefaultS3ExpressIdentityResolver", SwiftDeclaration.CLASS)
    val S3ExpressCreateSessionClient = runtimeSymbol("S3ExpressCreateSessionClient", SwiftDeclaration.PROTOCOL)
    val S3ExpressClientError = runtimeSymbol("S3ExpressClientError", SwiftDeclaration.ENUM)
    val AWSIdentityPropertyKeys = runtimeSymbol("AWSIdentityPropertyKeys", SwiftDeclaration.ENUM)
    val DefaultAWSCredentialIdentityResolverChain = runtimeSymbol("DefaultAWSCredentialIdentityResolverChain", SwiftDeclaration.CLASS)
    val AWSCredentialIdentityResolverError = runtimeSymbol("AWSCredentialIdentityResolverError", SwiftDeclaration.ENUM)
    val IdentityProvidingSTSClientError = runtimeSymbol("IdentityProvidingSTSClientError", SwiftDeclaration.ENUM)
    val AWSCredentialIdentity = runtimeSymbol("AWSCredentialIdentity", SwiftDeclaration.STRUCT)
    val CredentialFeatureIDInterceptorProvider = runtimeSymbol("CredentialFeatureIDInterceptorProvider", SwiftDeclaration.CLASS)
    val CredentialFeatureID = runtimeSymbol("CredentialFeatureID", SwiftDeclaration.ENUM)
}

private fun runtimeSymbol(
    name: String,
    declaration: SwiftDeclaration? = null,
    spiNames: List<String> = listOf(),
): Symbol =
    SwiftSymbol.make(
        name,
        declaration,
        AWSSwiftDependency.AWS_SDK_IDENTITY,
        emptyList(),
        spiNames,
    )
