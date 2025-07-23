/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.config.AWSDefaultClientConfiguration
import software.amazon.smithy.aws.swift.codegen.config.AWSEndpointClientConfiguration
import software.amazon.smithy.aws.swift.codegen.config.AWSRegionClientConfiguration
import software.amazon.smithy.aws.swift.codegen.plugins.AuthSchemePlugin
import software.amazon.smithy.aws.swift.codegen.plugins.BedrockAPIKeyPlugin
import software.amazon.smithy.aws.swift.codegen.plugins.DefaultAWSAuthSchemePlugin
import software.amazon.smithy.aws.swift.codegen.plugins.EndpointPlugin
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.swift.codegen.config.ClientConfiguration
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.plugins.DefaultAWSClientPlugin
import software.amazon.smithy.swift.codegen.model.getTrait

class AWSClientConfigurationIntegration : SwiftIntegration {
    override fun clientConfigurations(ctx: ProtocolGenerator.GenerationContext): List<ClientConfiguration> =
        listOf(AWSDefaultClientConfiguration(), AWSRegionClientConfiguration(), AWSEndpointClientConfiguration(ctx))

    override fun plugins(ctx: ProtocolGenerator.GenerationContext, serviceConfig: ServiceConfig): List<Plugin> {
        val list = mutableListOf(
            DefaultAWSClientPlugin(),
            EndpointPlugin(serviceConfig),
            DefaultAWSAuthSchemePlugin(serviceConfig),
            AuthSchemePlugin(serviceConfig),
        )
        if (ctx.service.getTrait<SigV4Trait>()?.name == "bedrock") {
            list.add(BedrockAPIKeyPlugin())
        }
        return list
    }
}
