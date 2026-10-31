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
import struct SmithyRetriesAPI.RetryStrategyOptions

/// Backoff delay for long-polling operations when the retry token bucket is empty.
/// Codegen wires this provider only into operations bearing the `aws.api#longPoll`
/// trait, or in the hardcoded fallback list (see AWSRetryCustomizationIntegration).
/// Long-polling backoff is part of Retry Behavior 2.1, so the `legacy` retry mode gets none.
public enum LongPollingBackoffProvider {

    /// Returns a long-polling backoff provider that follows the passed retry strategy options.
    ///
    /// The provider returns `nil` when `retryStrategyOptions.useNewRetries2026` is `false`
    /// (the `legacy` retry mode).
    public static func backoffDelayProvider(
        retryStrategyOptions: RetryStrategyOptions
    ) -> (Context, RetryErrorInfo, Int) async -> TimeInterval? {
        let useNewRetries = retryStrategyOptions.useNewRetries2026
        return { context, errorInfo, attemptCount in
            guard useNewRetries else { return nil }
            return await backoffDelay(context: context, errorInfo: errorInfo, attemptCount: attemptCount)
        }
    }

    /// Computes the Retry Behavior 2.1 long-polling backoff delay.
    ///
    /// This assumes a non-legacy retry mode.  Use `backoffDelayProvider(retryStrategyOptions:)`
    /// to follow the client's retry strategy options.
    public static func backoffDelay(
        context: Context,
        errorInfo: RetryErrorInfo,
        attemptCount: Int
    ) async -> TimeInterval? {
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
