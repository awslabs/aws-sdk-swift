package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpProtocolCustomizable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.resources.Resources
import java.nio.file.Files
import java.nio.file.Paths

abstract class AWSHttpProtocolCustomizations : HttpProtocolCustomizable() {
    override fun renderContextAttributes(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape) {
        val endpointPrefix = ctx.service.endpointPrefix // get endpoint prefix from smithy trait

        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write("  .withCredentialsProvider(value: config.credentialsProvider)")
        writer.write("  .withRegion(value: config.region)")
        writer.write("  .withHost(value: \"$endpointPrefix.\\(config.region).amazonaws.com\")")
        if (serviceShape.hasTrait(SigV4Trait::class.java)) {
            val signingName = serviceShape.getTrait(SigV4Trait::class.java).get().name
            writer.write("  .withSigningName(value: \$S)", signingName)
            writer.write("  .withSigningRegion(value: config.signingRegion)")
        }
    }

    override fun renderInternals(ctx: ProtocolGenerator.GenerationContext) {
        val path = determinePath("AWS_SDK_SWIFT_CI_DIR", "/codegen/smithy-aws-swift-codegen/src/main/resources/software.amazon.smithy.aws.swift.codegen")
        val filePath = path + "/endpoints.json"
        val jsonContents = Files.readString(Paths.get(filePath))
        val endpointData = Node.parse(jsonContents).expectObjectNode()
        EndpointResolverGenerator(endpointData).render(ctx)
    }

    private fun determinePath(baseEnvVar: String, relativePath: String): String {
        val userDirPathOverride = System.getenv(baseEnvVar)
        if (!userDirPathOverride.isNullOrEmpty()) {
            return userDirPathOverride + relativePath
        }
        return Resources.computeAbsolutePath("aws-sdk-swift" + relativePath)
    }
}
