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

const val REGION_CONFIG_NAME = "region"
const val CREDENTIALS_PROVIDER_CONFIG_NAME = "credentialsProvider"
const val SIGNING_REGION_CONFIG_NAME = "signingRegion"
const val ENDPOINT_RESOLVER = "endpointResolver"
const val REGION_RESOLVER = "regionResolver"

class AWSServiceConfig(writer: SwiftWriter, serviceName: String) : ServiceConfig(writer, serviceName) {
    override val typesToConformConfigTo: List<Symbol>
        get() = listOf(AWSClientRuntimeTypes.Core.AWSClientConfiguration)

    override fun renderInitializers(serviceSymbol: Symbol) {
        val awsConfigFields = otherRuntimeConfigProperties()
        writer.openBlock("public init(", ") throws {") {
            awsConfigFields.forEach {
                writer.write("${it.memberName}: \$D, ", it.type)
            }
            writer.write("runtimeConfig: \$N", ClientRuntimeTypes.Core.SDKRuntimeConfiguration)
        }
        writer.indent()
        writer.write("self.regionResolver = regionResolver ?? DefaultRegionResolver()")
        writer.write("let defaultRegion = self.regionResolver.resolveRegion()")
        writer.write("self.region = region ?? defaultRegion")
        writer.write("self.signingRegion = signingRegion ?? defaultRegion")
        writer.write("self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()")
        writer.openBlock("if let credProvider = credentialsProvider {", "} else {") {
            writer.write("self.credentialsProvider = credProvider")
        }
        writer.indent().write("self.credentialsProvider = try \$N.fromChain()", AWSClientRuntimeTypes.Core.CredentialsProvider)
        writer.dedent().write("}")
        val runtimeTimeConfigFields = sdkRuntimeConfigProperties()
        runtimeTimeConfigFields.forEach {
            writer.write("self.${it.memberName} = runtimeConfig.${it.memberName}")
        }
        writer.dedent().write("}")
        writer.write("")

        writer.openBlock("public convenience init(", ") throws {") {

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
        writer.write("try self.init(${configParamValues}runtimeConfig: defaultRuntimeConfig)")
        writer.dedent().write("}")
    }

    override fun otherRuntimeConfigProperties(): List<ConfigField> {
        return listOf(
            ConfigField(
                REGION_CONFIG_NAME,
                SwiftTypes.String,
                "\$T",
                "The region to send requests to. (Required)"
            ),
            ConfigField(
                CREDENTIALS_PROVIDER_CONFIG_NAME, AWSClientRuntimeTypes.Core.CredentialsProvider,
                documentation = "The credentials provider to use to authenticate requests."
            ),
            ConfigField(SIGNING_REGION_CONFIG_NAME, SwiftTypes.String, "\$T", "The region to sign requests in. (Required)"),
            ConfigField(
                ENDPOINT_RESOLVER, AWSClientRuntimeTypes.Core.EndpointResolver,
                documentation = "The endpoint resolver used to resolve endpoints."
            ),
            ConfigField(REGION_RESOLVER, AWSClientRuntimeTypes.Core.RegionResolver, documentation = "The region resolver uses an array of region providers to resolve the region.")
        ).sortedBy { it.memberName }
    }
}
