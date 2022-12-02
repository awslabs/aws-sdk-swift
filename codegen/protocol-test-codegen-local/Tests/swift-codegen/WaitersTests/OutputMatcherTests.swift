//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import Waiters
@testable import ClientRuntime

class OutputMatcherTests: XCTestCase {

    // MARK: properties & stringEquals comparator

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

    // MARK: properties & booleanEquals comparator

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

    // MARK: properties & allStringEquals comparator

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

    // MARK: properties & anyStringEquals comparator

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

    func test_flattenLength_acceptorMatchesWhenFlattenedValueMatchesCount() async throws {
        let unexpected = "not the expected name"
        let output = outputTree(embeddedName: unexpected)
        let subject = try WaitersClient.flattenLengthMatcherWaiterConfig().acceptors[0]
        let match = subject.evaluate(input: anInput, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    // MARK: - Filter

    func test_filter_acceptorMatchesWhenFilterMatches() async throws {
        let output1 = outputTree()
        let subject = try WaitersClient.filterMatcherWaiterConfig().acceptors[0]
        let match1 = subject.evaluate(input: anInput, result: .success(output1))
        XCTAssertNil(match1)
        let output2 = outputTree(appendBonusKid: true)
        let match2 = subject.evaluate(input: anInput, result: .success(output2))
        XCTAssertEqual(match2, .success(.success(output2)))
    }

    // MARK: - Projections

    func test_projectedLength_acceptorMatchesWhenFlattenedValueMatchesCount() async throws {
        let output1 = outputTree()
        let subject = try WaitersClient.projectedLengthMatcherWaiterConfig().acceptors[0]
        let match1 = subject.evaluate(input: anInput, result: .success(output1))
        XCTAssertNil(match1)
        let output2 = outputTree(appendBonusKid: true)
        let match2 = subject.evaluate(input: anInput, result: .success(output2))
        XCTAssertEqual(match2, .success(.success(output2)))
    }

    // MARK: - Helper methods

    private func outputTree(globalName: String? = nil, embeddedName: String? = "c", appendBonusKid: Bool = false) -> GetWidgetOutputResponse {
        var grandchildren2: [WaitersClientTypes.Grandchild] = [
            .init(name: embeddedName ?? globalName, number: 1),
            .init(name: globalName ?? "d", number: 2)
        ]
        if appendBonusKid { grandchildren2.append(.init(name: "bonus kid", number: 7))}
        return GetWidgetOutputResponse(children: [
            .init(grandchildren: [
                .init(name: globalName ?? "a", number: 3),
                .init(name: globalName ?? "b", number: 4)
            ]),
            .init(grandchildren: grandchildren2),
            .init(grandchildren: [
                .init(name: globalName ?? "e", number: 5),
                .init(name: globalName ?? "f", number: 6)
            ])
        ])
    }
}
