package software.amazon.smithy.aws.swift.codegen.config

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.config.ClientConfiguration

class AwsRegionClientConfiguration : ClientConfiguration {
    override val swiftProtocolName: String
        get() = "AwsRegionClientConfiguration"

    override fun addImport(writer: SwiftWriter) {
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
    }
}
