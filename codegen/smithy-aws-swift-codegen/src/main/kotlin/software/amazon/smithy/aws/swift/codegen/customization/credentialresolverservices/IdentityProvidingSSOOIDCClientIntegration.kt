package software.amazon.smithy.aws.swift.codegen.customization.credentialresolverservices

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.model.Model
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.swiftmodules.FoundationTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyIdentityTypes

class IdentityProvidingSSOOIDCClientIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = settings.moduleName == "InternalAWSSSOOIDC"

    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator,
    ) {
        val path = "Sources/InternalAWSSSOOIDC/IdentityProvidingSSOOIDCClient.swift"
        delegator.useFileWriter(path) { writer ->
            writer.openBlock(
                "package struct IdentityProvidingSSOOIDCClient: \$N {",
                "}",
                AWSSDKIdentityTypes.IdentityProvidingSSOOIDCClient,
            ) {
                writer.write("package init() {}")
                writer.write("")
                writer.openBlock(
                    "package func createToken(region: String, clientID: String, clientSecret: String, refreshToken: String) async throws -> (refreshToken: String?, \$N) {",
                    "}",
                    SmithyIdentityTypes.BearerTokenIdentity,
                ) {
                    writer.write("let ssoOIDC = try SSOOIDCClient(region: region)")
                    writer.write(
                        "let input = CreateTokenInput(clientId: clientID, clientSecret: clientSecret, " +
                            "grantType: \"refresh_token\", refreshToken: refreshToken)",
                    )
                    writer.write("let out = try await ssoOIDC.createToken(input: input)")
                    writer.write(
                        "let expiration = \$N().addingTimeInterval(\$N(out.expiresIn))",
                        FoundationTypes.Date,
                        FoundationTypes.TimeInterval,
                    )
                    writer.write("let token = BearerTokenIdentity(token: out.accessToken ?? \"\", expiration: expiration)")
                    writer.write("return (out.refreshToken, token)")
                }
            }
        }
    }
}
