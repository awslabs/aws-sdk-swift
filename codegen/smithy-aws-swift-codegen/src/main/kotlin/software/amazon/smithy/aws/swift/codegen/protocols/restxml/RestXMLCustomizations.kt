/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.aws.protocols.restxml.RestXMLPlugin
import software.amazon.smithy.swift.codegen.integration.HTTPProtocolCustomizable.ServiceErrorCustomRenderer
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyRestXMLTypes

class RestXMLCustomizations : AWSHTTPProtocolCustomizations() {
    override val baseErrorSymbol: Symbol = ClientRuntimeTypes.RestXML.RestXMLError

    override fun renderClientProtocol(writer: SwiftWriter): String =
        writer.format("\$N()", SmithyRestXMLTypes.HTTPClientProtocol)

    override val plugins: List<Plugin> = listOf(RestXMLPlugin())

    private class S3Empty404Renderer : ServiceErrorCustomRenderer {
        override fun render(writer: SwiftWriter) {
            writer.openBlock(
                "if baseError.httpResponse.statusCode == .notFound && baseError.httpResponse.body.isEmpty {",
                "}",
            ) {
                writer.write("return try NotFound.makeError(baseError: baseError)")
            }
        }
    }

    override fun serviceErrorCustomRenderer(ctx: ProtocolGenerator.GenerationContext): ServiceErrorCustomRenderer? =
        S3Empty404Renderer().takeIf { shouldApplyS3ErrorCustomization(ctx) }

    private fun shouldApplyS3ErrorCustomization(ctx: ProtocolGenerator.GenerationContext): Boolean =
        serviceIsS3(ctx) && serviceHasNotFoundError(ctx)

    private fun serviceIsS3(ctx: ProtocolGenerator.GenerationContext): Boolean = ctx.service.id == ShapeId.from("com.amazonaws.s3#AmazonS3")

    private fun serviceHasNotFoundError(ctx: ProtocolGenerator.GenerationContext): Boolean =
        ctx.model.getShape(ShapeId.from("com.amazonaws.s3#NotFound")).isPresent
}
