//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.TimeInterval
import class Smithy.Context
import SmithyHTTPAPI
import struct SmithyRetries.ExponentialBackoffStrategy
import struct SmithyRetriesAPI.RetryErrorInfo

/// Returns a backoff delay even when the retry token bucket is empty,
/// so long-polling operations can keep retrying past quota exhaustion.
public enum LongPollingBackoffProvider {

    public static func backoffDelay(
        context: Context,
        errorInfo: RetryErrorInfo,
        attemptCount: Int
    ) async -> TimeInterval? {
        let serviceName = context.getServiceName()
        let operationName = context.getOperation() ?? ""
        guard LongPollingOperations.isLongPolling(serviceName: serviceName, operationName: operationName) else {
            return nil
        }
        let multiplier: TimeInterval
        if errorInfo.errorType == .throttling {
            multiplier = 1.0
        } else {
            multiplier = errorInfo.backoffMultiplier ?? 0.05
        }
        let strategy = ExponentialBackoffStrategy()
        // attemptCount is 1-based; backoff attempt is 0-based.
        return strategy.computeNextBackoffDelay(attempt: max(0, attemptCount - 1), baseMultiplier: multiplier)
    }
}
