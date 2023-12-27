//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@testable import AWSClientRuntime
import XCTest

class FeatureMetadataTests: XCTestCase {

    func test_description_sanitizedFeatureNameAndVersion() {
        let subject = FeatureMetadata(feature: "🤡 Car", version: "7.8.🤡")
        XCTAssertEqual(subject.description, "ft/--Car#7.8.-")
    }

    func test_description_omitsVersionIfVersionIsOmitted() {
        let subject = FeatureMetadata(feature: "🤡 Car")
        XCTAssertEqual(subject.description, "ft/--Car")
    }

    func test_description_omitsVersionIfVersionIsEmptyString() {
        let subject = FeatureMetadata(feature: "🤡 Car", version: "")
        XCTAssertEqual(subject.description, "ft/--Car")
    }
}
