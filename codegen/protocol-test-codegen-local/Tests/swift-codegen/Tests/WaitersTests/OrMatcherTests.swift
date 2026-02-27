//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import XCTest
@testable import Waiters
@testable import SmithyWaitersAPI

class OrMatcherTests: XCTestCase {

    // MARK: - OR expression with boolean and string comparison

    // JMESPath expression: "booleanProperty || stringProperty == 'match'"
    // JMESPath comparator: "booleanEquals"
    // JMESPath expected value: "true"

    func test_orBoolean_acceptorMatchesWhenBooleanIsTrue() async throws {
        let output = GetWidgetOutput(booleanProperty: true, stringProperty: "no match")
        let subject = try WaitersClient.orBooleanMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_orBoolean_acceptorMatchesWhenStringMatches() async throws {
        let output = GetWidgetOutput(booleanProperty: false, stringProperty: "match")
        let subject = try WaitersClient.orBooleanMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_orBoolean_acceptorMatchesWhenBothConditionsAreTrue() async throws {
        let output = GetWidgetOutput(booleanProperty: true, stringProperty: "match")
        let subject = try WaitersClient.orBooleanMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_orBoolean_acceptorDoesNotMatchWhenBothConditionsAreFalse() async throws {
        let output = GetWidgetOutput(booleanProperty: false, stringProperty: "no match")
        let subject = try WaitersClient.orBooleanMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_orBoolean_acceptorDoesNotMatchWhenBothPropertiesAreNil() async throws {
        let output = GetWidgetOutput(booleanProperty: nil, stringProperty: nil)
        let subject = try WaitersClient.orBooleanMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }
}
