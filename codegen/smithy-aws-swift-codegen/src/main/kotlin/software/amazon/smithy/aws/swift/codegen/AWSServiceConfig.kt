package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ConfigField
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.buildSymbol

const val REGION_CONFIG_NAME = "region"
const val CREDENTIALS_PROVIDER_CONFIG_NAME = "credentialsProvider"
const val SIGNING_REGION_CONFIG_NAME = "signingRegion"
const val ENDPOINT_RESOLVER = "endpointResolver"

class AWSServiceConfig(writer: SwiftWriter, serviceName: String) : ServiceConfig(writer, serviceName) {
    override val typesToConformConfigTo: List<String>
        get() = listOf("AWSClientConfiguration")

    override fun renderInitializers(serviceSymbol: Symbol) {
        val awsConfigFields = otherRuntimeConfigProperties()
        writer.openBlock("public init(", ") throws {") {
            awsConfigFields.forEach {
                writer.write("${it.memberName}: \$D, ", it.type)
            }
            writer.write("runtimeConfig: SDKRuntimeConfiguration")
        }
        writer.indent()
        writer.write("self.region = region")
        writer.write("self.signingRegion = signingRegion ?? region")
        writer.write("self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()")
        writer.openBlock("if let credProvider = credentialsProvider {", "} else {") {
            writer.write("self.credentialsProvider = credProvider")
        }
        writer.indent().write("self.credentialsProvider = try AWSCredentialsProvider.fromChain()")
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
        writer.write("let defaultRuntimeConfig = try DefaultSDKRuntimeConfiguration(\"${serviceName}\")")
        writer.write("try self.init(${configParamValues}runtimeConfig: defaultRuntimeConfig)")
        writer.dedent().write("}")
    }

    override fun otherRuntimeConfigProperties(): List<ConfigField> {
        return listOf(
            ConfigField(
                REGION_CONFIG_NAME,
                buildSymbol {
                    this.name = "String"
                    this.nullable = false
                },
                "The region to send requests to. (Required)"
            ),
            ConfigField(
                CREDENTIALS_PROVIDER_CONFIG_NAME, AWSClientRuntimeTypes.Core.CredentialsProvider,
                "The credentials provider to use to authenticate requests."
            ),
            ConfigField(SIGNING_REGION_CONFIG_NAME, buildSymbol { this.name = "String" }, "The region to sign requests in. (Required)"),
            ConfigField(
                ENDPOINT_RESOLVER, AWSClientRuntimeTypes.Core.EndpointResolver,
                "The endpoint resolver used to resolve endpoints."
            )
        ).sortedBy { it.memberName }
    }
}
