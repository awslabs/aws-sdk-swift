//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import struct Foundation.Data
import struct Foundation.Date
import class Foundation.Bundle
import class Foundation.JSONDecoder
import class Foundation.NSLock
import struct Foundation.TimeInterval
import struct Smithy.Attributes
import struct SmithyIdentity.AWSCredentialIdentity
import protocol SmithyIdentity.AWSCredentialIdentityResolver
@testable import AWSSDKIdentity

// These tests run the SEP test cases in Resources/credential-refresh-tests.json against CredentialsCache.

private struct SEPCase: Decodable {
    let documentation: String
    let given: Given
    let steps: [Step]
}

private struct Given: Decodable {
    let cachedCredentials: String
    let accessKeyId: String?
    let refreshBackoffSeconds: TimeInterval?
    let configuredAdvisoryWindowSeconds: TimeInterval?
}

private struct Step: Decodable {
    let type: String
    let response: String?
    let lifetimeSeconds: TimeInterval?
    let documentation: String?
    let expected: Expected?
    let rejectedAccessKeyId: String?
    let seconds: TimeInterval?
}

private struct Expected: Decodable {
    let result: String
    let sourceContacted: Bool
    let rateLimited: Bool
    let advisoryWindowSeconds: TimeInterval?
}

private struct Failure: Error, CustomStringConvertible {
    let description: String
    init(_ description: String) { self.description = description }
}

// seedLifetime is the lifetime of the seeded credentials; it gets a 15 minute advisory window and a 1 minute mandatory window.
private let seedLifetime: TimeInterval = 3600
private let seedAdvisoryWindow: TimeInterval = 900
private let seedMandatoryWindow: TimeInterval = 60

// MockCredentialClock is a clock the test moves by hand, so the refresh windows are reached without sleeping.
private final class MockCredentialClock: @unchecked Sendable {
    private let lock = NSLock()
    private var current: Date

    init(_ start: Date = Date(timeIntervalSince1970: 1_700_000_000)) {
        self.current = start
    }

    func now() -> Date {
        lock.lock()
        defer { lock.unlock() }
        return current
    }

    func advance(by seconds: TimeInterval) {
        lock.lock()
        defer { lock.unlock() }
        current = current.addingTimeInterval(seconds)
    }
}

// MockCredentialSource returns the response set for the current step and counts its calls.
private actor MockCredentialSource: AWSCredentialIdentityResolver {
    enum Outcome {
        case fresh(lifetime: TimeInterval?)
        case stale
        case failure
        case nonRecoverable
    }

    struct SourceFailure: Error {}

    private let clock: MockCredentialClock
    private var outcome: Outcome
    private(set) var callCount = 0
    private var issued = 0

    init(clock: MockCredentialClock, outcome: Outcome = .fresh(lifetime: 3600)) {
        self.clock = clock
        self.outcome = outcome
    }

    func setOutcome(_ outcome: Outcome) { self.outcome = outcome }

    // setIssuedCount sets the access key counter so the seeded cache holds the key a case names.
    func setIssuedCount(_ count: Int) { issued = count }

    // resetCallCount clears the calls made while seeding, so sourceContacted only counts the steps.
    func resetCallCount() { callCount = 0 }

    func calls() -> Int { callCount }

    func getIdentity(identityProperties: Attributes? = nil) async throws -> AWSCredentialIdentity {
        callCount += 1
        switch outcome {
        case .fresh(let lifetime):
            issued += 1
            return AWSCredentialIdentity(
                accessKey: "AKID-\(issued)",
                secret: "secret-\(issued)",
                expiration: lifetime.map { clock.now().addingTimeInterval($0) }
            )
        case .stale:
            issued += 1
            return AWSCredentialIdentity(
                accessKey: "AKID-\(issued)",
                secret: "secret-\(issued)",
                expiration: clock.now().addingTimeInterval(-1)
            )
        case .failure:
            throw SourceFailure()
        case .nonRecoverable:
            throw NonRecoverableCredentialError(
                underlying: SourceFailure(),
                actionableMessage: "run `aws sso login`"
            )
        }
    }
}


// GatedCredentialSource returns new credentials on each call, and holds calls open while it's closed.
private actor GatedCredentialSource: AWSCredentialIdentityResolver {
    private let clock: MockCredentialClock
    private var issued = 0
    private var isClosed = false
    private var waiters: [CheckedContinuation<Void, Never>] = []
    private(set) var calls = 0

    init(clock: MockCredentialClock) {
        self.clock = clock
    }

    func close() { isClosed = true }

    func open() {
        isClosed = false
        waiters.forEach { $0.resume() }
        waiters = []
    }

    func getIdentity(identityProperties: Attributes? = nil) async throws -> AWSCredentialIdentity {
        calls += 1
        if isClosed { await withCheckedContinuation { waiters.append($0) } }
        issued += 1
        return AWSCredentialIdentity(
            accessKey: "AKID-\(issued)",
            secret: "secret-\(issued)",
            expiration: clock.now().addingTimeInterval(seedLifetime)
        )
    }
}

class CredentialRefreshSEPTests: XCTestCase {

    // testConcurrentAdvisoryRefresh is the SEP's concurrency test 1: one refresh, and other callers get the cached credentials without waiting.
    func testConcurrentAdvisoryRefresh() async throws {
        let clock = MockCredentialClock()
        let source = GatedCredentialSource(clock: clock)
        let subject = CredentialsCache(source: source, now: { clock.now() })
        let seeded = try await subject.getIdentity(identityProperties: nil)
        clock.advance(by: seedLifetime - seedAdvisoryWindow)
        await source.close()

        let first = Task { try await subject.getIdentity(identityProperties: nil) }
        while await source.calls < 2 { await Task.yield() }
        for _ in 0..<9 {
            let other = try await subject.getIdentity(identityProperties: nil)
            XCTAssertEqual(other.accessKey, seeded.accessKey)
        }

        await source.open()
        let refreshed = try await first.value
        XCTAssertNotEqual(refreshed.accessKey, seeded.accessKey)
        let calls = await source.calls
        XCTAssertEqual(calls, 2)
    }

    // testConcurrentMandatoryRefresh is the SEP's concurrency test 2: one refresh, and every caller waits for it and gets the same result.
    func testConcurrentMandatoryRefresh() async throws {
        let clock = MockCredentialClock()
        let source = GatedCredentialSource(clock: clock)
        let subject = CredentialsCache(source: source, now: { clock.now() })
        let seeded = try await subject.getIdentity(identityProperties: nil)
        clock.advance(by: seedLifetime - seedMandatoryWindow)
        await source.close()

        let callers = (0..<10).map { _ in Task { try await subject.getIdentity(identityProperties: nil) } }
        while await source.calls < 2 { await Task.yield() }
        await source.open()

        var accessKeys = Set<String>()
        for caller in callers { accessKeys.insert(try await caller.value.accessKey) }
        XCTAssertEqual(accessKeys.count, 1)
        XCTAssertFalse(accessKeys.contains(seeded.accessKey))
        let calls = await source.calls
        XCTAssertEqual(calls, 2)
    }

    func testSEPModeledCases() async throws {
        let cases = try loadCases()
        // The case count is pinned so a decoding change or bad resource path fails instead of passing empty.
        XCTAssertEqual(cases.count, 24, "unexpected number of SEP cases in the vendored suite")

        var executed = 0
        var skipped = 0
        for (index, sepCase) in cases.enumerated() {
            // Swift has no customer-configured advisory window, so that case is skipped.
            if sepCase.given.configuredAdvisoryWindowSeconds != nil {
                skipped += 1
                continue
            }
            await run(sepCase, index: index)
            executed += 1
        }

        XCTAssertEqual(executed, 23, "not every applicable SEP case ran")
        XCTAssertEqual(skipped, 1, "only the configured-advisory-window case is expected to be skipped")
    }

    private func run(_ sepCase: SEPCase, index: Int) async {
        let label = "case \(index): \(sepCase.documentation)"
        let clock = MockCredentialClock()
        let source = MockCredentialSource(clock: clock, outcome: .fresh(lifetime: seedLifetime))
        let subject = CredentialsCache(
            source: source,
            now: { clock.now() },
            fixedBackoff: sepCase.given.refreshBackoffSeconds
        )

        // lastKnownAccessKey tells newCredentials apart from cachedCredentials.
        var lastKnownAccessKey: String?
        do {
            lastKnownAccessKey = try await seed(sepCase.given, subject: subject, source: source, clock: clock)
        } catch {
            return XCTFail("\(label): seeding failed: \(error)")
        }

        for (stepIndex, step) in sepCase.steps.enumerated() {
            let stepLabel = "\(label)\n  step \(stepIndex) (\(step.type))"
                + (step.documentation.map { ": \($0)" } ?? "")
            switch step.type {
            case "advanceTime":
                guard let seconds = step.seconds else {
                    return XCTFail("\(stepLabel): advanceTime without seconds")
                }
                clock.advance(by: seconds)
            case "invalidate":
                guard let rejected = step.rejectedAccessKeyId else {
                    return XCTFail("\(stepLabel): invalidate without rejectedAccessKeyId")
                }
                await subject.invalidate(
                    AWSCredentialIdentity(accessKey: rejected, secret: "secret")
                )
            case "getCredentials":
                lastKnownAccessKey = await getCredentials(
                    step,
                    label: stepLabel,
                    subject: subject,
                    source: source,
                    cachedBefore: lastKnownAccessKey
                )
            default:
                return XCTFail("\(stepLabel): unknown step type")
            }
        }
    }

    // seed fetches credentials and advances the clock into the case's starting state, and returns the cached access key.
    private func seed(
        _ given: Given,
        subject: CredentialsCache,
        source: MockCredentialSource,
        clock: MockCredentialClock
    ) async throws -> String? {
        guard given.cachedCredentials != "none" else { return nil }

        if let accessKeyId = given.accessKeyId {
            guard let number = Int(accessKeyId.replacingOccurrences(of: "AKID-", with: "")) else {
                throw Failure("unparseable accessKeyId '\(accessKeyId)'")
            }
            await source.setIssuedCount(number - 1)
        }

        let seeded = try await subject.getIdentity(identityProperties: nil)
        clock.advance(by: try advance(forState: given.cachedCredentials))

        if let accessKeyId = given.accessKeyId {
            XCTAssertEqual(seeded.accessKey, accessKeyId, "seeded cache does not hold the access key the case names")
        }

        await source.resetCallCount()
        return seeded.accessKey
    }

    // advance returns how far to move the clock after seeding to reach each starting state.
    private func advance(forState state: String) throws -> TimeInterval {
        switch state {
        case "none", "valid": return 0
        case "advisory": return seedLifetime - seedAdvisoryWindow
        case "mandatory": return seedLifetime - seedMandatoryWindow
        case "expired": return seedLifetime + 1
        default: throw Failure("unknown cachedCredentials state '\(state)'")
        }
    }

    // getCredentials runs one getCredentials step, checks its expectations, and returns the cached access key.
    private func getCredentials(
        _ step: Step,
        label: String,
        subject: CredentialsCache,
        source: MockCredentialSource,
        cachedBefore: String?
    ) async -> String? {
        guard let expected = step.expected else {
            XCTFail("\(label): getCredentials without expectations")
            return cachedBefore
        }

        if let response = step.response {
            switch response {
            case "freshCredentials":
                await source.setOutcome(.fresh(lifetime: step.lifetimeSeconds ?? seedLifetime))
            case "staleCredentials": await source.setOutcome(.stale)
            case "error": await source.setOutcome(.failure)
            case "nonRecoverableError": await source.setOutcome(.nonRecoverable)
            default:
                XCTFail("\(label): unknown response '\(response)'")
                return cachedBefore
            }
        }

        // rateLimited is the backoff state before the call, so check it before getIdentity.
        let rateLimited = await subject.rateLimited
        let callsBefore = await source.calls()

        var thrown: Error?
        var returned: AWSCredentialIdentity?
        do {
            returned = try await subject.getIdentity(identityProperties: nil)
        } catch {
            thrown = error
        }

        let callsAfter = await source.calls()
        XCTAssertEqual(callsAfter > callsBefore, expected.sourceContacted,
                       "\(label)\n  sourceContacted")
        XCTAssertEqual(rateLimited, expected.rateLimited, "\(label)\n  rateLimited")

        switch expected.result {
        case "newCredentials":
            guard let returned else {
                XCTFail("\(label)\n  expected newCredentials, threw \(thrown.map { "\($0)" } ?? "nil")")
                return cachedBefore
            }
            XCTAssertNotEqual(returned.accessKey, cachedBefore,
                              "\(label)\n  expected credentials different from those cached")
        case "cachedCredentials":
            guard let returned else {
                XCTFail("\(label)\n  expected cachedCredentials, threw \(thrown.map { "\($0)" } ?? "nil")")
                return cachedBefore
            }
            XCTAssertEqual(returned.accessKey, cachedBefore,
                           "\(label)\n  expected the credentials already cached")
        case "noCredentialsError":
            XCTAssertNotNil(thrown, "\(label)\n  expected noCredentialsError, returned credentials")
            XCTAssertFalse(thrown is NonRecoverableCredentialError,
                           "\(label)\n  expected a generic failure, got a non-recoverable one")
        case "nonRecoverableError":
            XCTAssertTrue(thrown is NonRecoverableCredentialError,
                          "\(label)\n  expected nonRecoverableError, got \(thrown.map { "\($0)" } ?? "credentials")")
        default:
            XCTFail("\(label): unknown expected result '\(expected.result)'")
        }

        if let expectedWindow = expected.advisoryWindowSeconds {
            let actual = await subject.advisoryWindow
            XCTAssertEqual(actual, expectedWindow, "\(label)\n  advisoryWindowSeconds")
        }

        // A call that throws doesn't change what's cached.
        return returned?.accessKey ?? cachedBefore
    }

    // loadCases decodes the SEP test cases from the test bundle.
    private func loadCases() throws -> [SEPCase] {
        guard let url = Bundle.module.url(forResource: "credential-refresh-tests", withExtension: "json") else {
            throw Failure("credential-refresh-tests.json is missing from the test bundle")
        }
        return try JSONDecoder().decode([SEPCase].self, from: try Data(contentsOf: url))
    }
}
