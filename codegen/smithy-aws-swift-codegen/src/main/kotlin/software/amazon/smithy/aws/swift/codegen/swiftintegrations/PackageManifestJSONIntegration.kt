package software.amazon.smithy.aws.swift.codegen.swiftintegrations

import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectTrait
import software.amazon.smithy.swift.codegen.model.hasTrait
import software.amazon.smithy.swift.codegen.targetName

class PackageManifestJSONIntegration : SwiftIntegration {
    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator,
    ) {
        // Some protocol tests may not have a ServiceTrait.  Skip this file in that case,
        // since it's not used in protocol tests anyway.
        // If an AWS service doesn't have a protocol trait, this file will skip generation,
        // but the SDK will fail to generate its main Package.swift later.
        if (!protocolGenerationContext.service.hasTrait<ServiceTrait>()) { return }

        delegator.useFileWriter("Dependencies.json") { writer ->
            writer.setIndentText("  ") // two spaces
            writer.openBlock("{", "}") {
                // Write the path to the model as "modelPath".
                val sdkId = protocolGenerationContext.service.expectTrait<ServiceTrait>().sdkId
                val modelFileName =
                    sdkId
                        .lowercase()
                        .replace(",", "")
                        .replace(" ", "-")
                writer.write("\"modelPath\": \"codegen/sdk-codegen/aws-models/$modelFileName.json\",")

                // Write the dependencies as an array of strings to key "dependencies".
                writer.openBlock("\"dependencies\": [", "]") {
                    val externalDependencies =
                        delegator.dependencies.filter {
                            it.getProperty("url", String::class.java).isPresent
                        }

                    val dependenciesByTarget =
                        externalDependencies
                            .distinctBy { it.targetName + it.packageName }
                            .sortedBy { it.targetName }

                    dependenciesByTarget.forEach { writer.write("\$S,", it.targetName) }
                    writer.unwrite(",\n")
                    writer.write("")
                }
            }
        }
    }
}
