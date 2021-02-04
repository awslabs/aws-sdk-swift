package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ConfigField
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

const val REGION_CONFIG_NAME = "region"
const val CREDENTIALS_PROVIDER_CONFIG_NAME = "credentialsProvider"
const val SIGNING_REGION_CONFIG_NAME = "signingRegion"

val AWS_CONFIG_FIELDS = listOf(
    ConfigField(REGION_CONFIG_NAME, "String", "The region to send requests to. (Required)"),
    ConfigField(
        CREDENTIALS_PROVIDER_CONFIG_NAME, "AWSCredentialsProvider",
        "The credentials provider to use to authenticate requests."
    ),
    ConfigField(SIGNING_REGION_CONFIG_NAME, "String", "The region to sign requests in. (Required)")
)

class AWSServiceConfig(writer: SwiftWriter, serviceName: String) : ServiceConfig(writer, serviceName) {
    override val typesToConformConfigTo: List<String>
        get() = super.typesToConformConfigTo + listOf("AWSClientConfiguration")

    override fun renderStaticDefaultImplementation(serviceSymbol: Symbol) {
        writer.openBlock("public static func `default`() throws -> ${serviceSymbol.name}Configuration {", "}") {
            writer.write("let awsCredsProvider = try AWSCredentialsProvider.fromEnv()") // TODO: should be this be the default creds provider?
            writer.write("return ${serviceSymbol.name}Configuration(credentialsProvider: awsCredsProvider)")
        }
    }

    override fun getConfigFields(): List<ConfigField> {
        return AWS_CONFIG_FIELDS
    }

    override fun renderConvenienceInits(serviceSymbol: Symbol) {
        writer.addImport("AWSClientRuntime")
        writer.openBlock("public convenience init(credentialsProvider: AWSCredentialsProvider) {", "}") {
            writer.write("let region = \"us-east-1\"") // FIXME: get region from a region resolver
            writer.write("let signingRegion = \"us-east-1\"") // FIXME: get region from a region resolver
            writer.openBlock("self.init(", ")") {
                val configFieldsSortedByName = getConfigFields().sortedBy { it.name }
                for ((index, member) in configFieldsSortedByName.withIndex()) {
                    val memberName = member.name
                    val terminator = if (index == configFieldsSortedByName.size - 1) "" else ","
                    writer.write("\$L: \$L$terminator", memberName, memberName)
                }
            }
        }
    }
}
