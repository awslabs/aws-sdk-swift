//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

/// The AWS-specific implementation of `RetryErrorClassifier`.
public struct AWSRetryErrorClassifier: RetryErrorClassifier {

    public init() {}

    public func retryErrorInfo<T: ServiceErrorProviding>(error: SdkError<T>) -> RetryErrorInfo? {
        // TODO: fill in & test
        return nil
    }
}
