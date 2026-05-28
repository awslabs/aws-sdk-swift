//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.TimeInterval
import class Smithy.Context
import struct SmithyRetries.ExponentialBackoffStrategy
import struct SmithyRetriesAPI.RetryErrorInfo

/// Backoff delay for long-polling operations when the retry token bucket is empty.
/// Codegen wires this provider only into operations bearing the `aws.api#longPoll`
/// trait, or in the hardcoded fallback list (see AWSRetryCustomizationIntegration).
/// Returns `nil` when `AWS_NEW_RETRIES_2026` is unset.
public enum LongPollingBackoffProvider {

    public static func backoffDelay(
        context: Context,
        errorInfo: RetryErrorInfo,
        attemptCount: Int
    ) async -> TimeInterval? {
        guard AWSRetryFeatures.isNewRetries2026Enabled else { return nil }
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
