//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

struct AWSRetryFactory: RetryFactory {
    let retryOptions: RetryOptions

    init(retryOptions: RetryOptions) {
        self.retryOptions = retryOptions
    }

    func makeRetryStrategy() throws -> RetryStrategy {
        let retryStrategyOptions = RetryStrategyOptions(retryMode: retryOptions.retryMode, maxRetriesBase: retryOptions.maxAttempts)
        return try AWSRetryStrategy(retryStrategyOptions: retryStrategyOptions)
    }

    func makeRetryErrorClassifier() throws -> RetryErrorClassifying {
        AWSRetryErrorClassifier()
    }
}
