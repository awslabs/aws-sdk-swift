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
 * Replaces the default RetryMiddleware with one that includes:
 * - Service-aware error info provider (for DynamoDB backoff multiplier and x-amz-retry-after)
 * - Long-polling backoff provider
 */
class AWSRetryCustomizationIntegration : SwiftIntegration {
    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware,
    ) {
        operationMiddleware.removeMiddleware(operationShape, "RetryMiddleware")
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
                additionalImportSymbols = listOf(
                    AWSClientRuntimeTypes.Core.LongPollingBackoffProvider,
                ),
            ),
        )
    }
}
