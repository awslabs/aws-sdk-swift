/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

package software.amazon.smithy.aws.swift.codegen.swiftintegrations

import software.amazon.smithy.aws.swift.codegen.middleware.CredentialInvalidationInterceptor
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware

/**
 * Adds the interceptor that invalidates credentials after an expired token error.
 */
class CredentialInvalidationIntegration : SwiftIntegration {
    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware,
    ) {
        if (ctx.settings.internalClient) return
        operationMiddleware.appendMiddleware(operationShape, CredentialInvalidationInterceptor(ctx.model, ctx.symbolProvider))
    }
}
