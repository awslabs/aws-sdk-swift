/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSServiceConfig
import software.amazon.smithy.swift.codegen.ServiceGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SectionWriterBinding
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration

/**
 * Overrides the service client configuration definition to use AWS specific protocol.
 */
class ServiceGeneratorIntegration : SwiftIntegration {
    override val sectionWriters: List<SectionWriterBinding> =
        listOf(SectionWriterBinding(ServiceGenerator.ConfigurationProtocolSectionId) { writer, _ ->
            writer.addImport(AWSClientRuntimeTypes.Core.AWSClientConfiguration)
            val protocolGenerationContext =
                writer.getContext("protocolGenerationContext") as ProtocolGenerator.GenerationContext
            val serviceConfig = AWSServiceConfig(writer, protocolGenerationContext)
            val serviceConfigs = serviceConfig.serviceConfigProperties()
            writer.openBlock(
                "public protocol \$L : \$L {", "}", serviceConfig.typeProtocol, serviceConfig.getTypeInheritance()
            ) {
                serviceConfigs?.let { fields ->
                    fields.forEach {
                        writer.write("var ${it.memberName}: ${it.propFormatter} { get }", it.type)
                    }
                }
            }
        })
}