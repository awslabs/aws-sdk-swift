import XCTest
@testable import waiters
@testable import ClientRuntime

class WaitersTests: XCTestCase {

    func test_existsWaiter_hasSuccessWaiterAtPosition0() async throws {
        let waiterConfig = try WaitersClient.existsWaiterConfig()
        let subject = waiterConfig.acceptors[0]
        XCTAssertEqual(subject.state, .success)
    }

    func test_existsWaiter_waiterAtPosition0MatchesOnOutput() async throws {
        let input = GetWidgetInput(payload: "abc")
        let output = GetWidgetOutputResponse(payload: "def")
        let waiterConfig = try WaitersClient.existsWaiterConfig()
        let subject = waiterConfig.acceptors[0]
        let match = subject.evaluate(input: input, result: .success(output))
        XCTAssertEqual(match, .success(.success(output)))
    }

    func test_existsWaiter_waiterAtPosition0FailsToMatchOnError() async throws {
        let input = GetWidgetInput(payload: "abc")
        let waiterConfig = try WaitersClient.existsWaiterConfig()
        let subject = waiterConfig.acceptors[0]
        let match = subject.evaluate(input: input, result: .failure("boom"))
        XCTAssertNil(match)
    }
}

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

extension String: Error {
    var localizedString: String? { self }
}
