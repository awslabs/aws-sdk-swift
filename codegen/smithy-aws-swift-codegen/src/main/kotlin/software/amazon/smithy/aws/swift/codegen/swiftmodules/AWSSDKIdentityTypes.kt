package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDeclaration
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftSymbol

object AWSSDKIdentityTypes {
    val DefaultBearerTokenIdentityResolverChain = runtimeSymbol("DefaultBearerTokenIdentityResolverChain", SwiftDeclaration.STRUCT)
    val DefaultS3ExpressIdentityResolver = runtimeSymbol("DefaultS3ExpressIdentityResolver", SwiftDeclaration.CLASS)
    val S3ExpressIdentity = runtimeSymbol("S3ExpressIdentity", SwiftDeclaration.STRUCT)
    val S3ExpressIdentityResolver = runtimeSymbol("S3ExpressIdentityResolver", SwiftDeclaration.PROTOCOL)
    val S3ExpressCreateSessionClient = runtimeSymbol("S3ExpressCreateSessionClient", SwiftDeclaration.PROTOCOL)
    val S3ExpressClientError = runtimeSymbol("S3ExpressClientError", SwiftDeclaration.ENUM)
    val AWSIdentityPropertyKeys = runtimeSymbol("AWSIdentityPropertyKeys", SwiftDeclaration.ENUM)
    val DefaultAWSCredentialIdentityResolverChain = runtimeSymbol("DefaultAWSCredentialIdentityResolverChain", SwiftDeclaration.CLASS)
    val IdentityProvidingSTSClient = runtimeSymbol("IdentityProvidingSTSClient", SwiftDeclaration.PROTOCOL)
    val IdentityProvidingSSOClient = runtimeSymbol("IdentityProvidingSSOClient", SwiftDeclaration.PROTOCOL)
    val IdentityProvidingSSOOIDCClient = runtimeSymbol("IdentityProvidingSSOOIDCClient", SwiftDeclaration.PROTOCOL)
    val AWSCredentialIdentityResolverError = runtimeSymbol("AWSCredentialIdentityResolverError", SwiftDeclaration.ENUM)
    val IdentityProvidingSTSClientError = runtimeSymbol("IdentityProvidingSTSClientError", SwiftDeclaration.ENUM)
    val AWSCredentialIdentity = runtimeSymbol("AWSCredentialIdentity", SwiftDeclaration.STRUCT)
    val CredentialFeatureIDInterceptorProvider = runtimeSymbol("CredentialFeatureIDInterceptorProvider", SwiftDeclaration.CLASS)
    val CredentialFeatureID = runtimeSymbol("CredentialFeatureID", SwiftDeclaration.ENUM)
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
