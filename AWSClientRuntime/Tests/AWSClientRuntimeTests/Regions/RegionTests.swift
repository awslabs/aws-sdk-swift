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
    
    func testItResolvesRegionFromEnvironment() async {
        let providers = [EnvironmentRegionProvider(env: MockEnvironment(region: "us-west-1"))]
        let region = await DefaultRegionResolver(providers: providers).resolveRegion()
        XCTAssertEqual(region, "us-west-1")
    }
    
    func testCustomChain() async {
        let providers: [RegionProvider] = [
            EnvironmentRegionProvider(env: MockEnvironment(region: nil)),
            EnvironmentRegionProvider(env: MockEnvironment(region: "us-east-1")),
            EnvironmentRegionProvider(env: MockEnvironment(region: "us-east-2"))
        ]
        let region = await DefaultRegionResolver(providers: providers).resolveRegion()
        XCTAssertEqual(region, "us-east-1")
    }
    
    func testChainWithBadProfileProviderFailsGracefully() async {
        let providers: [RegionProvider] = [
            EnvironmentRegionProvider(env: MockEnvironment(region: nil)),
            ProfileRegionProvider(path: "~/.aws/configz", profileName: "default"),
            EnvironmentRegionProvider(env: MockEnvironment(region: "us-east-1")),
            EnvironmentRegionProvider(env: MockEnvironment(region: "us-east-2"))
        ]
        let region = await DefaultRegionResolver(providers: providers).resolveRegion()
        XCTAssertEqual(region, "us-east-1")
    }
    
    func testChainWithBadProfileProviderFails() async {
        let providers: [RegionProvider] = [
            EnvironmentRegionProvider(env: MockEnvironment(region: nil)),
            ProfileRegionProvider(path: "~/.aws/configz", profileName: "default")
        ]
        let region = await DefaultRegionResolver(providers: providers).resolveRegion()
        XCTAssertEqual(region, nil)
    }
}
    
struct MockEnvironment: Environment {
    let region: String?
    func environmentVariable(key: String) -> String? {
        return region
    }
}
