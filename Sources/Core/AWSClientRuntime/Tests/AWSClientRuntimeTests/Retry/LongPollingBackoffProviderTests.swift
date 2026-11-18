//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import Smithy
import SmithyRetriesAPI
import AWSClientRuntime

final class LongPollingBackoffProviderTests: XCTestCase {
    private let errorInfo = RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: false)

    // `AWS_NEW_RETRIES_2026` is no longer read, so long-polling backoff always applies.
    func test_backoffDelay_returnsDelayWithinTransientBounds() async throws {
        let result = await LongPollingBackoffProvider.backoffDelay(
            context: Context(attributes: Attributes()),
            errorInfo: errorInfo,
            attemptCount: 1
        )
        let delay = try XCTUnwrap(result)
        XCTAssertGreaterThanOrEqual(delay, 0.0)
        XCTAssertLessThanOrEqual(delay, 0.05)
    }
}
