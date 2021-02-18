package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientCustomizable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

abstract class AWSHttpProtocolClientCustomizations : HttpProtocolClientCustomizable() {
    override fun renderContextAttributes(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape) {
        val endpointPrefix = ctx.service.endpointPrefix // get endpoint prefix from smithy trait
        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write("  .withCredentialsProvider(value: config.credentialsProvider)")
        writer.write("  .withRegion(value: config.region)")
        writer.write("  .withHost(value: \"$endpointPrefix.\\(config.region).amazonaws.com\")")
    }

    override fun addImport(writer: SwiftWriter) {
    }
}
