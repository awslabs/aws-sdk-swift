/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.getTrait

/**
 * Generates `s3CustomErrorResolver` and `s3ErrorPostProcessor` for S3.
 *
 * - `s3CustomErrorResolver`: Called before the generic TypeRegistry error path.
 *   Constructs a `RestXMLError` (old BaseError protocol) and uses
 *   `UnknownAWSHTTPServiceError.makeError(baseError:)` to handle candidate
 *   errors (e.g. InvalidAccessKeyId) and propagate requestID2 on unknown errors.
 *   Returns nil for modeled errors so the generic path handles them.
 *
 * - `s3ErrorPostProcessor`: Called after a modeled error is deserialized.
 *   Sets requestID and requestID2 from the HTTP response headers.
 */
class S3RestXMLErrorResolverIntegration : SwiftIntegration {
    override val order: Byte
        get() = 127

    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = model.expectShape<ServiceShape>(settings.service).isS3

    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator,
    ) {
        val noErrorWrapping = protocolGenerationContext.service.getTrait<RestXmlTrait>()?.isNoErrorWrapping ?: false
        delegator.useFileWriter("Sources/AWSS3/S3ErrorHelpers.swift") { writer ->
            renderCustomErrorResolver(writer, noErrorWrapping)
            writer.write("")
            renderErrorPostProcessor(writer)
            renderConformances(protocolGenerationContext, writer)
        }
    }

    private fun renderCustomErrorResolver(
        writer: SwiftWriter,
        noErrorWrapping: Boolean,
    ) {
        writer.write("import Foundation")
        writer.write("@_spi(SmithyReadWrite) import ClientRuntime")
        writer.write("import SmithyHTTPAPI")
        writer.write("@_spi(SmithyReadWrite) import SmithyXML")
        writer.write("@_spi(SchemaBasedSerde) import SmithySerialization")
        writer.write("@_spi(SchemaBasedSerde) import Smithy")
        writer.write("@_spi(UnknownAWSHTTPServiceError) import AWSClientRuntime")
        writer.write("")

        // The custom error resolver handles errors that the generic TypeRegistry path
        // cannot: candidate errors (InvalidAccessKeyId) and unknown errors with requestID2.
        // For modeled errors (those in the TypeRegistry), it returns nil so the generic path
        // handles deserialization.
        writer.openBlock(
            "func s3CustomErrorResolver(_ response: SmithyHTTPAPI.HTTPResponse, _ bodyData: Foundation.Data, _ errorTypeRegistry: SmithySerialization.TypeRegistry, _ noErrorWrapping: Bool) async throws -> Swift.Error? {",
            "}",
        ) {
            writer.write("let responseReader = try SmithyXML.Reader.from(data: bodyData)")
            writer.write(
                "let baseError = try ClientRuntime.RestXMLError(httpResponse: response, responseReader: responseReader, noErrorWrapping: \$L)",
                noErrorWrapping,
            )
            writer.write("")

            // customError() check
            writer.write("if let error = baseError.customError() { return error }")
            writer.write("")

            // Check if this is a modeled error in the registry — if so, return nil
            // to let the generic path handle it (with errorPostProcessor for requestID2)
            writer.openBlock("if errorTypeRegistry.find(matcher: { $$0.schema.id.name == baseError.code }) != nil {", "}") {
                writer.write("return nil")
            }
            writer.write("")

            // Not a modeled error — use UnknownAWSHTTPServiceError.makeError which
            // checks candidates (InvalidAccessKeyId) and propagates requestID2
            writer.write("return try AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(baseError: baseError)")
        }
    }

    private fun renderErrorPostProcessor(writer: SwiftWriter) {
        // Post-processor sets requestID and requestID2 on modeled S3 errors
        writer.openBlock(
            "func s3ErrorPostProcessor(_ error: inout any (ClientRuntime.ServiceError & ClientRuntime.HTTPError & Swift.Error), _ response: SmithyHTTPAPI.HTTPResponse) {",
            "}",
        ) {
            writer.openBlock("if var s3Error = error as? S3ErrorRequestIDSettable {", "}") {
                writer.write("s3Error.requestID = response.requestID")
                writer.write("s3Error.requestID2 = response.requestID2")
                writer.openBlock(
                    "if let updated = s3Error as? any (ClientRuntime.ServiceError & ClientRuntime.HTTPError & Swift.Error) {",
                    "}",
                ) {
                    writer.write("error = updated")
                }
            }
        }

        writer.write("")

        // Internal protocol for setting requestID and requestID2 on S3 error types
        writer.openBlock("protocol S3ErrorRequestIDSettable {", "}") {
            writer.write("var requestID: Swift.String? { get set }")
            writer.write("var requestID2: Swift.String? { get set }")
        }
    }

    private fun renderConformances(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
    ) {
        val errorShapes = mutableSetOf<StructureShape>()
        ctx.service.errors.forEach { errorId ->
            ctx.model.getShape(errorId).ifPresent { shape ->
                if (shape is StructureShape) errorShapes.add(shape)
            }
        }
        ctx.service.allOperations.forEach { opId ->
            ctx.model.getShape(opId).ifPresent { opShape ->
                opShape.asOperationShape().ifPresent { op ->
                    op.errors.forEach { errorId ->
                        ctx.model.getShape(errorId).ifPresent { shape ->
                            if (shape is StructureShape) errorShapes.add(shape)
                        }
                    }
                }
            }
        }

        if (errorShapes.isNotEmpty()) {
            writer.write("")
            for (errorShape in errorShapes.sortedBy { it.id.name }) {
                val errorSymbol = ctx.symbolProvider.toSymbol(errorShape)
                writer.write("extension ${"$"}N: S3ErrorRequestIDSettable {}", errorSymbol)
            }
        }
    }
}
