/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.config.ConfigProperty
import software.amazon.smithy.swift.codegen.config.DefaultProvider
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.utils.toUpperCamelCase

class AWSHttpProtocolServiceClient(
    private val ctx: ProtocolGenerator.GenerationContext,
    private val writer: SwiftWriter,
    properties: List<ClientProperty>,
    private val serviceConfig: ServiceConfig
) : HttpProtocolServiceClient(ctx, writer, properties, serviceConfig) {
    override fun renderConvenienceInitFunctions(serviceSymbol: Symbol) {
        writer.openBlock("public convenience init(region: Swift.String) throws {", "}") {
            writer.write("let config = try ${serviceConfig.typeName}(region: region)")
            writer.write("self.init(config: config)")
        }
        writer.write("")
        writer.openBlock("public convenience required init() async throws {", "}") {
            writer.write("let config = try await ${serviceConfig.typeName}()")
            writer.write("self.init(config: config)")
        }
    }

    override fun renderClientConfig(serviceSymbol: Symbol) {

        val clientConfigurationProtocols =
            ctx.integrations
                .flatMap { it.clientConfigurations(ctx) }
                .mapNotNull { it.swiftProtocolName?.name }
                .joinToString(" & ")

        writer.openBlock(
            "public class \$LConfiguration: \$L {", "}",
            serviceConfig.clientName.toUpperCamelCase(),
            clientConfigurationProtocols
        ) {
            val properties: List<ConfigProperty> = ctx.integrations
                .flatMap { it.clientConfigurations(ctx).flatMap { it.properties } }

            renderConfigClassVariables(properties)

            renderPrivateConfigInitializer(properties)

            renderAsynchronousConfigInitializer(properties)

            renderSynchronousConfigInitializer(properties)

            renderEmptyAsynchronousConfigInitializer(properties)

            renderRegionConfigInitializer(properties)

            renderPartitionID()
        }
        writer.write("")
    }

    /**
     * Declare class variables in client configuration class
     */
    private fun renderConfigClassVariables(properties: List<ConfigProperty>) {
        properties
            .forEach {
                when (it.name) {
                    "credentialsProvider" -> {
                        writer.write("public var \$L: any \$L", it.name, it.type)
                        writer.write("")
                    }
                    else -> {
                        writer.write("public var \$L: \$L", it.name, it.type)
                        writer.write("")
                    }
                }
            }
        writer.write("")
    }

    private fun renderPrivateConfigInitializer(properties: List<ConfigProperty>) {
        writer.openBlock(
            "private init(\$L) {",
            "}",
            properties.joinToString(", ") {
                when (it.name) {
                    "credentialsProvider" -> {
                        "_ ${it.name}: any ${it.type}"
                    }
                    else -> {
                        "_ ${it.name}: ${it.type}"
                    }
                }
            }
        ) {
            properties.forEach {
                writer.write("self.\$L = \$L", it.name, it.name)
            }
        }
        writer.write("")
    }

    private fun renderSynchronousConfigInitializer(properties: List<ConfigProperty>) {
        writer.openBlock(
            "public convenience init(\$L) throws {", "}",
            properties.joinToString(", ") {
                when (it.name) {
                    "credentialsProvider" -> {
                        "${it.name}: (any ${it.type})? = nil"
                    }
                    else -> {
                        "${it.name}: ${it.toOptionalType()} = nil"
                    }
                }
            }
        ) {
            writer.writeInline(
                "self.init(\$L)",
                properties.joinToString(", ") {
                    when (it.name) {
                        "authSchemeResolver" -> {
                            authSchemeResolverDefaultProvider.render("authSchemeResolver")
                        }
                        else -> {
                            if (it.default?.isAsync == true) {
                                it.name
                            } else {
                                it.default?.render(it.name) ?: it.name
                            }
                        }
                    }
                }
            )
        }
        writer.write("")
    }

    private fun renderAsynchronousConfigInitializer(properties: List<ConfigProperty>) {
        writer.openBlock(
            "public convenience init(\$L) async throws {", "}",
            properties.joinToString(", ") {
                when (it.name) {
                    "credentialsProvider" -> {
                        "${it.name}: (any ${it.type})? = nil"
                    }
                    else -> {
                        "${it.name}: ${it.toOptionalType()} = nil"
                    }
                }
            }
        ) {
            writer.writeInline(
                "self.init(\$L)",
                properties.joinToString(", ") {
                    when (it.name) {
                        "authSchemeResolver" -> {
                            authSchemeResolverDefaultProvider.render("authSchemeResolver")
                        }
                        else -> { it.default?.render() ?: it.name }
                    }
                }
            )
        }
        writer.write("")
    }

    /**
     *  AWS Amplify requires a synchronous initializer with region parameter.
     */
    private fun renderRegionConfigInitializer(properties: List<ConfigProperty>) {
        writer.openBlock("public convenience init(region: String) throws {", "}") {
            writer.write(
                "self.init(\$L)",
                properties.joinToString(", ") {
                    when (it.name) {
                        "region", "signingRegion" -> {
                            "region"
                        }
                        "credentialsProvider" -> {
                            "try AWSClientConfigDefaultsProvider.credentialsProvider()"
                        }
                        "authSchemeResolver" -> {
                            authSchemeResolverDefaultProvider.value
                        }
                        else -> {
                            it.default?.render() ?: "nil"
                        }
                    }
                }
            )
        }
        writer.write("")
    }

    private fun renderEmptyAsynchronousConfigInitializer(properties: List<ConfigProperty>) {
        writer.openBlock("public convenience required init() async throws {", "}") {
            writer.write("try await self.init(\$L)", properties.joinToString(", ") { "${it.name}: nil" })
        }
        writer.write("")
    }

    private fun renderPartitionID() {
        writer.openBlock("public var partitionID: String? {", "}") {
            writer.write("return \"\\(\$L.clientName) - \\(region ?? \"\")\"", serviceConfig.clientName.toUpperCamelCase())
        }
    }

    private val authSchemeResolverDefaultProvider = DefaultProvider(
        "Default${AuthSchemeResolverGenerator.getSdkId(ctx)}AuthSchemeResolver()",
        false,
        false
    )
}
