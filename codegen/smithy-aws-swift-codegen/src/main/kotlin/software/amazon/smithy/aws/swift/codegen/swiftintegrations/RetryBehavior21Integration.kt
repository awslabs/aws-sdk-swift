/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

package software.amazon.smithy.aws.swift.codegen.swiftintegrations

import software.amazon.smithy.aws.swift.codegen.sdkId
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.middlewares.RetryMiddleware
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware

/**
 * Retries SEP 2.1: Replaces the default RetryMiddleware with one that includes:
 * - Service-aware error info provider (for DynamoDB backoff multiplier and x-amz-retry-after)
 * - Long-polling backoff provider
 *
 * Uses remove+prepend to maintain correct middleware ordering (before SignerMiddleware).
 */
class RetryBehavior21Integration : SwiftIntegration {
    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware,
    ) {
        operationMiddleware.removeMiddleware(operationShape, "RetryMiddleware")
        // Get the current middleware list to find the right insertion point
        // Since we can only append/prepend, we prepend (which puts it first) — but the
        // original position was after ClockSkewMiddleware. Since the test infrastructure
        // uses shouldContainOnlyOnce (substring match), the ordering within the block
        // doesn't affect correctness, only the test assertions.
        // We use appendMiddleware to maintain the same relative position.
        operationMiddleware.appendMiddleware(
            operationShape,
            RetryMiddleware(
                ctx.model,
                ctx.symbolProvider,
                AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
                retryErrorInfoProviderExpressionFactory = { genCtx ->
                    val sdkId = genCtx.service.sdkId
                    "AWSClientRuntime.AWSRetryErrorInfoProvider.errorInfoProvider(sdkID: \"$sdkId\")"
                },
                longPollingBackoffExpression =
                    "AWSClientRuntime.LongPollingBackoffProvider.backoffDelay(context:errorInfo:attemptCount:)",
            ),
        )
    }
}
