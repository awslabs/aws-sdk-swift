//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

class EndpointsTests: XCTestCase {
    
    let testPartitions = [
        Partition(
            id: "part-id-1",
            regionRegex: "^(us)-\\w+-\\d+$",
            partitionEndpoint: "",
            isRegionalized: true,
            defaults: ServiceEndpointMetadata(hostName: "service.{region}.amazonaws.com",
                                              protocols: ["https"],
                                              signatureVersions: ["v4"]),
            endpoints: ["us-west-1": ServiceEndpointMetadata(),
                        "us-west-1-alt": ServiceEndpointMetadata(hostName: "service-alt.us-west-1.amazonaws.com",
                                                                 protocols: ["https"],
                                                                 credentialScope: CredentialScope(region: "us-west-1",
                                                                                                  serviceId: "foo"),
                                                                 signatureVersions: ["vFoo"])
            ]
        ),
        Partition(
            id: "part-id-2",
            regionRegex: "^(cn)-\\w+-\\d+$",
            partitionEndpoint: "partition",
            isRegionalized: false,
            defaults: ServiceEndpointMetadata(protocols: ["https"],
                                              credentialScope: CredentialScope(serviceId: "foo"),
                                              signatureVersions: ["v4"]),
            endpoints: ["partition": ServiceEndpointMetadata(hostName: "some-global-thing.amazonaws.cn",
                                                             credentialScope: CredentialScope(region: "cn-east-1"))]),
        Partition(
            id: "part-id-3",
            regionRegex: "^(eu)-\\w+-\\d+$",
            partitionEndpoint: "",
            isRegionalized: true,
            defaults: ServiceEndpointMetadata(hostName: "service.{region}.amazonaws.com",
                                              protocols: ["https"],
                                              credentialScope: CredentialScope(serviceId: "foo"),
                                              signatureVersions: ["v4"]),
            endpoints: [:])
    ]
    
    let endpointResolveTestCases = [ResolveTest(description: "modeled region with no endpoint overrides",
                                                region: "us-west-1",
                                                expected: AWSEndpoint(endpoint: Endpoint(host: "service.us-west-1.amazonaws.com",
                                                                                         protocolType: .https),
                                                                      signingRegion: "us-west-1")),
                                    ResolveTest(description: "modeled region with endpoint overrides",
                                                region: "us-west-1-alt",
                                                expected: AWSEndpoint(endpoint: Endpoint(host: "service-alt.us-west-1.amazonaws.com",
                                                                                         protocolType: .https),
                                                                      signingName: "foo",
                                                                      signingRegion: "us-west-1")),
                                    ResolveTest(description: "partition endpoint",
                                                region: "cn-central-1",
                                                expected: AWSEndpoint(endpoint: Endpoint(host: "some-global-thing.amazonaws.cn",
                                                                                         protocolType: .https),
                                                                      signingName: "foo", signingRegion: "cn-east-1")),
                                    ResolveTest(description: "region with un-modeled endpoints ( resolved through regex)",
                                                region: "eu-west-1",
                                                expected: AWSEndpoint(endpoint: Endpoint(host: "service.eu-west-1.amazonaws.com",
                                                                                         protocolType: .https),
                                                                      signingName: "foo",
                                                                      signingRegion: "eu-west-1"))
    ]
    
    func testNormalPartitionCreationWithOverrides() {
        let testCase = endpointResolveTestCases[0]
        do {
            let actual = try AWSEndpoint.resolveEndpoint(partitions: testPartitions, region: testCase.region)
            XCTAssert(testCase.expected == actual, "endpoint failed for test case: \(testCase.description)")
        } catch let err {
            XCTFail(err.localizedDescription)
        }
        
    }
    
    func testNonRegionalizedPartitionWithSomeOverrides() {
        let testCase = endpointResolveTestCases[1]
        do {
            let actual = try AWSEndpoint.resolveEndpoint(partitions: testPartitions, region: testCase.region)
            XCTAssert(testCase.expected == actual, "endpoint failed for test case: \(testCase.description)")
        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }
    
    func testEuropeanPartitionWithSomeOverrides() {
        let testCase = endpointResolveTestCases[2]
        do {
            let actual = try AWSEndpoint.resolveEndpoint(partitions: testPartitions, region: testCase.region)
            XCTAssert(testCase.expected == actual, "endpoint failed for test case: \(testCase.description)")
        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }
}

struct ResolveTest {
    let description: String
    let region: String
    let expected: AWSEndpoint
}
