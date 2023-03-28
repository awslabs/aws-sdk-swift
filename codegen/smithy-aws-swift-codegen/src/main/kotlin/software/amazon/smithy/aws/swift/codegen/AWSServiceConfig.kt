/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.ShapeType
import software.amazon.smithy.rulesengine.traits.ClientContextParamsTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
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
const val RUNTIME_CONFIG_NAME = "runtimeConfig"
const val ENDPOINT_CONFIG_NAME = "endpoint"

const val FILE_BASED_CONFIG_LOCAL_NAME = "fileBasedConfigurationStore"

val runtimeConfig = ConfigField(
    RUNTIME_CONFIG_NAME,
    type = ClientRuntimeTypes.Core.SDKRuntimeConfiguration,
    propFormatter = "\$T"
)

class AWSServiceConfig(writer: SwiftWriter, val ctx: ProtocolGenerator.GenerationContext) :
    ServiceConfig(writer, ctx.symbolProvider.toSymbol(ctx.service).name) {

    override val typesToConformConfigTo: List<Symbol>
        get() = listOf(AWSClientRuntimeTypes.Core.AWSClientConfiguration)

    override fun renderInitializers(serviceSymbol: Symbol) {
        val runtimeConfigs = sdkRuntimeConfigProperties()
        var otherConfigs = otherRuntimeConfigProperties()
        val serviceConfigs = serviceConfigProperties()

        // aws configs including service specific configs
        var awsConfigs = (otherConfigs + serviceConfigs + runtimeConfig).sortedBy { it.memberName }

        writer.openBlock("public init(", ") async throws {") {
            awsConfigs.forEachIndexed { index, config ->
                val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                writer.write("${config.memberName}: ${config.paramFormatter}$terminator", config.type)
            }
        }
        writer.indent()

        // Resolve the runtime config
        // let runtimeConfig = try runtimeConfig ?? ClientRuntime.DefaultSDKRuntimeConfiguration("S3Client")
        writer.write("let \$L = try \$L ?? \$N(\"\$L\")", RUNTIME_CONFIG_NAME, RUNTIME_CONFIG_NAME, ClientRuntimeTypes.Core.DefaultSDKRuntimeConfiguration, serviceName)
        writer.write("")

        // Create our file based config store
        writer.write("let \$L = try CRTFiledBasedConfigurationStore()", FILE_BASED_CONFIG_LOCAL_NAME)
        writer.write("")

        // Resolve the region resolver
        writer.write("let resolvedRegionResolver = try \$L ?? DefaultRegionResolver()", REGION_RESOLVER)
        writer.write("")

        // Resolve the region
        writer.write("let resolvedRegion: String?")
        writer.openBlock("if let region = region {", "} else {") {
            writer.write("resolvedRegion = region")
        }
        writer.indent()
        writer.write("resolvedRegion = await resolvedRegionResolver.resolveRegion()")
        writer.dedent()
        writer.write("}")
        writer.write("")

        // Resolve the signing region
        writer.write("let resolvedSigningRegion = signingRegion ?? resolvedRegion")
        writer.write("")

        // Resolve the credentials provider
        writer.openBlock("let resolvedCredentialProvider = try await \$N.resolvedProvider(", ")", AWSClientRuntimeTypes.Core.AWSCredentialsProvider) {
            writer.write("\$L,", CREDENTIALS_PROVIDER_CONFIG_NAME)
            writer.write("configuration: .init(fileBasedConfigurationStore: \$L)", FILE_BASED_CONFIG_LOCAL_NAME)
        }
        writer.write("")

        // Resolve the endpointsResolver
        writer.write("let resolvedEndpointsResolver = try \$L ?? \$L()", ENDPOINT_RESOLVER, AWSServiceTypes.DefaultEndpointResolver)
        writer.write("")

        awsConfigs.forEach {
            when (it.memberName) {
                CREDENTIALS_PROVIDER_CONFIG_NAME -> {
                    writer.write("self.\$L = resolvedCredentialProvider", it.memberName)
                }

                ENDPOINT_RESOLVER -> {
                    writer.write("self.\$L = resolvedEndpointsResolver", it.memberName)
                }

                REGION_RESOLVER -> {
                    writer.write("self.\$L = resolvedRegionResolver", it.memberName)
                }

                REGION_CONFIG_NAME -> {
                    writer.write("self.\$L = resolvedRegion", it.memberName)
                }

                SIGNING_REGION_CONFIG_NAME -> {
                    writer.write("self.\$L = resolvedSigningRegion", it.memberName)
                }

                RUNTIME_CONFIG_NAME -> {
                    // pass, runtime config is not a config field, but its individual configs are stored
                }

                else -> {
                    writer.write("self.\$L = \$L", it.memberName, it.memberName)
                }
            }
        }

        // Handle the runtime config properties
        runtimeConfigs.forEach {
            writer.write("self.\$L = \$L.\$L", it.memberName, RUNTIME_CONFIG_NAME, it.memberName)
        }

        writer.dedent().write("}")
        writer.write("")

        // partitionID computed var
        writer.openBlock("public var partitionID: String? {", "}") {
            writer.write("return \"\$L - \\(region ?? \"\")\"", serviceName)
        }
    }

    override fun otherRuntimeConfigProperties(): List<ConfigField> {
        return listOf(
            ConfigField(ENDPOINT_CONFIG_NAME, SwiftTypes.String, "\$T"),
            ConfigField(
                CREDENTIALS_PROVIDER_CONFIG_NAME,
                AWSClientRuntimeTypes.Core.CredentialsProvider,
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
