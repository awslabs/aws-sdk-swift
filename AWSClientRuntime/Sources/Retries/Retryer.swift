//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime
        
public protocol Retryer {
    func acquireToken(partitionId: String) throws -> AWSRetryToken
    func scheduleRetry(token: AWSRetryToken, error: AWSRetryError) throws -> AWSRetryToken
    func recordSuccess(token: AWSRetryToken)
    func releaseToken(token: AWSRetryToken)
    func isErrorRetryable<E>(error: SdkError<E>) -> Bool
    func getErrorType<E>(error: SdkError<E>) -> AWSRetryError
}
