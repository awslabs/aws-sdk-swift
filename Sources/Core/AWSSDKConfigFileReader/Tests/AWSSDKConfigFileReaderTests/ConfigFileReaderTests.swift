//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import Foundation
@_spi(FileBasedConfig) import AWSSDKConfigFileReader
@_spi(FileBasedConfig) import AWSSDKCommon

final class ConfigFileReaderTests: XCTestCase {
    let exampleConfigFilePath = Bundle.module.path(forResource: "config_file_reader_tests", ofType: nil)!

    func test_readsConfigFileDefaultSection() async throws {
        // arrange
        let subject = try await TestSubject.constructor(exampleConfigFilePath, nil)

        // act
        let defaultSection = subject?.section(for: "default")

        // assert
        XCTAssertNotNil(defaultSection)
    }

    func test_readsConfigFileBusinessCasualSection() async throws {
        // arrange
        let subject = try await TestSubject.constructor(exampleConfigFilePath, nil)

        // act
        let businessCasualSection = subject?.section(for: "business-casual")

        // assert
        XCTAssertNotNil(businessCasualSection)
    }

    func test_configFileHasAllExpectedSections() async throws {
        // arrange
        let subject = try await TestSubject.constructor(exampleConfigFilePath, nil)

        // act
        let sections = [
            subject?.section(for: "default"),
            subject?.section(for: "business-casual"),
            subject?.section(for: "my-session"),
            subject?.section(for: "my-services-config")
        ].compactMap { $0 }

        // assert
        XCTAssertTrue(sections.count == 4)
    }


    func test_readsDefaultSection() async throws {
        // arrange
        let subject = try await TestSubject.constructor(exampleConfigFilePath, nil)

        // act
        let region = subject?.section(for: "default")?.string(for: "region")

        // assert
        XCTAssertEqual(region, "us-east-1")
    }

    func test_readsCustomSection() async throws {
        // arrange
        let subject = try await TestSubject.constructor(exampleConfigFilePath, nil)

        // act
        let region = subject?.section(for: "business-casual")?.string(for: "region")

        // assert
        XCTAssertEqual(region, "ap-southeast-2")
    }
    
    func test_readsSessionSection() async throws {
        // arrange
        let subject = try await TestSubject.constructor(exampleConfigFilePath, nil)

        // act
        let region = subject?.section(for: "my-session")?.string(for: "region")

        // assert
        XCTAssertEqual(region, "us-west-3")
    }

    func test_readsServicesSection() async throws {
        // arrange
        let subject = try await TestSubject.constructor(exampleConfigFilePath, nil)

        // act
        let region = subject?.section(for: "my-services-config")?.string(for: "region")

        // assert
        XCTAssertEqual(region, "ap-southwest-4")
    }
}
