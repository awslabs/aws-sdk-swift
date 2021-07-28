package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ConfigField
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

const val REGION_CONFIG_NAME = "region"
const val CREDENTIALS_PROVIDER_CONFIG_NAME = "credentialsProvider"
const val SIGNING_REGION_CONFIG_NAME = "signingRegion"
const val ENDPOINT_RESOLVER = "endpointResolver"

val AWS_CONFIG_FIELDS = listOf(
    ConfigField(REGION_CONFIG_NAME, "String", "The region to send requests to. (Required)"),
    ConfigField(
        CREDENTIALS_PROVIDER_CONFIG_NAME, "AWSCredentialsProvider",
        "The credentials provider to use to authenticate requests."
    ),
    ConfigField(SIGNING_REGION_CONFIG_NAME, "String", "The region to sign requests in. (Required)"),
    ConfigField(
        ENDPOINT_RESOLVER, "EndpointResolver",
        "The endpoint resolver used to resolve endpoints."
    )
)

class AWSServiceConfig(writer: SwiftWriter, serviceName: String) : ServiceConfig(writer, serviceName) {
    override val typesToConformConfigTo: List<String>
        get() = super.typesToConformConfigTo + listOf("AWSRuntimeConfiguration")

    override val typeName: String = "AWSClientConfiguration"

    override fun renderMainInitializer(serviceSymbol: Symbol) {
        val awsConfigFields = getOtherConfigFields().sortedBy { it.name }
        var configParams = ""
        awsConfigFields.forEach {
            configParams += "${it.name}: ${it.type}? = nil, "
        }
        writer.openBlock("public init(${configParams}runtimeConfig: SDKRuntimeConfiguration) throws {", "}") {
            writer.write("self.region = region")
            writer.write("self.signingRegion = signingRegion ?? region")
            writer.write("self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()")
            writer.openBlock("if let credProvider = credentialsProvider {", "} else {") {
                writer.write("self.credentialsProvider = credProvider")
            }
            writer.indent().write("self.credentialsProvider = try AWSCredentialsProvider.fromChain(runtimeConfig.httpClientEngine)")
            writer.dedent().write("}")
            val runtimeTimeConfigFields = getRuntimeConfigFields().sortedBy { it.name }
            runtimeTimeConfigFields.forEach {
                writer.write("self.${it.name} = runtimeConfig.${it.name}")
            }
        }
    }

    override fun renderConvenienceInitializers(serviceSymbol: Symbol) {
        val awsConfigFields = getOtherConfigFields().sortedBy { it.name }
        var configParams = ""
        var configParamValues = ""
        awsConfigFields.forEachIndexed { index, configField ->
            val terminator = if(index != awsConfigFields.lastIndex) ", " else ""
            configParams += "${configField.name}: ${configField.type}? = nil${terminator}"
            configParamValues += "${configField.name}: ${configField.name}, "
        }
        writer.openBlock("public convenience init(${configParams}) throws {", "}") {
            writer.write("let defaultRuntimeConfig = try DefaultSDKRuntimeConfiguration(\"${serviceName}\")")
            writer.write("try self.init(${configParamValues}runtimeConfig: defaultRuntimeConfig)")
        }
    }

    override fun getOtherConfigFields(): List<ConfigField> {
        return AWS_CONFIG_FIELDS
    }
}
