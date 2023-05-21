//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import Waiters
@testable import ClientRuntime

class ErrorTypeMatcherTests: XCTestCase {

    // expected errorType for these tests: "MyError"

    // MARK: - errorType matcher

    func test_errorType_matchesWhenErrorTypeMatchesAndErrorIsAServiceError() async throws {
        let error = ServiceErrorThatMatches()
        let subject = try WaitersClient.errorTypeMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure(error))
        XCTAssertEqual(match, .success(.failure(error)))
    }

    func test_errorType_doesNotMatchWhenErrorTypeDoesNotMatchAndErrorIsAServiceError() async throws {
        let error = ServiceErrorThatDoesntMatch()
        let subject = try WaitersClient.errorTypeMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure(error))
        XCTAssertNil(match)
    }

    func test_errorType_doesNotMatchWhenErrorTypeMatchesButErrorIsNotAServiceError() async throws {
        let error = NotAServiceError()
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

private struct ServiceErrorThatMatches: ServiceError {
    var _errorType: String? { "MyError" }
    var _retryable: Bool { false }
    var _isThrottling: Bool { false }
}

private struct ServiceErrorThatDoesntMatch: ServiceError {
    var _errorType: String? { "OtherError" }
    var _retryable: Bool { false }
    var _isThrottling: Bool { false }
}

private struct NotAServiceError: Error {  // An error but not a ServiceError
    var _errorType: String? { "MyError" }
}

