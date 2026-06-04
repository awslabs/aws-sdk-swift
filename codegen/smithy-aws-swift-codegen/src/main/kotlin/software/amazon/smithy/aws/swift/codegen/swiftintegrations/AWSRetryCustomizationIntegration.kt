/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

package software.amazon.smithy.aws.swift.codegen.swiftintegrations

import software.amazon.smithy.aws.swift.codegen.sdkId
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.traits.LongPollTrait
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.middlewares.RetryMiddleware
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware

class AWSRetryCustomizationIntegration : SwiftIntegration {
    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware,
    ) {
        val sdkId = ctx.service.sdkId
        val isLongPolling = isLongPollingOperation(operationShape, sdkId)
        operationMiddleware.removeMiddleware(operationShape, "RetryMiddleware")
        operationMiddleware.appendMiddleware(
            operationShape,
            RetryMiddleware(
                ctx.model,
                ctx.symbolProvider,
                AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
                retryErrorInfoProviderExpressionFactory = { _ ->
                    "AWSClientRuntime.AWSRetryErrorInfoProvider.errorInfoProvider(sdkID: \"$sdkId\")"
                },
                longPollingBackoffExpression =
                    if (isLongPolling) {
                        "AWSClientRuntime.LongPollingBackoffProvider.backoffDelay(context:errorInfo:attemptCount:)"
                    } else {
                        null
                    },
                additionalImportSymbols =
                    if (isLongPolling) {
                        listOf(AWSClientRuntimeTypes.Core.LongPollingBackoffProvider)
                    } else {
                        emptyList()
                    },
            ),
        )
    }

    private fun isLongPollingOperation(
        operation: OperationShape,
        sdkId: String,
    ): Boolean {
        if (operation.hasTrait(LongPollTrait::class.java)) return true
        return hardcodedLongPollingOperations.contains(sdkId to operation.id.name)
    }

    companion object {
        // Hardcoded until aws-models annotate these operations with `aws.api#longPoll`.
        private val hardcodedLongPollingOperations =
            setOf(
                "SQS" to "ReceiveMessage",
                "SFN" to "GetActivityTask",
                "SWF" to "PollForActivityTask",
                "SWF" to "PollForDecisionTask",
            )
    }
}
