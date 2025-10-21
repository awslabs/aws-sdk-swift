//
//  PackageVersionBuilder.swift
//  AWSSDKSwiftCLI
//
//  Created by Elkins, Josh on 10/18/25.
//

import XCTest
@testable import AWSSDKSwiftCLI

class PackageVersionBuilderTests: XCTestCase {

    func test_generatePackageVersion() throws {
        let packageVersionFileURL = Bundle.module.url(forResource: "Package.version.next", withExtension: "test")!
        let packageVersionSwiftURL = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)

        try PackageVersionBuilder(
            packageVersionFileURL: packageVersionFileURL,
            packageVersionSwiftFileURL: packageVersionSwiftURL
        ).generatePackageVersionFile()

        let packageVersionSwiftContents = try XCTUnwrap(Data(contentsOf: packageVersionSwiftURL))
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
}
