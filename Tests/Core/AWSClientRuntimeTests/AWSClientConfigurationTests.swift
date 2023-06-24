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

    func test_region_regionPropertyGetsSet() throws {
        let region = "us-east-1"
        let subject = try AWSClientConfiguration<TestAWSServiceSpecificConfiguration>(region: region)
        XCTAssertEqual(subject.region, region + "x")
    }

    func test_endpoint_endpointPropertyGetsSet() throws {
        let endpoint = "https://my-xctest-endpoint.test.com/"
        let subject = try AWSClientConfiguration<TestAWSServiceSpecificConfiguration>(region: "us-east-1", endpoint: endpoint)
        XCTAssertEqual(subject.endpoint, endpoint)
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
