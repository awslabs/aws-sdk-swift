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
        return serviceIsS3(ctx.service)
    }

    override fun renderServiceErrorCustomizations(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        if (!serviceIsS3(ctx.service)) { return }
        writer.openBlock(
            "if baseError.httpResponse.statusCode == .notFound && baseError.httpResponse.body.isEmpty {",
            "}"
        ) {
            writer.write("return try NotFound.makeError(baseError: baseError)")
        }
    }

    private fun serviceIsS3(serviceShape: ServiceShape): Boolean {
        return serviceShape.id == ShapeId.from("com.amazonaws.s3#AmazonS3")
    }
}
