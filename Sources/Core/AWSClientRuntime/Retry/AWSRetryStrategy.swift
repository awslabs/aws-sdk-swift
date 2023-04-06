//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime
import AwsCommonRuntimeKit

class AWSRetryStrategy: ClientRuntime.RetryStrategy {
    let crtRetryStrategy: AwsCommonRuntimeKit.RetryStrategy
    private let sharedDefaultIO = SDKDefaultIO.shared

    public required init(retryStrategyOptions: RetryStrategyOptions = RetryStrategyOptions()) throws {
        self.crtRetryStrategy = try AwsCommonRuntimeKit.RetryStrategy(
            retryStrategyOptions: retryStrategyOptions,
            eventLoopGroup: sharedDefaultIO.eventLoopGroup
        )
    }

    public func acquireInitialRetryToken(tokenScope: String) async throws -> ClientRuntime.RetryToken {
        let token = try await crtRetryStrategy.acquireToken(partitionId: tokenScope)
        return RetryToken(crtToken: token)
    }

    public func refreshRetryTokenForRetry(
        tokenToRenew: ClientRuntime.RetryToken,
        errorInfo: RetryErrorInfo
    ) async throws -> ClientRuntime.RetryToken {
        let token = try await crtRetryStrategy.scheduleRetry(
            token: tokenToRenew.crtToken,
            errorType: errorInfo.errorType.toCRTType()
        )
        return RetryToken(crtToken: token)
    }

    public func recordSuccess(token: ClientRuntime.RetryToken) {
        crtRetryStrategy.recordSuccess(token: token.crtToken)
    }
}

extension AwsCommonRuntimeKit.RetryStrategy {

    convenience init(retryStrategyOptions: RetryStrategyOptions, eventLoopGroup: EventLoopGroup) throws {
       try self.init(
            eventLoopGroup: eventLoopGroup,
            initialBucketCapacity: 500,
            maxRetries: retryStrategyOptions.maxRetriesBase,
            backOffScaleFactor: 0.025,
            jitterMode: AwsCommonRuntimeKit.ExponentialBackoffJitterMode.default,
            generateRandom: nil // we should pass in the options.generateRandom but currently
                                // it fails since the underlying closure is a c closure
        )
    }
}
