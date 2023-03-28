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
    propFormatter = "\$T",
    paramFormatter = "\$N",
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

        // init with region and runtime config
        writer.openBlock("public init(", ") async throws {") {
            awsConfigs.forEachIndexed { index, config ->
                val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                writer.write("${config.memberName}: ${config.paramFormatter}$terminator", config.type)
            }
        }
        writer.indent()

        // Resolve the runtime config
        // let runtimeConfig = try runtimeConfig ?? ClientRuntime.DefaultSDKRuntimeConfiguration("S3Client")
        writer.write("let runtimeConfig = try runtimeConfig ?? \$N(\"${serviceName}\")", ClientRuntimeTypes.Core.DefaultSDKRuntimeConfiguration)


        // Create our file based config store
        writer.write("let \$N = try CRTFiledBasedConfigurationStore()", FILE_BASED_CONFIG_LOCAL_NAME)

        awsConfigs.forEach {
            when (it.memberName) {
                SIGNING_REGION_CONFIG_NAME -> {
                    writer.write("self.${it.memberName} = ${it.memberName} ?? $REGION_CONFIG_NAME")
                }

                CREDENTIALS_PROVIDER_CONFIG_NAME -> {
                    writer.openBlock("self.\$N = try await \$N.resolvedProvider(", ")", it.memberName, AWSClientRuntimeTypes.Core.AWSCredentialsProvider) {
                        writer.write("\$N,", it.memberName)
                        writer.write("configuration: .init(fileBasedConfigurationStore: \$N)", FILE_BASED_CONFIG_LOCAL_NAME)
                    }
                }

                ENDPOINT_RESOLVER -> {
                    writer.openBlock("if let endpointResolver = endpointResolver {", "} else {") {
                        writer.write("self.endpointResolver = endpointResolver")
                    }
                    writer.indent().write("self.${it.memberName} = try \$L()", AWSServiceTypes.DefaultEndpointResolver)
                    writer.dedent().write("}")
                }

                RUNTIME_CONFIG_NAME -> {
                    // pass, runtime config is not a config field, but its individual configs are stored
                }

                REGION_RESOLVER -> {
                    writer.write("self.${it.memberName} = try ${it.memberName} ?? DefaultRegionResolver()")
                }

                else -> {
                    writer.write("self.${it.memberName} = ${it.memberName}")
                }
            }
        }
        runtimeConfigs.forEach {
            writer.write("self.${it.memberName} = runtimeConfig.${it.memberName}")
        }
        writer.dedent().write("}")
        writer.write("")

        // convenience init with region but no runtime config
        writer.openBlock("public convenience init(", ") throws {") {
            awsConfigs.forEachIndexed { index, config ->
                when (config.memberName) {
                    RUNTIME_CONFIG_NAME -> {
                        // pass
                    }

                    else -> {
                        val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                        writer.write("${config.memberName}: ${config.paramFormatter}$terminator", config.type)
                    }
                }
            }
        }
        writer.indent()
        writer.write(
            "let runtimeConfig = try \$N(\"${serviceName}\")", ClientRuntimeTypes.Core.DefaultSDKRuntimeConfiguration
        )
        writer.write("try self.init(")
        writer.indent()
        awsConfigs.forEachIndexed { index, config ->
            val terminator = if (index != awsConfigs.lastIndex) ", " else ""
            writer.write("${config.memberName}: ${config.memberName}$terminator")
        }
        writer.dedent()
        writer.write(")")
        writer.dedent()
        writer.write("}")
        writer.write("")

        // init with runtime config but no region
        writer.openBlock("public init(", ") async throws {") {
            awsConfigs.forEachIndexed { index, config ->
                when (config.memberName) {
                    REGION_CONFIG_NAME -> {
                        // pass
                    }

                    else -> {
                        val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                        writer.write("${config.memberName}: ${config.paramFormatter}$terminator", config.type)
                    }
                }
            }
        }
        writer.indent()
        awsConfigs.forEach {
            when (it.memberName) {
                REGION_CONFIG_NAME -> {
                    // region must be resolved asynchronously
                    writer.write("let resolvedRegionResolver = try regionResolver ?? DefaultRegionResolver()")
                    writer.write("self.${it.memberName} = await resolvedRegionResolver.resolveRegion()")
                }

                SIGNING_REGION_CONFIG_NAME -> {
                    writer.write("self.${it.memberName} = ${it.memberName} ?? $REGION_CONFIG_NAME")
                }

                CREDENTIALS_PROVIDER_CONFIG_NAME -> {
                    writer.openBlock("if let credProvider = ${it.memberName} {", "} else {") {
                        writer.write(
                            "self.${it.memberName} = try \$N.fromCustom(credProvider)",
                            AWSClientRuntimeTypes.Core.AWSCredentialsProvider
                        )
                    }
                    writer.indent().write(
                        "self.${it.memberName} = try \$N.fromChain()", AWSClientRuntimeTypes.Core.AWSCredentialsProvider
                    )
                    writer.dedent().write("}")
                }

                ENDPOINT_RESOLVER -> {
                    writer.openBlock("if let endpointResolver = endpointResolver {", "} else {") {
                        writer.write("self.endpointResolver = endpointResolver")
                    }
                    writer.indent().write("self.${it.memberName} = try \$L()", AWSServiceTypes.DefaultEndpointResolver)
                    writer.dedent().write("}")
                }

                RUNTIME_CONFIG_NAME -> {
                    // pass, runtime config is not a config field, but its individual configs are stored
                }

                REGION_RESOLVER -> {
                    writer.write("self.${it.memberName} = try ${it.memberName} ?? DefaultRegionResolver()")
                }

                else -> {
                    writer.write("self.${it.memberName} = ${it.memberName}")
                }
            }
        }
        runtimeConfigs.forEach {
            writer.write("self.${it.memberName} = runtimeConfig.${it.memberName}")
        }
        writer.dedent().write("}")
        writer.write("")

        // convenience init with neither region nor runtime config
        writer.openBlock("public convenience init(", ") async throws {") {
            awsConfigs.forEachIndexed { index, config ->
                when (config.memberName) {
                    REGION_CONFIG_NAME, RUNTIME_CONFIG_NAME -> {
                        // pass
                    }

                    else -> {
                        val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                        writer.write("${config.memberName}: ${config.paramFormatter}$terminator", config.type)
                    }
                }
            }
        }
        writer.indent()
        writer.write(
            "let runtimeConfig = try \$N(\"${serviceName}\")", ClientRuntimeTypes.Core.DefaultSDKRuntimeConfiguration
        )
        writer.write("try await self.init(")
        writer.indent()
        awsConfigs.forEachIndexed { index, config ->
            when (config.memberName) {
                REGION_CONFIG_NAME -> {
                    // pass
                }

                else -> {
                    val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                    writer.write("${config.memberName}: ${config.memberName}$terminator")
                }
            }
        }
        writer.dedent()
        writer.write(")")
        writer.dedent()
        writer.write("}")
        writer.write("")
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
            ConfigField(REGION_CONFIG_NAME, SwiftTypes.String, "\$T", paramFormatter = "\$N"),
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
