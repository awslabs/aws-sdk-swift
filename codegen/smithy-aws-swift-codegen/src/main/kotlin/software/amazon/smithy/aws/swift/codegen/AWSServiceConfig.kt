/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.ShapeType
import software.amazon.smithy.rulesengine.traits.ClientContextParamsTrait
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ConfigField
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.buildSymbol
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.utils.toLowerCamelCase

const val CREDENTIALS_PROVIDER_CONFIG_NAME = "credentialsProvider"
const val ENDPOINT_RESOLVER = "endpointResolver"
const val AUTH_SCHEME_RESOLVER = "authSchemeResolver"
const val ENDPOINT_PARAMS = "endpointParams"
const val FRAMEWORK_METADATA = "frameworkMetadata"
const val REGION_CONFIG_NAME = "region"
const val REGION_RESOLVER = "regionResolver"
const val SIGNING_REGION_CONFIG_NAME = "signingRegion"
const val USE_FIPS_CONFIG_NAME = "useFIPS"
const val USE_DUAL_STACK_CONFIG_NAME = "useDualStack"
const val ENDPOINT_CONFIG_NAME = "endpoint"

class AWSServiceConfig(writer: SwiftWriter, val ctx: ProtocolGenerator.GenerationContext) :
    ServiceConfig(writer, ctx.symbolProvider.toSymbol(ctx.service).name, ctx.service.sdkId) {

    override fun renderInitializers(serviceSymbol: Symbol) {
        val serviceConfigs = serviceConfigProperties()
        writer.openBlock("extension \$L {", "}", clientName) {
            writer.write("public typealias \$LConfiguration = AWSClientConfiguration<ServiceSpecificConfiguration>", clientName)
            writer.write("")
            writer.openBlock("public struct ServiceSpecificConfiguration: AWSServiceSpecificConfiguration {", "}") {
                writer.write("public typealias AWSServiceEndpointResolver = EndpointResolver")
                writer.write("")
                writer.write("public var serviceName: String { \$S }", serviceName)
                writer.write("public var clientName: String { \$S }", clientName)
                serviceConfigs.forEach { config ->
                    writer.write("public var \$L: ${config.propFormatter}", config.memberName, config.type)
                }
                writer.write("")
                writer.openBlock("public init(endpointResolver: EndpointResolver? = nil) throws {", "}") {
                    writer.write("self.endpointResolver = try endpointResolver ?? DefaultEndpointResolver()")
                }
            }
        }
    }

    override fun otherRuntimeConfigProperties(): List<ConfigField> {
        return listOf(
            ConfigField(ENDPOINT_CONFIG_NAME, SwiftTypes.String, "\$T"),
            ConfigField(
                CREDENTIALS_PROVIDER_CONFIG_NAME,
                AWSClientRuntimeTypes.Core.CredentialsProviding,
                documentation = "The credentials provider to use to authenticate requests."
            ),
            ConfigField(REGION_CONFIG_NAME, SwiftTypes.String, "\$T"),
            ConfigField(
                SIGNING_REGION_CONFIG_NAME, SwiftTypes.String, "\$T", "The region to sign requests in. (Required)"
            ),
            ConfigField(
                REGION_RESOLVER,
                AWSClientRuntimeTypes.Core.RegionResolver,
                "\$T",
                documentation = "The region resolver uses an array of region providers to resolve the region."
            ),
            ConfigField(
                FRAMEWORK_METADATA,
                AWSClientRuntimeTypes.Core.FrameworkMetadata,
                propFormatter = "\$T",
                documentation = "Contains information to inject lib/ into user-agent"
            ),
            ConfigField(USE_FIPS_CONFIG_NAME, SwiftTypes.Bool, "\$T"),
            ConfigField(USE_DUAL_STACK_CONFIG_NAME, SwiftTypes.Bool, "\$T"),
        ).sortedBy { it.memberName }
    }

    override fun serviceConfigProperties(): List<ConfigField> {
        var configs = mutableListOf<ConfigField>()

        // service specific EndpointResolver
        configs.add(ConfigField(ENDPOINT_RESOLVER, AWSServiceTypes.EndpointResolver, "\$N", "Endpoint resolver"))

        val clientContextParams = ctx.service.getTrait<ClientContextParamsTrait>()
        clientContextParams?.parameters?.forEach {
            configs.add(ConfigField(it.key.toLowerCamelCase(), it.value.type.toSwiftType(), "\$T"))
        }
        return configs.sortedBy { it.memberName }
    }
}

private fun ShapeType.toSwiftType(): Symbol {
    return when (this) {
        ShapeType.STRING -> SwiftTypes.String
        ShapeType.BOOLEAN -> SwiftTypes.Bool
        else -> throw IllegalArgumentException("Unsupported shape type: $this")
    }
}

object AWSServiceTypes {
    val EndpointResolver = symbol("EndpointResolver")
    val EndpointParams = symbol("EndpointParams")
    val EndpointResolverMiddleware = symbol("EndpointResolverMiddleware")
    val DefaultEndpointResolver = symbol("DefaultEndpointResolver")

    private fun symbol(name: String): Symbol = buildSymbol {
        this.name = name
    }
}
