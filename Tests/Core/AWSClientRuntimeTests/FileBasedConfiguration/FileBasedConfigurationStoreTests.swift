//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest

@_spi(Internal) @testable import AWSClientRuntime

class FileBasedConfigurationStoreTests: XCTestCase {
    let store = try! CRTFiledBasedConfigurationStore()
    
    let configPath = Bundle.module.path(forResource: "file_based_config_tests", ofType: nil)
    
    func testStore() async {
        let config = try! await store.fileBasedConfiguration(
            configFilePath: configPath,
            credentialsFilePath: configPath
        )
        XCTAssertNotNil(config)
        
        let defaultSection = config?.section(for: "default")
        XCTAssertNotNil(defaultSection)
        XCTAssertEqual(
            defaultSection?.string(for: "one-number"),
            "1"
        )
    }
}
