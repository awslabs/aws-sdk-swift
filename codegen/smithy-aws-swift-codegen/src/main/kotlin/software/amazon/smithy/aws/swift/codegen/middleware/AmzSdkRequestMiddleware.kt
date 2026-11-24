/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.model.findStreamingMember

/**
 * Renders middleware to add the amz-sdk-request header.
 */
class AmzSdkRequestMiddleware(
    val model: Model,
    val symbolProvider: SymbolProvider,
) : MiddlewareRenderable {
    companion object {
        const val NAME = "AmzSdkRequestMiddleware"
    }

    override val name: String = NAME

    override fun renderMiddlewareInit(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        op: OperationShape,
    ) {
        // The SEP calls for ttl to be omitted on streaming operations.
        val isStreamingParam = if (op.isStreaming()) ", isStreaming: true" else ""
        writer.write(
            "\$N<\$N, \$N>(maxRetries: config.retryStrategyOptions.maxRetriesBase, " +
                "socketTimeout: config.httpClientConfiguration.socketTimeout\$L)",
            AWSClientRuntimeTypes.Core.AmzSdkRequestMiddleware,
            MiddlewareShapeUtils.inputSymbol(symbolProvider, model, op),
            MiddlewareShapeUtils.outputSymbol(symbolProvider, model, op),
            isStreamingParam,
        )
    }

    private fun OperationShape.isStreaming(): Boolean =
        listOf(input, output).any { shapeId ->
            shapeId.map { model.expectShape(it).findStreamingMember(model) != null }.orElse(false)
        }
}
