//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import Waiters
@testable import ClientRuntime

#if swift(>=5.7)

class ErrorTypeMatcherTests: XCTestCase {

    // expected errorType for these tests: "MyError"

    // MARK: - errorType matcher

    func test_errorType_matchesWhenErrorTypeMatchesAndErrorIsAWaiterTypedError() async throws {
        let error = WaiterTypedErrorImpl()
        let subject = try WaitersClient.errorTypeMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure(error))
        XCTAssertEqual(match, .success(.failure(error)))
    }

    func test_errorType_doesNotMatchWhenErrorTypeDoesNotMatchAndErrorIsAWaiterTypedError() async throws {
        let error = WaiterTypedErrorNoMatchImpl()
        let subject = try WaitersClient.errorTypeMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure(error))
        XCTAssertNil(match)
    }

    func test_errorType_doesNotMatchWhenErrorTypeMatchesButErrorIsNotAWaiterTypedError() async throws {
        let error = WaiterTypedErrorNoMatchImpl()
        let subject = try WaitersClient.errorTypeMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure(error))
        XCTAssertNil(match)
    }

    func test_errorType_doesNotMatchWhenResultIsSuccess() async throws {
        let response = GetWidgetOutputResponse()
        let subject = try WaitersClient.errorTypeMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(response))
        XCTAssertNil(match)
    }
}

// Error types used in tests above

private struct WaiterTypedErrorImpl: WaiterTypedError, Equatable {

    var waiterErrorType: String? { "MyError" }
}

private struct WaiterTypedErrorNoMatchImpl: WaiterTypedError, Equatable {

    var waiterErrorType: String? { "OtherError" }
}

private struct NotAWaiterTypedErrorImpl: Error, Equatable {  // An error but not a WaiterTypedError

    var waiterErrorType: String? { "MyError" }
}

#endif
