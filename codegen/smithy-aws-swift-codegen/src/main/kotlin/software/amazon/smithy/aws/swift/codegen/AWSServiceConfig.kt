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

val AWS_CONFIG_FIELDS = listOf(
    ConfigField(
        REGION_CONFIG_NAME,
        buildSymbol {
            this.name = "String"
            this.nullable = false
        },
        "The region to send requests to. (Required)"
    ),
    ConfigField(
        CREDENTIALS_PROVIDER_CONFIG_NAME, AWSRuntimeTypes.Core.CredentialsProvider,
        "The credentials provider to use to authenticate requests."
    ),
    ConfigField(SIGNING_REGION_CONFIG_NAME, buildSymbol { this.name = "String" }, "The region to sign requests in. (Required)"),
    ConfigField(
        ENDPOINT_RESOLVER, AWSRuntimeTypes.Core.EndpointResolver,
        "The endpoint resolver used to resolve endpoints."
    )
)

class AWSServiceConfig(writer: SwiftWriter, serviceName: String) : ServiceConfig(writer, serviceName) {
    override val typesToConformConfigTo: List<String>
        get() = super.typesToConformConfigTo + listOf("AWSRuntimeConfiguration")

    override val typeName: String = "AWSClientConfiguration"

    override fun renderMainInitializer(serviceSymbol: Symbol) {
        writer.openBlock("public init(", ") throws {") {
            val awsConfigFields = getOtherConfigFields().sortedBy { it.memberName }
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
        writer.indent().write("self.credentialsProvider = try AWSCredentialsProvider.fromChain(runtimeConfig.httpClientEngine)")
        writer.dedent().write("}")
        val runtimeTimeConfigFields = getRuntimeConfigFields().sortedBy { it.memberName }
        runtimeTimeConfigFields.forEach {
            writer.write("self.${it.memberName} = runtimeConfig.${it.memberName}")
        }
        writer.dedent().write("}")
    }

    override fun renderConvenienceInitializers(serviceSymbol: Symbol) {
        writer.openBlock("public convenience init(", ") throws {") {
            val awsConfigFields = getOtherConfigFields().sortedBy { it.memberName }
            awsConfigFields.forEachIndexed { index, configField ->
                val terminator = if (index != awsConfigFields.lastIndex) ", " else ""
                writer.write("${configField.memberName}: \$D$terminator", configField.type)
            }
        }
        val awsConfigFields = getOtherConfigFields().sortedBy { it.memberName }
        var configParamValues = ""
        awsConfigFields.forEach {
            configParamValues += "${it.memberName}: ${it.memberName}, "
        }
        writer.indent()
        writer.write("let defaultRuntimeConfig = try DefaultSDKRuntimeConfiguration(\"${serviceName}\")")
        writer.write("try self.init(${configParamValues}runtimeConfig: defaultRuntimeConfig)")
        writer.dedent().write("}")
    }

    override fun getOtherConfigFields(): List<ConfigField> {
        return AWS_CONFIG_FIELDS
    }
}
