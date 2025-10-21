//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSSDKSwiftCLI

class PackageVersionBuilderTests: XCTestCase {

    func test_generatePackageVersion_suceedsWithExpectedContents() throws {
        let packageVersionFileURL = Bundle.module.url(forResource: "Package.version.next", withExtension: "test")!
        let packageVersionSwiftFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)

        try PackageVersionBuilder(
            packageVersionFileURL: packageVersionFileURL,
            packageVersionSwiftFileURL: packageVersionSwiftFileURL
        ).generatePackageVersionFile()

        let packageVersionSwiftContents = try XCTUnwrap(Data(contentsOf: packageVersionSwiftFileURL))
        let packageVersionSwift = try XCTUnwrap(String(data: packageVersionSwiftContents, encoding: .utf8))

        let expected = """
            //
            // Copyright Amazon.com Inc. or its affiliates.
            // All Rights Reserved.
            //
            // SPDX-License-Identifier: Apache-2.0
            //
            
            // Code is auto-generated. DO NOT EDIT!
            
            public let packageVersion = "1.3.2"

            """

        XCTAssertEqual(packageVersionSwift, expected)
    }

    func test_generatePackageSwift_throwsOnInvalidPackageVersion() throws {
        let packageVersionFileURL = Bundle.module.url(forResource: "Package.version.next.invalid", withExtension: nil)!
        let packageVersionSwiftFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)

        XCTAssertThrowsError(
            try PackageVersionBuilder(
                packageVersionFileURL: packageVersionFileURL,
                packageVersionSwiftFileURL: packageVersionSwiftFileURL
            ).generatePackageVersionFile()
        )
    }

    func test_generateDefaultFileURLs() throws {
        let subject = PackageVersionBuilder(repoPath: "/path/to/sdk")

        XCTAssertEqual(subject.packageVersionFileURL, URL(fileURLWithPath: "/path/to/sdk/Package.version.next"))
        XCTAssertEqual(subject.packageVersionSwiftFileURL,
            URL(fileURLWithPath: "/path/to/sdk/Sources/Core/AWSSDKDynamic/Sources/AWSSDKDynamic/PackageVersion.swift")
        )
    }
}
