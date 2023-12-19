/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */
package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.traits.StreamingTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.hasTrait

/**
 * Register interceptor to handle S3 error responses returned with an HTTP 200 status code.
 * see [aws-sdk-kotlin#199](https://github.com/awslabs/aws-sdk-kotlin/issues/199)
 * see [aws-sdk-swift#1113](https://github.com/awslabs/aws-sdk-swift/issues/1113)
 */
class S3ErrorWith200StatusIntegration : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean =
        model.expectShape<ServiceShape>(settings.service).isS3

    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware,
    ) {
        // we don't know for sure what operations S3 does this on. Go customized this for only a select few
        // like CopyObject/UploadPartCopy/CompleteMultipartUpload but Rust hit it on additional operations
        // (DeleteObjects).
        // Instead of playing whack-a-mole broadly apply this interceptor to everything but streaming responses
        // which adds a small amount of overhead to response processing.
        val output = ctx.model.expectShape(operationShape.output.get())
        if (output.members().none {
            it.hasTrait<StreamingTrait>() ||
                ctx.model.expectShape(it.target).hasTrait<StreamingTrait>()
        }) {
            operationMiddleware.appendMiddleware(operationShape, S3HandleError200ResponseMiddleware)
        }
    }
}

private object S3HandleError200ResponseMiddleware : MiddlewareRenderable {
    override val name = "S3ErrorWith200StatusXMLMiddleware"

    override val middlewareStep = MiddlewareStep.DESERIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val outputShape = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op)
        writer.openBlock(
            "$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, id: \"${name}\") { (context, input, next) -> \$N<${outputShape.name}> in",
            "}",
            ClientRuntimeTypes.Middleware.OperationOutput,
        ) {
            writer.apply {
                // Send the request and get the response
                write("let response = try await next.handle(context: context, input: input)")

                // Check if the response status is 200
                write("guard response.httpResponse.statusCode == .ok else {")
                write("    return try await next.handle(context: context, input: input)")
                write("}")

                // Read the response body
                write("let data = try await response.httpResponse.body.readData()")
                write("let xmlString = String(data: data!, encoding: .utf8) ?? \"\"")

                // Check for <Error> tag in the XML
                write("if xmlString.contains(\"<Error>\") {")
                write("    // Handle the error as a 500 Internal Server Error")
                write("    response.httpResponse.statusCode = .internalServerError")
                write("    return response")
                write("}")

                write("return try await next.handle(context: context, input: input)")
            }
        }
    }
}
