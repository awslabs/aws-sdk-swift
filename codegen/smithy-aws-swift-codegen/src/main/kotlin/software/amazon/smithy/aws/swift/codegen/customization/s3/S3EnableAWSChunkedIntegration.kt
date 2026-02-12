package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.config.ClientConfiguration
import software.amazon.smithy.swift.codegen.config.ConfigProperty
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.toOptional
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftTypes

class S3EnableAWSChunkedIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = model.expectShape<ServiceShape>(settings.service).isS3

    override fun clientConfigurations(ctx: ProtocolGenerator.GenerationContext): List<ClientConfiguration> =
        super.clientConfigurations(ctx) + listOf(S3EnableAWSChunkedClientConfiguration())
}

class S3EnableAWSChunkedClientConfiguration : ClientConfiguration {
    override val swiftProtocolName: Symbol?
        get() = null

    override fun getProperties(ctx: ProtocolGenerator.GenerationContext): Set<ConfigProperty> =
        setOf(
            ConfigProperty(
                "enableAWSChunked",
                SwiftTypes.Bool.toOptional(),
            ),
            ConfigProperty(
                "disableS3ExpressSessionAuth",
                SwiftTypes.Bool.toOptional(),
            ),
        )
}
