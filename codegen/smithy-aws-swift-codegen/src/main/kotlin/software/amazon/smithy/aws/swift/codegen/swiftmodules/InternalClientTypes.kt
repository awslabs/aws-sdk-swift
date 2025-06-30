package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDeclaration
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftSymbol

object InternalClientTypes {
    val IdentityProvidingSTSClient =
        runtimeSymbol(
            "IdentityProvidingSTSClient",
            SwiftDeclaration.STRUCT,
            AWSSwiftDependency.INTERNAL_AWS_STS,
        )
    val IdentityProvidingSSOClient =
        runtimeSymbol(
            "IdentityProvidingSSOClient",
            SwiftDeclaration.STRUCT,
            AWSSwiftDependency.INTERNAL_AWS_SSO,
        )
    val IdentityProvidingSSOOIDCClient =
        runtimeSymbol(
            "IdentityProvidingSSOOIDCClient",
            SwiftDeclaration.STRUCT,
            AWSSwiftDependency.INTERNAL_AWS_SSO_OIDC,
        )
}

private fun runtimeSymbol(
    name: String,
    declaration: SwiftDeclaration? = null,
    module: SwiftDependency,
): Symbol =
    SwiftSymbol.make(
        name,
        declaration,
        module,
        emptyList(),
        emptyList(),
    )
