//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        

import AwsCommonRuntimeKit

public struct AWSRetryOptions {
    public let initialBucketCapacity: Int
    
    public let backOffRetryOptions: AWSExponentialBackOffRetryOptions
    
    public init(initialBucketCapacity: Int = 500,
                backOffRetryOptions: AWSExponentialBackOffRetryOptions) {
        self.initialBucketCapacity = initialBucketCapacity
        self.backOffRetryOptions = backOffRetryOptions
    }
}


extension AWSRetryOptions {
    func toCRTType() -> RetryOptions {
        return RetryOptions(initialBucketCapacity: initialBucketCapacity,
                            backOffRetryOptions: backOffRetryOptions.toCRTType())
    }
}

struct RetryOptions: CRTRetryOptions {
    var initialBucketCapacity: Int
    var backOffRetryOptions: CRTExponentialBackoffRetryOptions
    
    init(initialBucketCapacity: Int, backOffRetryOptions: CRTExponentialBackoffRetryOptions) {
        self.initialBucketCapacity = initialBucketCapacity
        self.backOffRetryOptions = backOffRetryOptions
    }
}
