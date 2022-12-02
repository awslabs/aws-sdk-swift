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

    // MARK: - errorType matcher

    func test_errorType_neverMatchesUntilImplemented() async throws {
        let subject = try WaitersClient.errorTypeMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure("MyError"))
        XCTAssertNil(match)
    }

}
