package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.config.AwsDefaultClientConfiguration
import software.amazon.smithy.aws.swift.codegen.config.AwsRegionClientConfiguration
import software.amazon.smithy.swift.codegen.config.ClientConfiguration
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration

class AwsClientConfigurationIntegration : SwiftIntegration {
    override fun clientConfigurations(): List<ClientConfiguration> {
        return listOf(AwsDefaultClientConfiguration(), AwsRegionClientConfiguration())
    }
}
