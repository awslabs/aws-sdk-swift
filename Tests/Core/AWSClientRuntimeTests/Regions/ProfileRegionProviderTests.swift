//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import SmithyTestUtil
import XCTest
@_spi(Internal) @testable import AWSClientRuntime

class ProfileRegionProviderTests: XCTestCase {
    
    let configPath = Bundle.module.path(forResource: "profile_region_provider_tests", ofType: nil)!
    
    let store = try! CRTFiledBasedConfigurationStore()
    
    func testProfileRegionProviderUsesDefaultProfileWhenNil() async {
        let provider = ProfileRegionProvider(
            fileBasedConfigurationProvider: store,
            configFilePath: configPath
        )
        let region = try! await provider.resolveRegion()
        XCTAssertEqual(region, "us-east-2")
    }
    
    func testProfileRegionProviderUsesPassedInProfile() async {
        let provider = ProfileRegionProvider(
            fileBasedConfigurationProvider: store,
            profileName: "west",
            configFilePath: configPath
        )
        let region = try! await provider.resolveRegion()
        XCTAssertEqual(region, "us-west-2")
    }
    
    func testProfileRegionProviderWorksWithCredentialsFile() async {
        let provider = ProfileRegionProvider(
            fileBasedConfigurationProvider: store,
            credentialsFilePath: configPath
        )
        let region = try! await provider.resolveRegion()
        XCTAssertEqual(region, "us-east-2")
    }
}
