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
        let region = MockRegionResolver().resolveRegionFromProviders()
        XCTAssertEqual(region, "us-west-1")
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

struct MockRegionResolver: RegionResolver {
    var providers: [RegionProvider]
    
    init() {
        self.providers = [EnvironmentRegionProvider(env: MockEnvironment())]
    }
    
    func resolveRegionFromProviders() -> String? {
        for provider in providers {
            guard let region = provider.resolveRegion() else {
                return nil
            }
            
            return region
        }
        
        return nil
    }
}
