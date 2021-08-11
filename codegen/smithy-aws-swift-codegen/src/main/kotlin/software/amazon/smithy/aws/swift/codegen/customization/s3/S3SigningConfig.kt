/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.integration.OperationMiddlewareRenderable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.hasTrait

/**
 * Overrides the SigV4 signing middleware config for S3.
 */
class S3SigningConfig : SwiftIntegration {

    override val order: Byte
        get() = 127

    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        resolved: List<OperationMiddlewareRenderable>
    ): List<OperationMiddlewareRenderable> {
        if (!ctx.service.isS3) return resolved

        val middleware = resolved.filterNot {
            it.name == "AWSSigningMiddleware"
        }.toMutableList()

        middleware.add(S3SigningMiddleware())

        return middleware
    }
}

private class S3SigningMiddleware() : AWSSigningMiddleware() {
    override fun middlewareParamsString(
        ctx: ProtocolGenerator.GenerationContext,
        serviceShape: ServiceShape,
        op: OperationShape
    ): String {
        val hasUnsignedPayload = op.hasTrait<UnsignedPayloadTrait>()
        return "useDoubleURIEncode: false, shouldNormalizeURIPath: false, signedBodyHeader: .contentSha256, unsignedBody: $hasUnsignedPayload"
    }
}
