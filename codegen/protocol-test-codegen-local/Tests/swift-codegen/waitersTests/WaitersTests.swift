import XCTest
@testable import Waiters
@testable import ClientRuntime

class WaitersTests: XCTestCase {

    func test_successTrue_hasSuccessStateWaiter() async throws {
        let waiterConfig = try WaitersClient.successTrueMatcherWaiterConfig()
        let subject = waiterConfig.acceptors[0]
        XCTAssertEqual(subject.state, .success)
    }

    func test_successTrue_acceptorMatchesOnOutput() async throws {
        let output = GetWidgetOutputResponse(stringProperty: "def")
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
        let output = GetWidgetOutputResponse(stringProperty: "def")
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

    // MARK: - Helper methods

    private var anInput: GetWidgetInput { GetWidgetInput() }
}

// Convenience test-helper methods for testing acceptor matches

extension WaiterConfiguration.Acceptor.Match: Equatable where Input: Equatable, Output: Equatable {

    public static func == (
        lhs: ClientRuntime.WaiterConfiguration<Input, Output>.Acceptor.Match,
        rhs: ClientRuntime.WaiterConfiguration<Input, Output>.Acceptor.Match
    ) -> Bool {
        switch (lhs, rhs) {
        case (.success(let left), .success(let right)):
            return compare(left, right)
        case (.failure(let left), .failure(let right)):
            return compare(left, right)
        case (.retry, .retry):
            return true
        default:
            return false
        }
    }

    private static func compare(_ lhs: Result<Output, Error>, _ rhs: Result<Output, Error>) -> Bool {
        switch (lhs, rhs) {
        case (.success(let left), .success(let right)):
            return left == right
        case (.failure(let left), .failure(let right)):
            return left.localizedDescription == right.localizedDescription
        default:
            return false
        }
    }
}

// Allows for the use of a string as an Error, for easy test validation & easy-to-read tests.
extension String: Error {
    var localizedString: String? { self }
}
