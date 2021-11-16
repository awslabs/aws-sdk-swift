/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ConfigField
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

const val CREDENTIALS_PROVIDER_CONFIG_NAME = "credentialsProvider"
const val ENDPOINT_RESOLVER = "endpointResolver"
const val FRAMEWORK_METADATA = "frameworkMetadata"
const val REGION_CONFIG_NAME = "region"
const val REGION_RESOLVER = "regionResolver"
const val SIGNING_REGION_CONFIG_NAME = "signingRegion"

class AWSServiceConfig(writer: SwiftWriter, serviceName: String) : ServiceConfig(writer, serviceName) {
    override val typesToConformConfigTo: List<Symbol>
        get() = listOf(AWSClientRuntimeTypes.Core.AWSClientConfiguration)

    override fun renderInitializers(serviceSymbol: Symbol) {
        val awsConfigFields = otherRuntimeConfigProperties()
        writer.openBlock("public init(", ") async throws {") {
            awsConfigFields.forEach {
                writer.write("${it.memberName}: \$D, ", it.type)
            }
            writer.write("runtimeConfig: \$N", ClientRuntimeTypes.Core.SDKRuntimeConfiguration)
        }
        writer.indent()
        writer.openBlock("if let region = region {", "} else {") {
            writer.write("self.region = region")
            writer.write("self.regionResolver = nil")
            writer.write("self.signingRegion = signingRegion ?? region")
        }
        writer.indent()
        writer.write("let resolvedRegionResolver = regionResolver ?? DefaultRegionResolver()")
        writer.write("let region = await resolvedRegionResolver.resolveRegion()")
        writer.write("self.region = region")
        writer.write("self.regionResolver = resolvedRegionResolver")
        writer.write("self.signingRegion = signingRegion ?? region")
        writer.dedent()
        writer.write("}")
        writer.write("self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()")
        writer.openBlock("if let credProvider = credentialsProvider {", "} else {") {
            writer.write("self.credentialsProvider = try \$N.fromCustom(credProvider)", AWSClientRuntimeTypes.Core.AWSCredentialsProvider)
        }
        writer.indent().write("self.credentialsProvider = try \$N.fromChain()", AWSClientRuntimeTypes.Core.AWSCredentialsProvider)
        writer.dedent().write("}")
        writer.write("self.frameworkMetadata = frameworkMetadata")
        val runtimeTimeConfigFields = sdkRuntimeConfigProperties()
        runtimeTimeConfigFields.forEach {
            writer.write("self.${it.memberName} = runtimeConfig.${it.memberName}")
        }
        writer.dedent().write("}")
        writer.write("")

        writer.openBlock("public convenience init(", ") async throws {") {

            awsConfigFields.forEachIndexed { index, configField ->
                val terminator = if (index != awsConfigFields.lastIndex) ", " else ""
                writer.write("${configField.memberName}: \$D$terminator", configField.type)
            }
        }

        var configParamValues = ""
        awsConfigFields.forEach {
            configParamValues += "${it.memberName}: ${it.memberName}, "
        }
        writer.indent()
        writer.write("let defaultRuntimeConfig = try \$N(\"${serviceName}\")", ClientRuntimeTypes.Core.DefaultSDKRuntimeConfiguration)
        writer.write("try await self.init(${configParamValues}runtimeConfig: defaultRuntimeConfig)")
        writer.dedent().write("}")
    }

    override fun otherRuntimeConfigProperties(): List<ConfigField> {
        return listOf(
            ConfigField(
                CREDENTIALS_PROVIDER_CONFIG_NAME, AWSClientRuntimeTypes.Core.CredentialsProvider,
                documentation = "The credentials provider to use to authenticate requests."
            ),
            ConfigField(
                ENDPOINT_RESOLVER, AWSClientRuntimeTypes.Core.EndpointResolver,
                documentation = "The endpoint resolver used to resolve endpoints."
            ),
            ConfigField(
                FRAMEWORK_METADATA,
                AWSClientRuntimeTypes.Core.FrameworkMetadata,
                formatter = "\$T",
                documentation = "Contains information to inject lib/ into user-agent"
            ),
            ConfigField(
                REGION_CONFIG_NAME,
                SwiftTypes.String,
                "\$T",
                "The region to send requests to. (Required)"
            ),
            ConfigField(REGION_RESOLVER, AWSClientRuntimeTypes.Core.RegionResolver, "\$T", documentation = "The region resolver uses an array of region providers to resolve the region."),
            ConfigField(SIGNING_REGION_CONFIG_NAME, SwiftTypes.String, "\$T", "The region to sign requests in. (Required)")
        ).sortedBy { it.memberName }
    }
}
