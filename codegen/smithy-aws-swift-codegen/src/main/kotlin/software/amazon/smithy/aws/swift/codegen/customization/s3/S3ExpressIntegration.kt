package software.amazon.smithy.aws.swift.codegen.customization.s3

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
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftTypes

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
        delegator.useFileWriter("Sources/AWSS3/S3Client+S3Express.swift") { writer ->
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
                    AWSSDKIdentityTypes.S3ExpressIdentity,
                ) {
                    writer.openBlock(
                        "guard let config = clientConfig as? S3Client.Config else {",
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
                    writer.openBlock("return \$N(", ")", AWSSDKIdentityTypes.S3ExpressIdentity) {
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
                AWSSDKIdentityTypes.S3ExpressIdentityResolver.toGeneric(),
                DefaultProvider({ it.format("\$N()", AWSSDKIdentityTypes.DefaultS3ExpressIdentityResolver) }, false, false),
            ),
        )
}
