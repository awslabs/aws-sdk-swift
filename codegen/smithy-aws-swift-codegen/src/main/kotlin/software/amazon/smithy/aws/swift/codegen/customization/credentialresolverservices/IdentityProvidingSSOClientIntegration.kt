package software.amazon.smithy.aws.swift.codegen.customization.credentialresolverservices

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.model.Model
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.swiftmodules.FoundationTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyTypes

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
                writer.write("")
                writer.openBlock(
                    "package func getCredentialsWithSSOToken(region: String, accessToken: String, accountID: String, roleName: String, credentialFeatureIDs: [String]) async throws -> \$N {",
                    "}",
                    AWSSDKIdentityTypes.AWSCredentialIdentity,
                ) {
                    writer.write("let ssoConfig = try await SSOClient.SSOClientConfiguration(region: region)")
                    writer.write(
                        "ssoConfig.addInterceptorProvider(\$N(featureIDsToAdd: credentialFeatureIDs))",
                        AWSSDKIdentityTypes.CredentialFeatureIDInterceptorProvider,
                    )
                    writer.write("let sso = SSOClient(config: ssoConfig)")
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
                    writer.write("var properties = \$N()", SmithyTypes.Attributes)
                    writer.write(
                        "if credentialFeatureIDs.last == \$N.CREDENTIALS_PROFILE_SSO_LEGACY.rawValue {",
                        AWSSDKIdentityTypes.CredentialFeatureID,
                    )
                    writer.indent()
                    writer.write(
                        "properties.set(key: \$N.credentialFeatureIDs, value: credentialFeatureIDs + [\$N.CREDENTIALS_PROFILE_SSO.rawValue])",
                        AWSSDKIdentityTypes.AWSIdentityPropertyKeys,
                        AWSSDKIdentityTypes.CredentialFeatureID,
                    )
                    writer.dedent()
                    writer.write(
                        "} else if credentialFeatureIDs.last == \$N.CREDENTIALS_PROFILE_SSO.rawValue {",
                        AWSSDKIdentityTypes.CredentialFeatureID,
                    )
                    writer.indent()
                    writer.write(
                        "properties.set(key: \$N.credentialFeatureIDs, value: credentialFeatureIDs + [\$N.CREDENTIALS_SSO.rawValue])",
                        AWSSDKIdentityTypes.AWSIdentityPropertyKeys,
                        AWSSDKIdentityTypes.CredentialFeatureID,
                    )
                    writer.dedent()
                    writer.write("} else {")
                    writer.indent()
                    writer.write(
                        "throw \$N.failedToResolveAWSCredentials(\"SSOAWSCredentialIdentityResolver: Invalid last feature ID found. This should never happen.\")",
                        AWSSDKIdentityTypes.AWSCredentialIdentityResolverError,
                    )
                    writer.dedent()
                    writer.write("}")
                    writer.write(
                        "properties.set(key: \$N.credentialFeatureIDs, value: credentialFeatureIDs)",
                        AWSSDKIdentityTypes.AWSIdentityPropertyKeys,
                    )
                    writer.write(
                        "return \$N(accessKey: accessKey, secret: secretKey, accountID: accountID, expiration: expiration, sessionToken: out.roleCredentials?.sessionToken, properties: properties)",
                        AWSSDKIdentityTypes.AWSCredentialIdentity,
                    )
                }
            }
        }
    }
}
