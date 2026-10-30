//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import Smithy
import SmithyRetries
import SmithyRetriesAPI
import AWSClientRuntime

final class LongPollingBackoffProviderTests: XCTestCase {
    private let errorInfo = RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: false)

    func test_backoffDelayProvider_returnsNilForLegacyOptions() async {
        let options = RetryStrategyOptions(backoffStrategy: ExponentialBackoffStrategy(), useNewRetries2026: false)
        let provider = LongPollingBackoffProvider.backoffDelayProvider(retryStrategyOptions: options)
        let delay = await provider(Context(attributes: Attributes()), errorInfo, 1)
        XCTAssertNil(delay)
    }

    func test_backoffDelayProvider_returnsDelayForNewRetriesOptions() async throws {
        let options = RetryStrategyOptions(backoffStrategy: ExponentialBackoffStrategy(), useNewRetries2026: true)
        let provider = LongPollingBackoffProvider.backoffDelayProvider(retryStrategyOptions: options)
        let result = await provider(Context(attributes: Attributes()), errorInfo, 1)
        let delay = try XCTUnwrap(result)
        XCTAssertGreaterThanOrEqual(delay, 0.0)
        XCTAssertLessThanOrEqual(delay, 0.05)
    }

    func test_backoffDelay_returnsDelay() async {
        let delay = await LongPollingBackoffProvider.backoffDelay(
            context: Context(attributes: Attributes()),
            errorInfo: errorInfo,
            attemptCount: 1
        )
        XCTAssertNotNil(delay)
    }
}
