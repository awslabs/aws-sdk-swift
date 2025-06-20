package software.amazon.smithy.aws.swift.codegen.customization.credentialresolverservices

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.model.Model
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.swiftmodules.FoundationTypes

class IdentityProvidingSSOClientIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = settings.moduleName == "InternalAWSSSO"

    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator,
    ) {
        val path = "Sources/InternalAWSSSO/IdentityProvidingSSOClient.swift"
        delegator.useFileWriter(path) { writer ->
            writer.openBlock(
                "package struct IdentityProvidingSSOClient: \$N {",
                "}",
                AWSSDKIdentityTypes.IdentityProvidingSSOClient,
            ) {
                writer.write("package init() {}")
                writer.openBlock(
                    "package func getCredentialsWithSSOToken(region: String, accessToken: String, accountID: String, roleName: String) async throws -> \$N {",
                    "}",
                    AWSSDKIdentityTypes.AWSCredentialIdentity,
                ) {
                    writer.write("let sso = try SSOClient(region: region)")
                    writer.write("let input = GetRoleCredentialsInput(accessToken: accessToken, accountId: accountID, roleName: roleName)")
                    writer.write("let out = try await sso.getRoleCredentials(input: input)")
                    writer.openBlock(
                        "guard let accessKey = out.roleCredentials?.accessKeyId, let secretKey = out.roleCredentials?.secretAccessKey else {",
                        "}",
                    ) {
                        writer.write(
                            "throw \$N.failedToResolveAWSCredentials(\"SSOAWSCredentialIdentityResolver: Failed to retrieve temporary credentials using SSO token.\")",
                            AWSSDKIdentityTypes.AWSCredentialIdentityResolverError,
                        )
                    }
                    writer.write(
                        "var expiration: \$N? = nil",
                        FoundationTypes.Date,
                    )
                    writer.openBlock(
                        "if let expiresIn = out.roleCredentials?.expiration {",
                        "}",
                    ) {
                        writer.write(
                            "expiration = \$N().addingTimeInterval(\$N(expiresIn))",
                            FoundationTypes.Date,
                            FoundationTypes.TimeInterval,
                        )
                    }
                    writer.write(
                        "return \$N(accessKey: accessKey, secret: secretKey, accountID: accountID, expiration: expiration, sessionToken: out.roleCredentials?.sessionToken)",
                        AWSSDKIdentityTypes.AWSCredentialIdentity,
                    )
                }
            }
        }
    }
}
