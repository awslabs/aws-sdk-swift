package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityAPITypes
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.config.ClientConfiguration
import software.amazon.smithy.swift.codegen.config.ConfigProperty
import software.amazon.smithy.swift.codegen.config.DefaultProvider
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.toGeneric
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftTypes
import software.amazon.smithy.swift.codegen.utils.SDKFileUtils

class S3ExpressIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = model.expectShape<ServiceShape>(settings.service).isS3

    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator,
    ) {
        val service = ctx.model.expectShape<ServiceShape>(ctx.settings.service)
        if (!service.allOperations.any { it.name == "CreateSession" }) return
        val filename = SDKFileUtils(ctx.settings).sourcesDirFilePath("S3Client+S3Express")
        delegator.useFileWriter(filename) { writer ->
            writer.write("")
            writer.openBlock(
                "public struct S3ExpressCreateSessionClient: \$N, \$N {",
                "}",
                AWSSDKIdentityTypes.S3ExpressCreateSessionClient,
                SwiftTypes.Protocols.Sendable,
            ) {
                writer.write("")
                writer.openBlock(
                    "public func createSession(clientConfig: \$N, bucket: \$N) async throws -> \$N {",
                    "}",
                    ClientRuntimeTypes.Core.DefaultClientConfiguration,
                    SwiftTypes.String,
                    AWSSDKIdentityAPITypes.S3ExpressIdentity,
                ) {
                    writer.openBlock(
                        "guard let config = clientConfig as? S3Client.S3ClientConfig else {",
                        "}",
                    ) {
                        writer.write("throw \$N.clientConfigNotProvided", AWSSDKIdentityTypes.S3ExpressClientError)
                    }
                    writer.write("let client = S3Client(config: config)")
                    writer.write("let input = CreateSessionInput(bucket: bucket)")
                    writer.write("let output = try await client.createSession(input: input)")
                    writer.write(
                        "guard let creds = output.credentials, let accessKeyID = creds.accessKeyId, let secretAccessKey = creds.secretAccessKey, let sessionToken = creds.sessionToken else { fatalError() }",
                    )
                    writer.openBlock("return \$N(", ")", AWSSDKIdentityAPITypes.S3ExpressIdentity) {
                        writer.write("accessKeyID: accessKeyID,")
                        writer.write("secretAccessKey: secretAccessKey,")
                        writer.write("sessionToken: sessionToken,")
                        writer.write("expiration: output.credentials?.expiration")
                    }
                }
            }
        }
    }

    override fun clientConfigurations(ctx: ProtocolGenerator.GenerationContext): List<ClientConfiguration> =
        super.clientConfigurations(ctx) + listOf(S3ExpressClientConfiguration())
}

class S3ExpressClientConfiguration : ClientConfiguration {
    override val swiftProtocolName: Symbol?
        get() = null

    override fun getProperties(ctx: ProtocolGenerator.GenerationContext): Set<ConfigProperty> =
        setOf(
            ConfigProperty(
                "s3ExpressIdentityResolver",
                AWSSDKIdentityAPITypes.S3ExpressIdentityResolver.toGeneric(),
                DefaultProvider({ it.format("\$N()", AWSSDKIdentityTypes.DefaultS3ExpressIdentityResolver) }, false, false),
            ),
        )
}
