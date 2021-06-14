//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import ClientRuntime
import AwsCommonRuntimeKit

public struct AWSExponentialBackOffRetryOptions {
    let client: CRTClientEngine
    let maxRetries: Int
    let backOffScaleFactor: UInt32
    let jitterMode: AWSExponentialBackOffJitterMode
    let generateRandom: (() -> UInt64)?
    
    public init(client: CRTClientEngine,
                maxRetries: Int = 10,
                backOffScaleFactor: UInt32 = 25,
                jitterMode: AWSExponentialBackOffJitterMode = .default,
                generateRandom: (() -> UInt64)? = nil) {
        self.client = client
        self.maxRetries = maxRetries
        self.backOffScaleFactor = backOffScaleFactor
        self.jitterMode = jitterMode
        self.generateRandom = generateRandom
    }
}

extension AWSExponentialBackOffRetryOptions {
    func toCRTType() -> CRTExponentialBackoffRetryOptions {
        return CRTExponentialBackoffRetryOptions(eventLoopGroup: client.eventLoopGroup,
                                                 maxRetries: maxRetries,
                                                 backOffScaleFactor: backOffScaleFactor,
                                                 jitterMode: jitterMode.toCRTType(),
                                                 generateRandom: generateRandom)
    }
}
