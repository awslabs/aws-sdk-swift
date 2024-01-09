//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSClientRuntime

class AWSClientConfigurationTests: XCTestCase {
    typealias Subject = AWSClientConfiguration<TestAWSServiceSpecificConfiguration>
    let region = "us-east-1"
    let endpoint = "https://my-xctest-endpoint.test.com/"
    let appID = "configured-app-id"

    // MARK: - Region

    func test_sync_region_regionPropertyGetsSet() throws {
        let subject = try Subject(region: region)
        XCTAssertEqual(subject.region, region)
    }

    func test_async_region_regionPropertyGetsSet() async throws {
        let subject = try await Subject(region: region)
        XCTAssertEqual(subject.region, region)
    }

    // MARK: - Custom endpoint

    func test_sync_endpoint_endpointPropertyGetsSet() throws {
        let subject = try Subject(region: region, endpoint: endpoint)
        XCTAssertEqual(subject.endpoint, endpoint)
    }

    func test_async_endpoint_endpointPropertyGetsSet() async throws {
        let subject = try await Subject(endpoint: endpoint, region: region)
        XCTAssertEqual(subject.endpoint, endpoint)
    }

    // MARK: - Retry options

    func test_sync_retryOptions_configuresRetryOptionsFromParams() throws {
        let subject = try Subject(region: region, retryMode: .adaptive, maxAttempts: 14)
        XCTAssertEqual(subject.retryStrategyOptions.rateLimitingMode, .adaptive)
        XCTAssertEqual(subject.retryStrategyOptions.maxRetriesBase, 13)
    }

    func test_async_retryOptions_configuresRetryOptionsFromParams() async throws {
        let subject = try await Subject(region: region, retryMode: .adaptive, maxAttempts: 14)
        XCTAssertEqual(subject.retryStrategyOptions.rateLimitingMode, .adaptive)
        XCTAssertEqual(subject.retryStrategyOptions.maxRetriesBase, 13)
    }

    // MARK: - App ID

    func test_sync_appID_configuresAppIDFromParams() throws {
        let subject = try Subject(region: region, appID: appID)
        XCTAssertEqual(subject.appID, appID)
    }

    func test_async_appID_configuresAppIDFromParams() async throws {
        let subject = try await Subject(region: region, appID: appID)
        XCTAssertEqual(subject.appID, appID)
    }
}

struct TestAWSServiceSpecificConfiguration: AWSServiceSpecificConfiguration {
    struct EndpointResolver {}

    typealias AWSServiceEndpointResolver = EndpointResolver

    var endpointResolver: EndpointResolver

    init(endpointResolver: EndpointResolver?) throws {
        self.endpointResolver = endpointResolver ?? EndpointResolver()
    }

    var serviceName: String { "TestAWSService" }
    var clientName: String { "TestAWSServiceClient" }
    var connectTimeoutMs: UInt32 { 10_000 }
}
