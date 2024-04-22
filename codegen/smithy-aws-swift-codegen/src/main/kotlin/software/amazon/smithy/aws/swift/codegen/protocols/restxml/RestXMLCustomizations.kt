/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.restxml

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class RestXMLCustomizations : AWSHTTPProtocolCustomizations() {

    override val baseErrorSymbol: Symbol = AWSClientRuntimeTypes.RestXML.RestXMLError

    override fun hasServiceErrorCustomizations(ctx: ProtocolGenerator.GenerationContext): Boolean {
        return shouldApplyS3ErrorCustomization(ctx)
    }

    override fun renderServiceErrorCustomizations(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        if (shouldApplyS3ErrorCustomization(ctx)) {
            writer.openBlock(
                "if baseError.httpResponse.statusCode == .notFound && baseError.httpResponse.body.isEmpty {",
                "}"
            ) {
                writer.write("return try NotFound.makeError(baseError: baseError)")
            }
        }
    }

    private fun shouldApplyS3ErrorCustomization(ctx: ProtocolGenerator.GenerationContext): Boolean {
        return serviceIsS3(ctx) && serviceHasNotFoundError(ctx)
    }

    private fun serviceIsS3(ctx: ProtocolGenerator.GenerationContext): Boolean {
        return ctx.service.id == ShapeId.from("com.amazonaws.s3#AmazonS3")
    }

    // This check is performed because S3 protocol tests do not define this error,
    // and the protocol test will fail since the NotFound type is undefined.
    private fun serviceHasNotFoundError(ctx: ProtocolGenerator.GenerationContext): Boolean {
        return ctx.model.getShape(ShapeId.from("com.amazonaws.s3#NotFound")).isPresent
    }
}
