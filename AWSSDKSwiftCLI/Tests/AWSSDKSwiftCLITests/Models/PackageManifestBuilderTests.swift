//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@testable import AWSSDKSwiftCLI
import XCTest

class PackageManifestBuilderTests: XCTestCase {

    func testBuildWithDefaults() throws {
        let expected = """
        <contents of prefix>
        // MARK: - Dynamic Content

        let clientRuntimeVersion: Version = "1.2.3"
        let crtVersion: Version = "4.5.6"

        let excludeRuntimeUnitTests = false

        let isPreviewBuild = false

        let serviceClientData: [ServiceClientData] = [
            .init(
                "A",
                "A.json",
                []
            ),
            .init(
                "B",
                "B.json",
                []
            ),
            .init(
                "C",
                "C.json",
                []
            ),
            .init(
                "D",
                "D.json",
                []
            ),
            .init(
                "E",
                "E.json",
                []
            ),
        ]

        <contents of base package>
        """
        let subject = try PackageManifestBuilder(
            clientRuntimeVersion: .init("1.2.3"),
            crtVersion: .init("4.5.6"),
            services: ["A","B","C","D","E"].map {
                .init(moduleName: $0, codegenName: "\($0).json", dependencies: [], isInternal: false)
            },
            excludeRuntimeTests: false,
            previewBuild: false,
            prefixContents: { "<contents of prefix>" },
            basePackageContents: { "<contents of base package>" }
        )
        let result = try! subject.build()
        print("")
        print(result)
        print("")
        XCTAssertEqual(result, expected)
    }

    func testBuildWithPreviewBuildAndExcludedTests() throws {
        let expected = """
        <contents of prefix>
        // MARK: - Dynamic Content

        let clientRuntimeVersion: Version = "1.2.3"
        let crtVersion: Version = "4.5.6"

        let excludeRuntimeUnitTests = true

        let isPreviewBuild = true

        let serviceClientData: [ServiceClientData] = [
            .init(
                "A",
                "A.json",
                []
            ),
            .init(
                "B",
                "B.json",
                []
            ),
            .init(
                "C",
                "C.json",
                []
            ),
            .init(
                "D",
                "D.json",
                []
            ),
            .init(
                "E",
                "E.json",
                []
            ),
        ]

        <contents of base package>
        """
        let subject = try PackageManifestBuilder(
            clientRuntimeVersion: .init("1.2.3"),
            crtVersion: .init("4.5.6"),
            services: ["A","B","C","D","E"].map {
                .init(moduleName: $0, codegenName: "\($0).json", dependencies: [], isInternal: false)
            },
            excludeRuntimeTests: true,
            previewBuild: true,
            prefixContents: { "<contents of prefix>" },
            basePackageContents: { "<contents of base package>" }
        )
        let result = try! subject.build()
        print("")
        print(result)
        print("")
        XCTAssertEqual(result, expected)
    }
}
