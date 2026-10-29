/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.config.AWSDefaultClientConfiguration
import software.amazon.smithy.aws.swift.codegen.config.AWSEndpointClientConfiguration
import software.amazon.smithy.aws.swift.codegen.config.AWSRegionClientConfiguration
import software.amazon.smithy.aws.swift.codegen.plugins.AuthSchemePlugin
import software.amazon.smithy.aws.swift.codegen.plugins.DefaultAWSAuthSchemePlugin
import software.amazon.smithy.aws.swift.codegen.plugins.EndpointPlugin
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.config.ClientConfiguration
import software.amazon.smithy.swift.codegen.core.GenerationContext
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient.ConfigInitializerCustomization
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.plugins.DefaultAWSClientPlugin
import software.amazon.smithy.utils.CodeInterceptor
import software.amazon.smithy.utils.CodeSection

class AWSClientConfigurationIntegration : SwiftIntegration {
    override fun clientConfigurations(ctx: ProtocolGenerator.GenerationContext): List<ClientConfiguration> =
        listOf(AWSDefaultClientConfiguration(), AWSRegionClientConfiguration(), AWSEndpointClientConfiguration(ctx))

    override fun plugins(serviceConfig: ServiceConfig): List<Plugin> =
        listOf(
            DefaultAWSClientPlugin(),
            EndpointPlugin(serviceConfig),
            DefaultAWSAuthSchemePlugin(serviceConfig),
            AuthSchemePlugin(serviceConfig),
        )

    override fun interceptors(codegenContext: GenerationContext): List<out CodeInterceptor<out CodeSection?, SwiftWriter>?> =
        if (codegenContext.settings.internalClient) listOf() else listOf(WrapCredentialIdentityResolver())

    private class WrapCredentialIdentityResolver : CodeInterceptor.Appender<ConfigInitializerCustomization, SwiftWriter> {
        override fun sectionType(): Class<ConfigInitializerCustomization> = ConfigInitializerCustomization::class.java

        override fun append(
            writer: SwiftWriter,
            section: ConfigInitializerCustomization,
        ) {
            writer.write(
                "self.awsCredentialIdentityResolver = \$N(self.awsCredentialIdentityResolver)",
                AWSSDKIdentityTypes.wrapCredentialIdentityResolver,
            )
        }
    }
}
