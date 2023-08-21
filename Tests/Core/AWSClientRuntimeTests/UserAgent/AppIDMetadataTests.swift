//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSClientRuntime
import XCTest

class AppIDMetadataTests: XCTestCase {

    func test_description_sanitizesTheAppID() {
        let subject = AppIDMetadata(name: "Self Driving 🤡 Car")

        XCTAssertEqual(subject.description, "app/Self-Driving---Car")
    }
}
