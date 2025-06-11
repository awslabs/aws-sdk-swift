package software.amazon.smithy.aws.swift.codegen.customization.credentialresolverservices

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.model.Model
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftTypes

class IdentityProvidingSTSClientIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = settings.moduleName == "InternalAWSSTS"

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
                writer.openBlock(
                    "package func getCredentialsWithWebIdentity(region: String, roleARN: String, roleSessionName: String, webIdentityToken: String) async throws -> \$N {",
                    "}",
                    AWSSDKIdentityTypes.AWSCredentialIdentity,
                ) {
                    writer.write("let sts = try STSClient(region: region)")
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
                        "throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(",
                        ")",
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

                    writer.openBlock(
                        "return AWSCredentialIdentity(",
                        ")",
                    ) {
                        writer.write(
                            "accessKey: access, secret: secret, " +
                                "expiration: creds.expiration, sessionToken: creds.sessionToken",
                        )
                    }
                }
            }
        }
    }
}
