//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import AwsCommonRuntimeKit
import ClientRuntime

public class AWSRetryStrategy {
    let crtRetryStrategy: CRTAWSRetryStrategy
    
    public init(options: AWSRetryOptions) throws {
        self.crtRetryStrategy = try CRTAWSRetryStrategy(options: options.toCRTType())
    }
    
    convenience init(clientEngine: CRTClientEngine) throws {
        let backOffOptions = AWSExponentialBackOffRetryOptions(client: clientEngine)
        let retryOptions = AWSRetryOptions(backOffRetryOptions: backOffOptions)
        try self.init(options: retryOptions)
    }
    
    public func acquireToken(partitionId: String) throws -> AWSRetryToken {
        let result = crtRetryStrategy.acquireToken(partitionId: partitionId)
        let token = try result.get()
        return AWSRetryToken(crtToken: token)
    }
    
    public func scheduleRetry(token: AWSRetryToken, error: AWSRetryError) throws -> AWSRetryToken {
        let result = crtRetryStrategy.scheduleRetry(token: token.crtToken, errorType: error.toCRTType())
        let token = try result.get()
        return AWSRetryToken(crtToken: token)
    }
    
    public func recordSuccess(token: AWSRetryToken) {
        crtRetryStrategy.recordSuccess(token: token.crtToken)
    }
    
    public func releaseToken(token: AWSRetryToken) {
        crtRetryStrategy.releaseToken(token: token.crtToken)
    }
}

