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

        let serviceTargets: [String: [Target.Dependency]] = [
            "A": [],
            "B": [],
            "C": [],
            "D": [],
            "E": [],
        ]

        let internalAWSSTSDependencies: [Target.Dependency] = []
        let internalAWSSSODependencies: [Target.Dependency] = []
        let internalAWSSSOOIDCDependencies: [Target.Dependency] = []
        let internalAWSCognitoIdentityDependencies: [Target.Dependency] = []

        <contents of base package>
        """
        let subject = try PackageManifestBuilder(
            clientRuntimeVersion: .init("1.2.3"),
            crtVersion: .init("4.5.6"),
            services: ["A","B","C","D","E"].map { .init(name: $0) },
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

        let serviceTargets: [String: [Target.Dependency]] = [
            "A": [],
            "B": [],
            "C": [],
            "D": [],
            "E": [],
        ]

        let internalAWSSTSDependencies: [Target.Dependency] = []
        let internalAWSSSODependencies: [Target.Dependency] = []
        let internalAWSSSOOIDCDependencies: [Target.Dependency] = []
        let internalAWSCognitoIdentityDependencies: [Target.Dependency] = []

        <contents of base package>
        """
        let subject = try PackageManifestBuilder(
            clientRuntimeVersion: .init("1.2.3"),
            crtVersion: .init("4.5.6"),
            services: ["A","B","C","D","E"].map { PackageManifestBuilder.Service(name: $0) },
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
