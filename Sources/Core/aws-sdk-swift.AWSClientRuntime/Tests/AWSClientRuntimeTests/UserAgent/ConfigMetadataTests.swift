//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@testable import AWSClientRuntime
import XCTest

class ConfigMetadataTests: XCTestCase {

    func test_description_returnsCorrectMetadataForRetry() {
        let subject = ConfigMetadata(type: .retry(.legacy))
        XCTAssertEqual(subject.description, "cfg/retry-mode#legacy")
    }

    func test_description_returnsCorrectMetadataForStandard() {
        let subject = ConfigMetadata(type: .retry(.standard))
        XCTAssertEqual(subject.description, "cfg/retry-mode#standard")
    }

    func test_description_returnsCorrectMetadataForAdaptive() {
        let subject = ConfigMetadata(type: .retry(.adaptive))
        XCTAssertEqual(subject.description, "cfg/retry-mode#adaptive")
    }
}
