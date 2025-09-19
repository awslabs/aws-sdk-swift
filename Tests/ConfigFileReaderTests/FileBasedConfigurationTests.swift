//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@_spi(FileBasedConfig) import AWSSDKCommon

// These tests are taken virtually unchanged from AWSClientRuntime.

class FileBasedConfigurationTests: XCTestCase {
    let configPath = Bundle.module.path(forResource: "file_based_config_tests", ofType: nil)

    func testCRTFileBasedConfiguration() async throws {
        let config = try await TestSubject.constructor(configPath, nil)
        let defaultSection = config?.section(for: "default")

        XCTAssertEqual(
            defaultSection?.string(for: "default-one-number"),
            "1"
        )

        XCTAssertEqual(
            defaultSection?.string(for: "default-two-word"),
            "two"
        )

        XCTAssertNil(defaultSection?.string(for: "undefined-property"))

        let defaultNestedSection = defaultSection?.property(for: "nested-under-default")
        if case .subsection(let subsectionNestedUnderDefault) = defaultNestedSection {
            XCTAssertEqual(
                subsectionNestedUnderDefault.value(for: "sub-default-one-number"),
                "1"
            )

            XCTAssertEqual(
                subsectionNestedUnderDefault.value(for: "sub-default-two-word"),
                "two"
            )
        } else {
            XCTFail("Nested section does not contain subproperties")
        }

        let namedSection = config?.section(for: "test")

        XCTAssertEqual(
            namedSection?.string(for: "test-one-word"),
            "one"
        )

        XCTAssertEqual(
            namedSection?.string(for: "test-two-number"),
            "2"
        )

        XCTAssertNil(namedSection?.string(for: "undefined-property"))

        let testNestedSection = namedSection?.property(for: "nested-under-test")
        if case .subsection(let subsectionNestedUnderTest) = testNestedSection {
            XCTAssertEqual(
                subsectionNestedUnderTest.value(for: "sub-test-one-word"),
                "one"
            )

            XCTAssertEqual(
                subsectionNestedUnderTest.value(for: "sub-test-two-number"),
                "2"
            )
        } else {
            XCTFail("Nested section does not contain subproperties")
        }
    }
}
