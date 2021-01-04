package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

class AwsHttpProtocolClientGenerator(ctx: ProtocolGenerator.GenerationContext,
                                     private val writer: SwiftWriter,
                                     properties: List<ClientProperty>,
                                     serviceConfig: ServiceConfig): HttpProtocolClientGenerator(ctx, writer, properties, serviceConfig) {
    override fun renderContextAttributes(op: OperationShape) {
        super.renderContextAttributes(op)
        writer.write("  .withCredentialsProvider(value: config.credentialsProvider)")
        writer.write("  .withRegion(value: config.region)")
        writer.write("  .withSigningRegion(value: config.signingRegion)")
    }

    override fun renderMiddlewares(op: OperationShape) {
        super.renderMiddlewares(op)
        writer.write("operation.addAWSMiddlewares()")
    }
}