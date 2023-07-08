//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import AWSClientRuntime

class AWSClientConfigurationTests: XCTestCase {
    typealias Subject = AWSClientConfiguration<TestAWSServiceSpecificConfiguration>

    func test_sync_region_regionPropertyGetsSet() throws {
        let region = "us-east-1"
        let subject = try Subject(region: region)
        XCTAssertEqual(subject.region, region)
    }

    func test_async_region_regionPropertyGetsSet() async throws {
        let region = "us-east-1"
        let subject = try await Subject(region: region)
        XCTAssertEqual(subject.region, region)
    }

    func test_sync_endpoint_endpointPropertyGetsSet() throws {
        let endpoint = "https://my-xctest-endpoint.test.com/"
        let subject = try Subject(region: "us-east-1", endpoint: endpoint)
        XCTAssertEqual(subject.endpoint, endpoint)
    }

    func test_async_endpoint_endpointPropertyGetsSet() async throws {
        let endpoint = "https://my-xctest-endpoint.test.com/"
        let subject = try await Subject(endpoint: endpoint, region: "us-east-1")
        XCTAssertEqual(subject.endpoint, endpoint)
    }

    func test_sync_retryOptions_configuresRetryOptionsFromParams() throws {
        let subject = try Subject(region: "us-east-1", retryMode: .adaptive, maxAttempts: 14)
        XCTAssertEqual(subject.retryStrategyOptions.rateLimitingMode, .adaptive)
        XCTAssertEqual(subject.retryStrategyOptions.maxRetriesBase, 13)
    }

    func test_async_retryOptions_configuresRetryOptionsFromParams() async throws {
        let subject = try await Subject(region: "us-east-1", retryMode: .adaptive, maxAttempts: 14)
        XCTAssertEqual(subject.retryStrategyOptions.rateLimitingMode, .adaptive)
        XCTAssertEqual(subject.retryStrategyOptions.maxRetriesBase, 13)
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
}
