//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import Foundation
import Smithy
import SmithyHTTPAPI
@_spi(SmithyTimestamps) import SmithyTimestamps
@testable import SmithyRetries
import SmithyRetriesAPI
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

/// Reproduces the test cases in Appendix A of the "Retry Information Header" SEP.
///
/// In every case the client's read timeout is 10 seconds.
final class AmzSdkRequestMiddlewareTests: XCTestCase {

    // MARK: - SEP Appendix A

    // One SDK operation invocation, success on the 3rd attempt.
    // Fast network, no clock skew, 1 second between attempts.
    func test_sep_retriesWithNoSkew() async throws {
        let harness = Harness()
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:00Z", expectedHeader: "attempt=1; max=3",
                 status: 500, received: "2019-06-01T00:00:00Z", date: "Sat, 01 Jun 2019 00:00:00 GMT"),
            Step(time: "2019-06-01T00:00:01Z", expectedHeader: "ttl=20190601T000011Z; attempt=2; max=3",
                 status: 500, received: "2019-06-01T00:00:01Z", date: "Sat, 01 Jun 2019 00:00:01 GMT"),
            Step(time: "2019-06-01T00:00:02Z", expectedHeader: "ttl=20190601T000012Z; attempt=3; max=3",
                 status: 200, received: "2019-06-01T00:00:02Z", date: "Sat, 01 Jun 2019 00:00:02 GMT"),
        ])
    }

    // Three separate SDK operation invocations, each succeeding on the 1st attempt.
    // The skew measured by one invocation is used for the ttl of the next.
    //
    // The SEP lists the second request's time as 00:01:01, but its expected ttl (00:00:11) and its
    // response time (00:00:01) show that 00:00:01 is intended.
    func test_sep_separateInvocationsShareSkew() async throws {
        let harness = Harness()
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:00Z", expectedHeader: "attempt=1; max=3",
                 status: 200, received: "2019-06-01T00:00:00Z", date: "Sat, 01 Jun 2019 00:00:00 GMT"),
        ])
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:01Z", expectedHeader: "ttl=20190601T000011Z; attempt=1; max=3",
                 status: 200, received: "2019-06-01T00:00:01Z", date: "Sat, 01 Jun 2019 00:00:01 GMT"),
        ])
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:02Z", expectedHeader: "ttl=20190601T000012Z; attempt=1; max=3",
                 status: 200, received: "2019-06-01T00:00:02Z", date: "Sat, 01 Jun 2019 00:00:02 GMT"),
        ])
    }

    // One SDK operation invocation, success on the 3rd attempt.
    // Slow network (2 seconds each way), server takes 1 second, client clock 10 minutes behind the server.
    func test_sep_retriesWithSkewAndLatency() async throws {
        let harness = Harness()
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:00Z", expectedHeader: "attempt=1; max=3",
                 status: 500, received: "2019-06-01T00:00:05Z", date: "Sat, 01 Jun 2019 00:10:03 GMT"),
            // skew = 00:10:03 - 00:00:05 = 9:58; ttl = 00:00:06 + 10s + 9:58 = 00:10:14
            Step(time: "2019-06-01T00:00:06Z", expectedHeader: "ttl=20190601T001014Z; attempt=2; max=3",
                 status: 500, received: "2019-06-01T00:00:11Z", date: "Sat, 01 Jun 2019 00:10:09 GMT"),
            // skew = 00:10:09 - 00:00:11 = 9:58; ttl = 00:00:12 + 10s + 9:58 = 00:10:20
            Step(time: "2019-06-01T00:00:12Z", expectedHeader: "ttl=20190601T001020Z; attempt=3; max=3",
                 status: 200, received: "2019-06-01T00:00:17Z", date: "Sat, 01 Jun 2019 00:10:15 GMT"),
        ])
    }

    // MARK: - Omitting ttl

    func test_ttlIsOmittedForStreamingOperations() async throws {
        let harness = Harness(isStreaming: true)
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:00Z", expectedHeader: "attempt=1; max=3",
                 status: 500, received: "2019-06-01T00:00:00Z", date: "Sat, 01 Jun 2019 00:00:00 GMT"),
            Step(time: "2019-06-01T00:00:01Z", expectedHeader: "attempt=2; max=3",
                 status: 200, received: "2019-06-01T00:00:01Z", date: "Sat, 01 Jun 2019 00:00:01 GMT"),
        ])
    }

    func test_ttlIsOmittedWhenResponseHasNoDateHeader() async throws {
        let harness = Harness()
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:00Z", expectedHeader: "attempt=1; max=3",
                 status: 500, received: "2019-06-01T00:00:00Z", date: nil),
            Step(time: "2019-06-01T00:00:01Z", expectedHeader: "attempt=2; max=3",
                 status: 200, received: "2019-06-01T00:00:01Z", date: "not a date"),
        ])
    }

    func test_ttlIsOmittedWhenSocketTimeoutIsUnknown() async throws {
        let harness = Harness(socketTimeout: nil)
        try await harness.invoke(steps: [
            Step(time: "2019-06-01T00:00:00Z", expectedHeader: "attempt=1; max=3",
                 status: 500, received: "2019-06-01T00:00:00Z", date: "Sat, 01 Jun 2019 00:00:00 GMT"),
            Step(time: "2019-06-01T00:00:01Z", expectedHeader: "attempt=2; max=3",
                 status: 200, received: "2019-06-01T00:00:01Z", date: "Sat, 01 Jun 2019 00:00:01 GMT"),
        ])
    }

    // MARK: - awsGetTTL

    func test_getTTL() throws {
        let now = try XCTUnwrap(TimestampFormatter(format: .httpDate).date(from: "Mon, 15 Jul 2024 01:24:12 GMT"))
        // 2039.34 + 60.0 seconds is 34 minutes 59 seconds, rounded down to the second.
        let ttl = awsGetTTL(now: now, estimatedSkew: 2039.34, socketTimeout: 60.0)
        XCTAssertEqual(ttl, "20240715T015911Z")
    }
}

// MARK: - Test harness

private struct Step {
    /// The client's clock when the request is created.
    let time: String
    /// The expected value of the `amz-sdk-request` header.
    let expectedHeader: String
    /// The HTTP status of the response.  Responses other than 200 are retried.
    let status: Int
    /// The client's clock when the response is received.
    let received: String
    /// The value of the response's `Date` header, or `nil` for no header.
    let date: String?
    let file: StaticString
    let line: UInt

    init(
        time: String, expectedHeader: String, status: Int, received: String, date: String?,
        file: StaticString = #filePath, line: UInt = #line
    ) {
        self.time = time
        self.expectedHeader = expectedHeader
        self.status = status
        self.received = received
        self.date = date
        self.file = file
        self.line = line
    }
}

/// A clock that the test controls.
private final class TestClock: @unchecked Sendable {
    private let lock = NSLock()
    private var _now = Date(timeIntervalSince1970: 0.0)

    var now: Date {
        get { lock.withLock { _now } }
        set { lock.withLock { _now = newValue } }
    }

    func set(_ iso8601: String) {
        now = TimestampFormatter(format: .dateTime).date(from: iso8601)!
    }
}

/// Runs operation invocations that share one estimated skew store and one clock, like separate
/// operations on one client.
private final class Harness {
    let skewStore = EstimatedSkewStore()
    let clock = TestClock()
    let isStreaming: Bool
    let socketTimeout: TimeInterval?

    init(isStreaming: Bool = false, socketTimeout: TimeInterval? = 10.0) {
        self.isStreaming = isStreaming
        self.socketTimeout = socketTimeout
    }

    func invoke(steps: [Step]) async throws {
        let context = Context(attributes: Attributes())
        context.partitionID = "partition"
        if let socketTimeout { context.socketTimeout = socketTimeout }

        let options = RetryStrategyOptions(backoffStrategy: ExponentialBackoffStrategy(), maxRetriesBase: 2)
        var strategy = DefaultRetryStrategy(options: options)
        strategy.sleeper = { @Sendable (_: TimeInterval) in }

        let executeRequest = StepExecutor(steps: steps, clock: clock)
        let clock = self.clock
        let builder: OrchestratorBuilder<TestInput, TestOutput, HTTPRequest, HTTPResponse> =
            TestOrchestrator.httpBuilder()
                .attributes(context)
                .retryErrorInfoProvider(DefaultRetryErrorInfoProvider.errorInfo(for:))
                .retryStrategy(strategy)
                .deserialize { response, _ in
                    guard response.statusCode == .ok else { throw StepError(httpResponse: response) }
                    return TestOutput()
                }
                .executeRequest(executeRequest)
        // Sets the clock to the step's request time.  Added first so it runs before AmzSdkRequestMiddleware.
        builder.interceptors.add(RequestClockInterceptor(steps: steps, clock: clock))
        builder.interceptors.add(
            AmzSdkRequestMiddleware<TestInput, TestOutput>(
                maxRetries: 2, isStreaming: isStreaming, skewStore: skewStore, now: { clock.now }
            )
        )

        do {
            _ = try await builder.build().execute(input: TestInput())
        } catch is StepError {
            // The last step was an error response.
        }
        XCTAssertEqual(executeRequest.index, steps.count, "Not all steps were run")
    }
}

private final class RequestClockInterceptor: Interceptor {
    typealias InputType = TestInput
    typealias OutputType = TestOutput
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    let steps: [Step]
    let clock: TestClock
    var index = 0

    init(steps: [Step], clock: TestClock) {
        self.steps = steps
        self.clock = clock
    }

    func modifyBeforeSigning(context: some MutableRequest<TestInput, HTTPRequest>) async throws {
        clock.set(steps[index].time)
        index += 1
    }
}

private final class StepExecutor: ExecuteRequest {
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    let steps: [Step]
    let clock: TestClock
    var index = 0

    init(steps: [Step], clock: TestClock) {
        self.steps = steps
        self.clock = clock
    }

    func execute(request: HTTPRequest, attributes: Context) async throws -> HTTPResponse {
        let step = steps[index]
        index += 1
        XCTAssertEqual(
            request.headers.value(for: "amz-sdk-request"), step.expectedHeader, file: step.file, line: step.line
        )
        clock.set(step.received)
        var headers = Headers()
        if let date = step.date { headers.add(name: "Date", value: date) }
        return HTTPResponse(headers: headers, statusCode: HTTPStatusCode(rawValue: step.status)!)
    }
}

private struct StepError: HTTPError, Error {
    var httpResponse: HTTPResponse
}

private struct TestInput {}

private struct TestOutput {}
