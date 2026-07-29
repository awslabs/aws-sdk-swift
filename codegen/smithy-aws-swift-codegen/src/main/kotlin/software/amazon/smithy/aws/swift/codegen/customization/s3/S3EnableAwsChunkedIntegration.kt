/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

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
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftTypes

/**
 * Adds the S3-specific `enableAwsChunked` client config property.
 *
 * When `true` (the default), eligible streaming S3 requests use
 * [aws-chunked](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-streaming.html)
 * content encoding. Setting it to `false` disables aws-chunked encoding.
 */
class S3EnableAwsChunkedIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = model.expectShape<ServiceShape>(settings.service).isS3

    override fun clientConfigurations(ctx: ProtocolGenerator.GenerationContext): List<ClientConfiguration> =
        super.clientConfigurations(ctx) + listOf(S3EnableAwsChunkedClientConfiguration())
}

class S3EnableAwsChunkedClientConfiguration : ClientConfiguration {
    override val swiftProtocolName: Symbol?
        get() = null

    override fun getProperties(ctx: ProtocolGenerator.GenerationContext): Set<ConfigProperty> =
        setOf(
            ConfigProperty(
                "enableAwsChunked",
                SwiftTypes.Bool,
                { "true" },
            ),
        )
}
