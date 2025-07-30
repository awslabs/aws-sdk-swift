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
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftTypes

class IdentityProvidingSTSClientIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
//    ): Boolean = settings.moduleName == "InternalAWSSTS"
    ): Boolean = false

    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator,
    ) {
        val path = "Sources/InternalAWSSTS/IdentityProvidingSTSClient.swift"
        delegator.useFileWriter(path) { writer ->
            writer.openBlock(
                "package struct IdentityProvidingSTSClient: \$N, \$N {",
                "}",
                AWSSDKIdentityTypes.IdentityProvidingSTSClient,
                SwiftTypes.Protocols.Sendable,
            ) {
                writer.write("package init() {}")
                writer.write("")
                writer.openBlock(
                    "package func assumeRoleWithCreds(creds: \$N, roleARN: String, roleSessionName: String, durationSeconds: \$N, credentialFeatureIDs: [String]) async throws -> \$N {",
                    "}",
                    AWSSDKIdentityTypes.AWSCredentialIdentity,
                    FoundationTypes.TimeInterval,
                    AWSSDKIdentityTypes.AWSCredentialIdentity,
                ) {
                    writer.write("let stsConfig = try await STSClient.STSClientConfiguration()")
                    writer.write(
                        "stsConfig.awsCredentialIdentityResolver = \$N(creds)",
                        SmithyIdentityTypes.StaticAWSCredentialIdentityResolver,
                    )
                    writer.write("let sts = STSClient(config: stsConfig)")
                    writer.write(
                        "let out = try await sts.assumeRole(input: AssumeRoleInput(durationSeconds: " +
                            "Int(durationSeconds), roleArn: roleARN, roleSessionName: roleSessionName))",
                    )
                    writer.openBlock(
                        "guard let creds = out.credentials, let accessKey = creds.accessKeyId, let secretKey = creds.secretAccessKey else {",
                        "}",
                    ) {
                        writer.write(
                            "throw \$N.failedToResolveAWSCredentials(\"STSAssumeRoleAWSCredentialIdentityResolver:" +
                                "Failed to retrieve credentials from STS with assume role.\")",
                            AWSSDKIdentityTypes.AWSCredentialIdentityResolverError,
                        )
                    }
                    writer.write("var properties = \$N()", SmithyTypes.Attributes)
                    writer.write(
                        "if credentialFeatureIDs.last == \$N.CREDENTIALS_STS_ASSUME_ROLE.rawValue {",
                        AWSSDKIdentityTypes.CredentialFeatureID,
                    )
                    writer.indent()
                    writer.write(
                        "properties.set(key: \$N.credentialFeatureIDs, value: credentialFeatureIDs)",
                        AWSSDKIdentityTypes.AWSIdentityPropertyKeys,
                    )
                    writer.dedent()
                    writer.write("} else {")
                    writer.indent()
                    writer.write(
                        "properties.set(key: \$N.credentialFeatureIDs, value: credentialFeatureIDs + [\$N.CREDENTIALS_STS_ASSUME_ROLE.rawValue])",
                        AWSSDKIdentityTypes.AWSIdentityPropertyKeys,
                        AWSSDKIdentityTypes.CredentialFeatureID,
                    )
                    writer.dedent()
                    writer.write("}")
                    writer.write(
                        "return AWSCredentialIdentity(accessKey: accessKey, secret: secretKey, " +
                            "expiration: creds.expiration, sessionToken: creds.sessionToken, properties: properties)",
                    )
                }
                writer.write("")
                writer.openBlock(
                    "package func getCredentialsWithWebIdentity(region: String, roleARN: String, " +
                        "roleSessionName: String, webIdentityToken: String, credentialFeatureIDs: [String]) async throws -> \$N {",
                    "}",
                    AWSSDKIdentityTypes.AWSCredentialIdentity,
                ) {
                    writer.write("let stsConfig = try await STSClient.STSClientConfiguration(region: region)")
                    writer.write(
                        "stsConfig.addInterceptorProvider(\$N(featureIDsToAdd: credentialFeatureIDs))",
                        AWSSDKIdentityTypes.CredentialFeatureIDInterceptorProvider,
                    )
                    writer.write("let sts = STSClient(config: stsConfig)")
                    writer.write("var out: AssumeRoleWithWebIdentityOutput")
                    writer.write("do {")
                    writer.indent()
                    writer.openBlock(
                        "out = try await sts.assumeRoleWithWebIdentity(input: AssumeRoleWithWebIdentityInput(",
                        "))",
                    ) {
                        writer.write("roleArn: roleARN, roleSessionName: roleSessionName, webIdentityToken: webIdentityToken")
                    }
                    writer.dedent()
                    writer.write("} catch is ExpiredTokenException {")
                    writer.indent()
                    writer.write("throw \$N.expiredTokenException", AWSSDKIdentityTypes.IdentityProvidingSTSClientError)
                    writer.dedent()
                    writer.write("} catch is IDPCommunicationErrorException {")
                    writer.indent()
                    writer.write("throw \$N.idpCommunicationErrorException", AWSSDKIdentityTypes.IdentityProvidingSTSClientError)
                    writer.dedent()
                    writer.write("} catch {")
                    writer.indent()
                    writer.openBlock(
                        "throw \$N.failedToResolveAWSCredentials(",
                        ")",
                        AWSSDKIdentityTypes.AWSCredentialIdentityResolverError,
                    ) {
                        writer.write(
                            "\"STSWebIdentityAWSCredentialIdentityResolver: " +
                                "Failed to retrieve credentials from STS with web identity token.\"",
                        )
                    }
                    writer.dedent()
                    writer.write("}")

                    writer.openBlock(
                        "guard let creds = out.credentials, let access = creds.accessKeyId, " +
                            "let secret = creds.secretAccessKey else {",
                        "}",
                    ) {
                        writer.openBlock(
                            "throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(",
                            ")",
                        ) {
                            writer.write(
                                "\"STSWebIdentityAWSCredentialIdentityResolver: " +
                                    "Failed to retrieve credentials from STS with web identity token.\"",
                            )
                        }
                    }

                    writer.write("var properties = \$N()", SmithyTypes.Attributes)
                    writer.write(
                        "properties.set(key: \$N.credentialFeatureIDs, value: credentialFeatureIDs + [\$N.CREDENTIALS_STS_ASSUME_ROLE_WEB_ID.rawValue])",
                        AWSSDKIdentityTypes.AWSIdentityPropertyKeys,
                        AWSSDKIdentityTypes.CredentialFeatureID,
                    )
                    writer.openBlock(
                        "return AWSCredentialIdentity(",
                        ")",
                    ) {
                        writer.write(
                            "accessKey: access, secret: secret, " +
                                "expiration: creds.expiration, sessionToken: creds.sessionToken, properties: properties",
                        )
                    }
                }
            }
        }
    }
}
