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

const val FILE_BASED_CONFIG_LOCAL_NAME = "fileBasedConfig"

class AWSServiceConfig(writer: SwiftWriter, val ctx: ProtocolGenerator.GenerationContext) :
    ServiceConfig(writer, ctx.symbolProvider.toSymbol(ctx.service).name, ctx.service.sdkId) {

    override fun renderInitializers(serviceSymbol: Symbol) {
        val serviceConfigs = serviceConfigProperties()
        writer.openBlock("extension \$L {", "}", clientName) {
            writer.write("public typealias \$LConfiguration = AWSClientConfiguration<DefaultRetryStrategy, DefaultRetryErrorInfoProvider, ServiceSpecificConfiguration>", clientName)
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

    fun renderDesignatedInitializer(
        runtimeConfigs: List<ConfigField>,
        awsConfigs: List<ConfigField>
    ) {
        writer.writeDocs("Internal designated init")
        writer.writeDocs("All convenience inits should call this")
        writer.openBlock("public init(", ") throws {") {
            awsConfigs.forEachIndexed { index, config ->
                when (config.memberName) {
                    // Skip regionResolver since region is required
                    REGION_RESOLVER -> {}

                    // We'll always do the runtimeConfig last, so skip here
                    RUNTIME_CONFIG_NAME -> {}

                    CREDENTIALS_PROVIDER_CONFIG_NAME -> {
                        // Render non-optional
                        writer.write("\$L: \$N,", config.memberName, config.type)
                    }
                    else -> {
                        writer.write("\$L: \$T,", config.memberName, config.type)
                    }
                }
            }

            writer.write("\$L: \$T", RUNTIME_CONFIG_NAME, ClientRuntimeTypes.Core.DefaultSDKRuntimeConfiguration)
        }
        writer.indent()

        // Resolve the runtime config
        // let runtimeConfig = try runtimeConfig ?? ClientRuntime.DefaultSDKRuntimeConfiguration("S3Client")
        writer.write("let \$L = try \$L ?? \$N(\"\$L\")", RUNTIME_CONFIG_NAME, RUNTIME_CONFIG_NAME, ClientRuntimeTypes.Core.DefaultSDKRuntimeConfiguration, clientName)
        writer.write("")

        // Resolve the signing region
        writer.write("let resolvedSigningRegion = \$L ?? \$L", SIGNING_REGION_CONFIG_NAME, REGION_CONFIG_NAME)
        writer.write("")

        // Resolve the endpointsResolver
        writer.write("let resolvedEndpointsResolver = try \$L ?? \$L()", ENDPOINT_RESOLVER, AWSServiceTypes.DefaultEndpointResolver)
        writer.write("")

        awsConfigs.forEach {
            when (it.memberName) {
                ENDPOINT_RESOLVER -> {
                    writer.write("self.\$L = resolvedEndpointsResolver", it.memberName)
                }

                REGION_RESOLVER -> {
                    writer.write("// TODO: Remove region resolver. Region must already be resolved and there is no point in storing the resolver.")
                    writer.write("self.\$L = nil", it.memberName)
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
    }

    fun renderAsyncInitializer(
        awsConfigs: List<ConfigField>
    ) {
        writer.writeDocs("Creates a configuration asynchronously")
        writer.openBlock("public convenience init(", ") async throws {") {
            awsConfigs.forEachIndexed { index, config ->
                val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                writer.write("${config.memberName}: ${config.paramFormatter}$terminator", config.type)
            }
        }
        writer.indent()

        // Create our file based config
        writer.write("let \$L = try await CRTFileBasedConfiguration.makeAsync()", FILE_BASED_CONFIG_LOCAL_NAME)
        writer.write("")

        // Resolve the region resolver
        writer.write("let resolvedRegionResolver = try \$L ?? DefaultRegionResolver { _, _ in \$L }", REGION_RESOLVER, FILE_BASED_CONFIG_LOCAL_NAME)
        writer.write("")

        // Resolve the region
        writer.write("let resolvedRegion: String?")
        writer.openBlock("if let \$L = \$L {", "} else {", REGION_CONFIG_NAME, REGION_CONFIG_NAME) {
            writer.write("resolvedRegion = \$L", REGION_CONFIG_NAME)
        }
        writer.indent()
        writer.write("resolvedRegion = await resolvedRegionResolver.resolveRegion()")
        writer.dedent()
        writer.write("}")
        writer.write("")

        // Resolve the credentials provider
        writer.write("let resolvedCredentialsProvider: \$N", AWSClientRuntimeTypes.Core.CredentialsProviding)
        writer.openBlock("if let \$L = \$L {", "} else {", CREDENTIALS_PROVIDER_CONFIG_NAME, CREDENTIALS_PROVIDER_CONFIG_NAME) {
            writer.write("resolvedCredentialsProvider = \$L", CREDENTIALS_PROVIDER_CONFIG_NAME)
        }
        writer.indent()
        writer.write("resolvedCredentialsProvider = try DefaultChainCredentialsProvider(fileBasedConfig: \$L)", FILE_BASED_CONFIG_LOCAL_NAME)
        writer.dedent()
        writer.write("}")
        writer.write("")

        writer.openBlock("try self.init(", ")") {
            awsConfigs.forEach {
                when (it.memberName) {
                    CREDENTIALS_PROVIDER_CONFIG_NAME -> {
                        writer.write("\$L: resolvedCredentialsProvider,", it.memberName)
                    }

                    REGION_CONFIG_NAME -> {
                        writer.write("\$L: resolvedRegion,", it.memberName)
                    }

                    // Skip, region should already be resolved
                    REGION_RESOLVER -> {}

                    // Skip, we'll always do runtime config last
                    RUNTIME_CONFIG_NAME -> {}

                    else -> {
                        writer.write("\$L: \$L,", it.memberName, it.memberName)
                    }
                }
            }
            writer.write("\$L: \$L", RUNTIME_CONFIG_NAME, RUNTIME_CONFIG_NAME)
        }

        writer.dedent().write("}")
    }

    fun renderSyncInitializer(
        awsConfigs: List<ConfigField>
    ) {
        writer.openBlock("public convenience init(", ") throws {") {
            writer.write("\$L: \$N,", REGION_CONFIG_NAME, SwiftTypes.String)

            awsConfigs.forEachIndexed { index, config ->
                when (config.memberName) {
                    // Skip, region is handled above
                    REGION_CONFIG_NAME -> {}

                    // Skip, region is required and so no resolver is needed
                    REGION_RESOLVER -> {}

                    else -> {
                        val terminator = if (index != awsConfigs.lastIndex) ", " else ""
                        writer.write("${config.memberName}: ${config.paramFormatter}$terminator", config.type)
                    }
                }
            }
        }
        writer.indent()

        writer.write("let resolvedCredentialsProvider: CredentialsProviding")
        writer.openBlock("if let \$L = \$L {", "} else {", CREDENTIALS_PROVIDER_CONFIG_NAME, CREDENTIALS_PROVIDER_CONFIG_NAME) {
            writer.write("resolvedCredentialsProvider = \$L", CREDENTIALS_PROVIDER_CONFIG_NAME)
        }
        writer.indent()
        writer.write("let \$L = try CRTFileBasedConfiguration.make()", FILE_BASED_CONFIG_LOCAL_NAME)
        writer.write("resolvedCredentialsProvider = try DefaultChainCredentialsProvider(fileBasedConfig: \$L)", FILE_BASED_CONFIG_LOCAL_NAME)
        writer.dedent()
        writer.write("}")
        writer.write("")

        writer.openBlock("try self.init(", ")") {
            awsConfigs.forEach {
                when (it.memberName) {
                    CREDENTIALS_PROVIDER_CONFIG_NAME -> {
                        writer.write("\$L: resolvedCredentialsProvider,", it.memberName)
                    }

                    // Skip, region should already be resolved
                    REGION_RESOLVER -> {}

                    // Skip, we'll always do runtime config last
                    RUNTIME_CONFIG_NAME -> {}

                    else -> {
                        writer.write("\$L: \$L,", it.memberName, it.memberName)
                    }
                }
            }
            writer.write("\$L: \$L", RUNTIME_CONFIG_NAME, RUNTIME_CONFIG_NAME)
        }

        writer.dedent().write("}")
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
