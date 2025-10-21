//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSSDKSwiftCLI

class PartitionsBuilderTests: XCTestCase {

    func test_generatePartitions_suceedsWithExpectedContents() throws {
        let partitionsFileURL = Bundle.module.url(forResource: "test-partitions", withExtension: "json")!
        let partitionsSwiftFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)

        try PartitionsBuilder(
            partitionsFileURL: partitionsFileURL,
            partitionsSwiftFileURL: partitionsSwiftFileURL
        ).generatePartitionsFile()

        let packageVersionSwiftContents = try XCTUnwrap(Data(contentsOf: partitionsSwiftFileURL))
        let partitionsSwift = try XCTUnwrap(String(data: packageVersionSwiftContents, encoding: .utf8))

        let expected = """
            //
            // Copyright Amazon.com Inc. or its affiliates.
            // All Rights Reserved.
            //
            // SPDX-License-Identifier: Apache-2.0
            //
            
            // Code is auto-generated. DO NOT EDIT!
            
            public let partitions = #\"\"\"
            {"test":"partitions"}
            \"\"\"#

            """

        XCTAssertEqual(partitionsSwift, expected)
    }

    func test_generatePartitions_throwsOnInvalidPackageVersion() throws {
        let partitionsFileURL = Bundle.module.url(forResource: "invalid-partitions", withExtension: "json")!
        let partitionsSwiftFileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)

        XCTAssertThrowsError(
            try PartitionsBuilder(
                partitionsFileURL: partitionsFileURL,
                partitionsSwiftFileURL: partitionsSwiftFileURL
            ).generatePartitionsFile()
        )
    }

    func test_generateDefaultFileURLs() throws {
        let subject = PartitionsBuilder(repoPath: "/path/to/sdk")

        XCTAssertEqual(subject.partitionsFileURL, URL(fileURLWithPath: "/path/to/sdk/codegen/sdk-codegen/sdk-partitions.json"))
        XCTAssertEqual(subject.partitionsSwiftFileURL,
            URL(fileURLWithPath: "/path/to/sdk/Sources/Core/AWSSDKDynamic/Sources/AWSSDKDynamic/Partitions.swift")
        )
    }
}
