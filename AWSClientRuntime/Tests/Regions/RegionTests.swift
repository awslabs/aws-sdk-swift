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
    override func setUp() {
        mockEnvironmentVar(name: "AWS-REGION", value: "us-west-1", overwrite: true)
    }
    
    func testItResolvesRegionFromEnvironment() {
        let providers = [EnvironmentRegionProvider(env: MockEnvironment())]
        let region = MockRegionResolver(providers: providers).resolveRegionFromProviders()
        XCTAssertEqual(region, "us-west-1")
    }
    
    func testCustomChain() {
        let providers: [RegionProvider] = [MockRegionProvider1(), MockRegionProvider2(), MockRegionProvider3()]
        let region = MockRegionResolver(providers: providers).resolveRegionFromProviders()
        XCTAssertEqual(region, "us-east-1")
    }
    
    func mockEnvironmentVar(name: String, value: String, overwrite: Bool) {
        setenv(name, value, overwrite ? 1 : 0)
    }

}

    
struct MockEnvironment: Environment {
    func environmentVariable(key: String) -> String? {
        return "us-west-1"
    }
}

struct MockRegionProvider1: RegionProvider {
    func resolveRegion() -> String? {
        return nil
    }
}

struct MockRegionProvider2: RegionProvider {
    func resolveRegion() -> String? {
        return "us-east-1"
    }
}

struct MockRegionProvider3: RegionProvider {
    func resolveRegion() -> String? {
        return "us-east-2"
    }
}

struct MockRegionResolver: RegionResolver {
    var providers: [RegionProvider]
    
    init(providers: [RegionProvider]) {
        self.providers = providers
    }
    
    func resolveRegionFromProviders() -> String? {
        for provider in providers {
            guard let region = provider.resolveRegion() else {
                continue
            }
            
            return region
        }
        
        return nil
    }
}
