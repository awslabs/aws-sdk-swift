//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public protocol Retryer {
    func acquireToken(partitionId: String) throws -> AWSRetryToken
    func scheduleRetry(token: AWSRetryToken, error: AWSRetryError) throws -> AWSRetryToken
    func recordSuccess(token: AWSRetryToken)
    func releaseToken(token: AWSRetryToken)
}
