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

class RegionTests: XCTestCase {
    
    func testItResolvesRegionFromEnvironment() {
        let providers = [EnvironmentRegionProvider(env: MockEnvironment(region: "us-west-1"))]
        let region = DefaultRegionResolver(providers: providers).resolveRegion()
        XCTAssertEqual(region, "us-west-1")
    }
    
    func testCustomChain() {
        let providers: [RegionProvider] = [
            EnvironmentRegionProvider(env: MockEnvironment(region: nil)),
            EnvironmentRegionProvider(env: MockEnvironment(region: "us-east-1")),
            EnvironmentRegionProvider(env: MockEnvironment(region: "us-east-2"))
        ]
        let region = DefaultRegionResolver(providers: providers).resolveRegion()
        XCTAssertEqual(region, "us-east-1")
    }
}

    
struct MockEnvironment: Environment {
    let region: String?
    func environmentVariable(key: String) -> String? {
        return region
    }
}
