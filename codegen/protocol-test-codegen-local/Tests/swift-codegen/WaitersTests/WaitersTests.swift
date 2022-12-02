//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import Waiters
@testable import ClientRuntime

class WaitersTests: XCTestCase {

    // MARK: - success matcher

    func test_successTrue_hasSuccessStateWaiter() async throws {
        let waiterConfig = try WaitersClient.successTrueMatcherWaiterConfig()
        let subject = waiterConfig.acceptors[0]
        XCTAssertEqual(subject.state, .success)
    }

    func test_successTrue_acceptorMatchesOnOutput() async throws {
        let output = GetWidgetOutputResponse()
        let subject = try WaitersClient.successTrueMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_successTrue_acceptorFailsToMatchOnError() async throws {
        let subject = try WaitersClient.successTrueMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure("boom"))
        XCTAssertNil(match)
    }

    func test_successFalse_acceptorFailsToMatchOnOutput() async throws {
        let output = GetWidgetOutputResponse()
        let subject = try WaitersClient.successFalseMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_successFalse_acceptorMatchesOnError() async throws {
        let error = "boom"
        let subject = try WaitersClient.successFalseMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .failure(error))
        XCTAssertEqual(match, .success(.failure(error)))
    }

    // MARK: - errorType matcher

    // none yet, will fill this when errorType is properly implemented

    // MARK: - output matcher

    func test_outputStringProperty_acceptorMatchesOnPropertyMatch() async throws {
        let output = GetWidgetOutputResponse(stringProperty: "payload property contents")
        let subject = try WaitersClient.outputStringPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_outputStringProperty_acceptorFailsToMatchOnPropertyMismatch() async throws {
        let output = GetWidgetOutputResponse(stringProperty: "not the payload property contents")
        let subject = try WaitersClient.outputStringPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_outputStringProperty_acceptorFailsToMatchOnNullProperty() async throws {
        let output = GetWidgetOutputResponse(stringProperty: nil)
        let subject = try WaitersClient.outputStringPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_outputBooleanProperty_acceptorMatchesOnPropertyMatch() async throws {
        let output = GetWidgetOutputResponse(booleanProperty: false)
        let subject = try WaitersClient.outputBooleanPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_outputBooleanProperty_acceptorFailsToMatchOnPropertyMismatch() async throws {
        let output = GetWidgetOutputResponse(booleanProperty: true)
        let subject = try WaitersClient.outputBooleanPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_outputBooleanProperty_acceptorFailsToMatchOnNullProperty() async throws {
        let output = GetWidgetOutputResponse(booleanProperty: nil)
        let subject = try WaitersClient.outputBooleanPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_arrayPropertyAll_acceptorMatchesWhenArrayElementsAllMatch() async throws {
        let expected = "payload property contents"
        let output = GetWidgetOutputResponse(stringArrayProperty: [expected, expected, expected])
        let subject = try WaitersClient.outputStringArrayAllPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_arrayPropertyAll_acceptorFailsToMatchWhenArrayElementsDontMatch() async throws {
        let expected = "payload property contents"
        let output = GetWidgetOutputResponse(stringArrayProperty: [expected, expected, "unexpected"])
        let subject = try WaitersClient.outputStringArrayAllPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_arrayPropertyAll_acceptorFailsToMatchWhenArrayIsEmpty() async throws {
        let output = GetWidgetOutputResponse(stringArrayProperty: [])
        let subject = try WaitersClient.outputStringArrayAllPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_arrayPropertyAll_acceptorFailsToMatchWhenArrayIsNull() async throws {
        let output = GetWidgetOutputResponse(stringArrayProperty: nil)
        let subject = try WaitersClient.outputStringArrayAllPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_arrayPropertyAny_acceptorMatchesWhenArrayElementsAllMatch() async throws {
        let expected = "payload property contents"
        let output = GetWidgetOutputResponse(stringArrayProperty: [expected, expected, expected])
        let subject = try WaitersClient.outputStringArrayAnyPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_arrayPropertyAny_acceptorMatchesWhenAllButOneElementMismatches() async throws {
        let expected = "payload property contents"
        let output = GetWidgetOutputResponse(stringArrayProperty: [expected, expected, "unexpected"])
        let subject = try WaitersClient.outputStringArrayAnyPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_arrayPropertyAny_acceptorFailsToMatchWhenAllElementsMismatch() async throws {
        let unexpected = "unexpected"
        let output = GetWidgetOutputResponse(stringArrayProperty: [unexpected, unexpected, unexpected])
        let subject = try WaitersClient.outputStringArrayAnyPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_arrayPropertyAny_acceptorFailsToMatchWhenArrayIsEmpty() async throws {
        let output = GetWidgetOutputResponse(stringArrayProperty: [])
        let subject = try WaitersClient.outputStringArrayAnyPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_arrayPropertyAny_acceptorFailsToMatchWhenArrayIsNull() async throws {
        let output = GetWidgetOutputResponse(stringArrayProperty: nil)
        let subject = try WaitersClient.outputStringArrayAnyPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    // MARK: - inputOutput matcher

    func test_inputOutput_acceptorMatchesWhenInputAndOutputPropertiesMatch() async throws {
        let value = UUID().uuidString
        let input = GetWidgetInput(stringProperty: value)
        let output = GetWidgetOutputResponse(stringProperty: value)
        let subject = try WaitersClient.inputOutputPropertyMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: input, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    // MARK: - Flatten operator

    func test_flatten_acceptorMatchesWhenFlattenedValueMatches() async throws {
        let expected = "expected name"
        let output = outputTree(embeddedName: expected)
        let subject = try WaitersClient.flattenMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_flatten_acceptorDoesNotMatchWhenNoFlattenedValueMatches() async throws {
        let unexpected = "not the expected name"
        let output = outputTree(embeddedName: unexpected)
        let subject = try WaitersClient.flattenMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertNil(match)
    }

    func test_flattenLength1_acceptorMatchesWhenFlattenedValueMatchesCount() async throws {
        let unexpected = "not the expected name"
        let output = outputTree(embeddedName: unexpected)
        let subject = try WaitersClient.flattenLengthMatcher1WaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_flattenLength2_acceptorMatchesWhenFlattenedValueMatchesCount() async throws {
        let unexpected = "not the expected name"
        let output = outputTree(embeddedName: unexpected)
        let subject = try WaitersClient.flattenLengthMatcher2WaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    // MARK: - Helper methods

    private var anInput: GetWidgetInput { GetWidgetInput() }

    private func outputTree(globalName: String? = nil, embeddedName: String? = "c") -> GetWidgetOutputResponse {
        GetWidgetOutputResponse(children: [
            .init(grandchildren: [
                .init(name: globalName ?? "a"),
                .init(name: globalName ?? "b")
            ]),
            .init(grandchildren: [
                .init(name: embeddedName ?? globalName),
                .init(name: globalName ?? "d")
            ]),
            .init(grandchildren: [
                .init(name: globalName ?? "e"),
                .init(name: globalName ?? "f")
            ])
        ])
    }
}
