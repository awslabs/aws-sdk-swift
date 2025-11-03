//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSDynamoDB
import SmithyTestUtil
import SmithyIdentity
import enum AWSClientRuntime.AccountIDEndpointMode
import enum ClientRuntime.EndpointError

final class AccountIDEndpointModeTests: XCTestCase {
    private let accountID = "0123456789"

    // MARK: - Tests

    // MARK: nil

    func test_nilMode_prefersByDefault() async throws {
        let subject = try await subject(accountIDEndpointMode: nil, setAccountID: true)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch TestCheckError.actual(let request) {
            XCTAssert(request.endpoint.host.contains(accountID))
        } catch {
            XCTFail("Request should have succeeded, threw error: \(error)")
        }
    }

    func test_nilMode_createsEndpointWithoutAccountID() async throws {
        let subject = try await subject(accountIDEndpointMode: nil, setAccountID: false)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch TestCheckError.actual(let request) {
            XCTAssertFalse(request.endpoint.host.contains(accountID))
        } catch {
            XCTFail("Request failed on unexpected error")
        }
    }

    // MARK: preferred

    func test_preferredMode_prefersByDefault() async throws {
        let subject = try await subject(accountIDEndpointMode: .preferred, setAccountID: true)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch TestCheckError.actual(let request) {
            XCTAssert(request.endpoint.host.contains(accountID))
        } catch {
            XCTFail("Request should have succeeded, threw error: \(error)")
        }
    }

    func test_preferredMode_createsEndpointWithoutAccountID() async throws {
        let subject = try await subject(accountIDEndpointMode: .preferred, setAccountID: false)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch TestCheckError.actual(let request) {
            XCTAssertFalse(request.endpoint.host.contains(accountID))
        } catch {
            XCTFail("Request failed on unexpected error")
        }
    }

    // MARK: required

    func test_requiredMode_createsEndpointWithAccountID() async throws {
        let subject = try await subject(accountIDEndpointMode: .required, setAccountID: true)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch TestCheckError.actual(let request) {
            XCTAssert(request.endpoint.host.contains(accountID))
        } catch {
            XCTFail("Request should have succeeded, threw error: \(error)")
        }
    }

    func test_requiredMode_failsWhenRequiredButNotPresent() async throws {
        let subject = try await subject(accountIDEndpointMode: .required, setAccountID: false)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch EndpointError.unresolved {
            // No action, test succeeded
        } catch {
            XCTFail("Request failed on unexpected error")
        }
    }

    // MARK: disabled

    func test_disabledMode_createsEndpointWithoutAccountIDWhenNil() async throws {
        let subject = try await subject(accountIDEndpointMode: .disabled, setAccountID: false)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch TestCheckError.actual(let request) {
            XCTAssertFalse(request.endpoint.host.contains(accountID))
        } catch {
            XCTFail("Request failed on unexpected error")
        }
    }

    func test_disabledMode_createsEndpointWithoutAccountIDWhenSupplied() async throws {
        let subject = try await subject(accountIDEndpointMode: .disabled, setAccountID: true)

        do {
            _ = try await subject.getItem(input: GetItemInput())
            XCTFail("Request should have thrown")
        } catch TestCheckError.actual(let request) {
            XCTAssertFalse(request.endpoint.host.contains(accountID))
        } catch {
            XCTFail("Request failed on unexpected error")
        }
    }

    // MARK: - Private methods

    private func subject(
        accountIDEndpointMode: AccountIDEndpointMode?,
        setAccountID: Bool
    ) async throws -> DynamoDBClient {
        let accountID = setAccountID ? self.accountID : nil
        let credentials = AWSCredentialIdentity(accessKey: "abc", secret: "def", accountID: accountID)
        let resolver = StaticAWSCredentialIdentityResolver(credentials)
        let config = try await DynamoDBClient.Config(
            awsCredentialIdentityResolver: resolver,
            region: "us-east-1",
            accountIdEndpointMode: accountIDEndpointMode,
            httpClientEngine: ProtocolTestClient()
        )
        return DynamoDBClient(config: config)
    }
}
