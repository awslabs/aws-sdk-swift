//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

public struct AWSRetryOptions: RetryOptions {
    public let maxAttempts: Int
    public let retryMode: RetryMode

    public init(retryOptions: RetryOptions) {
        self.retryMode = retryOptions.retryMode
        self.maxAttempts = retryOptions.maxAttempts
    }

    public func makeRetryFactory() -> RetryFactory {
        AWSRetryFactory(retryOptions: self)
    }
}
