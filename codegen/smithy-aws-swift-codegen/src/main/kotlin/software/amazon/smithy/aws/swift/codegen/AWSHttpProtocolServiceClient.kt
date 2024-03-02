/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.traits.auth.SigV4ATrait
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.knowledge.ServiceIndex
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.config.ConfigProperty
import software.amazon.smithy.swift.codegen.config.DefaultProvider
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.toOptional
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

    override fun overrideConfigProperties(properties: List<ConfigProperty>): List<ConfigProperty> {
        return properties.map {
            when (it.name) {
                "authSchemeResolver" -> {
                    ConfigProperty("authSchemeResolver", ClientRuntimeTypes.Auth.AuthSchemeResolver, authSchemeResolverDefaultProvider)
                }
                "authSchemes" -> {
                    ConfigProperty("authSchemes", ClientRuntimeTypes.Auth.AuthSchemes.toOptional(), authSchemesDefaultProvider)
                }
                else -> it
            }
        }
    }

    override fun renderCustomConfigInitializer(properties: List<ConfigProperty>) {
        renderEmptyAsynchronousConfigInitializer(properties)
        renderRegionConfigInitializer(properties)
        renderPartitionID()
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
                        "awsCredentialIdentityResolver" -> {
                            "try AWSClientConfigDefaultsProvider.awsCredentialIdentityResolver()"
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

    private fun getModeledAuthSchemesSupportedBySDK(): String {
        val effectiveAuthSchemes = ServiceIndex(ctx.model).getEffectiveAuthSchemes(ctx.service)
        var authSchemeList = arrayOf<String>()

        val sdkId = AuthSchemeResolverGenerator.getSdkId(ctx)
        val servicesUsingSigV4A = arrayOf("S3", "EventBridge", "CloudFrontKeyValueStore")

        if (effectiveAuthSchemes.contains(SigV4Trait.ID)) {
            authSchemeList += "SigV4AuthScheme()"
        }
        if (effectiveAuthSchemes.contains(SigV4ATrait.ID) || servicesUsingSigV4A.contains(sdkId)) {
            authSchemeList += "SigV4AAuthScheme()"
        }
        return "[${authSchemeList.joinToString(", ")}]"
    }

    private val authSchemesDefaultProvider = DefaultProvider(
        getModeledAuthSchemesSupportedBySDK(),
        isThrowable = false,
        isAsync = false
    )

    private val authSchemeResolverDefaultProvider = DefaultProvider(
        "Default${AuthSchemeResolverGenerator.getSdkId(ctx)}AuthSchemeResolver()",
        false,
        false
    )
}
