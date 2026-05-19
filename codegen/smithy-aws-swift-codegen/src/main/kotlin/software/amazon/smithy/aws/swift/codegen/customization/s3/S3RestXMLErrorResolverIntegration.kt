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
import software.amazon.smithy.swift.codegen.utils.ModelFileUtils

/** Renders S3-specific custom error resolver and post-processor for RestXML. */
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
        val filename = ModelFileUtils.filename(protocolGenerationContext.settings, "S3ErrorHelpers")
        delegator.useFileWriter(filename) { writer ->
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

        writer.openBlock(
            "@Sendable func s3CustomErrorResolver(_ response: SmithyHTTPAPI.HTTPResponse, _ bodyData: Foundation.Data, _ errorTypeRegistry: SmithySerialization.TypeRegistry, _ noErrorWrapping: Bool) async throws -> Swift.Error? {",
            "}",
        ) {
            writer.write("let responseReader = try SmithyXML.Reader.from(data: bodyData)")
            writer.write(
                "let baseError = try ClientRuntime.RestXMLError(httpResponse: response, responseReader: responseReader, noErrorWrapping: \$L)",
                noErrorWrapping,
            )
            writer.write("")
            writer.write("if let error = baseError.customError() { return error }")
            writer.write("")
            writer.openBlock("if errorTypeRegistry.find(matcher: { $$0.schema.id.name == baseError.code }) != nil {", "}") {
                writer.write("return nil")
            }
            writer.write("")
            writer.write("return try AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(baseError: baseError)")
        }
    }

    private fun renderErrorPostProcessor(writer: SwiftWriter) {
        writer.openBlock(
            "@Sendable func s3ErrorPostProcessor(_ error: inout any (ClientRuntime.ServiceError & ClientRuntime.HTTPError & Swift.Error), _ response: SmithyHTTPAPI.HTTPResponse) {",
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
