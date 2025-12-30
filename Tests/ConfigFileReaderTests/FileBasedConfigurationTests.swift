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
            defaultSection?.string(for: "aws_access_key_id"),
            "ACCESS_KEY_0"
        )

        XCTAssertEqual(
            defaultSection?.string(for: "aws_secret_access_key"),
            "SECRET_KEY_0"
        )

        XCTAssertNil(defaultSection?.string(for: "undefined-property"))

        let defaultNestedSection = defaultSection?.property(for: "s3")
        if case .subsection(let subsectionNestedUnderDefault) = defaultNestedSection {
            XCTAssertEqual(
                subsectionNestedUnderDefault.value(for: "max_concurrent_requests"),
                "20"
            )
        } else {
            XCTFail("Nested section does not contain subproperties")
        }

        let namedSection = config?.section(for: "my-profile")

        XCTAssertEqual(
            namedSection?.string(for: "aws_access_key_id"),
            "ACCESS_KEY_1"
        )

        XCTAssertEqual(
            namedSection?.string(for: "aws_secret_access_key"),
            "SECRET_KEY_1"
        )

        XCTAssertNil(namedSection?.string(for: "undefined-property"))

        let testNestedSection = namedSection?.property(for: "s3")
        if case .subsection(let subsectionNestedUnderTest) = testNestedSection {
            XCTAssertEqual(
                subsectionNestedUnderTest.value(for: "max_concurrent_requests"),
                "20"
            )
        } else {
            XCTFail("Nested section does not contain subproperties")
        }
    }
}
