//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.TimeInterval
import class Smithy.Context
import SmithyHTTPAPI
import struct SmithyRetriesAPI.RetryErrorInfo
import struct SmithyRetries.ExponentialBackoffStrategy

/// Provides long-polling backoff for operations that should
/// back off even when the retry token bucket is empty.
public enum LongPollingBackoffProvider {

    /// Returns a backoff delay for long-polling operations when the token bucket is empty.
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
        // Compute the base multiplier based on error type
        let multiplier: TimeInterval
        if errorInfo.errorType == .throttling {
            multiplier = 1.0
        } else {
            multiplier = errorInfo.backoffMultiplier ?? 0.05
        }
        let strategy = ExponentialBackoffStrategy()
        // attemptCount is 1-based, backoff attempt is 0-based
        return strategy.computeNextBackoffDelay(attempt: max(0, attemptCount - 1), baseMultiplier: multiplier)
    }
}
