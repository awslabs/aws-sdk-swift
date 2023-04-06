//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

struct AWSRetryErrorClassifier: RetryErrorClassifying {

    func retryErrorInfo<T: ServiceErrorProviding>(error: SdkError<T>) -> RetryErrorInfo? {
        // TODO: fill in & test
        return nil
    }
}
