//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@testable import AWSSDKSwiftCLI
import XCTest

class PackageManifestBuilderTests: XCTestCase {

    let expected = """
<contents of base package>

// MARK: - Generated

addDependencies(
    clientRuntimeVersion: "1.2.3",
    crtVersion: "4.5.6"
)

// Uncomment this line to exclude runtime unit tests
// excludeRuntimeUnitTests()

let serviceTargets: [String] = [
    "A",
    "B",
    "C",
    "D",
    "E",
]

// Uncomment this line to enable all services
addAllServices()

let servicesWithIntegrationTests: [String] = [
    "A",
    "B",
    "C",
    "D",
    "E",
]

// Uncomment this line to enable integration tests
// addIntegrationTests()

// Uncomment this line to enable protocol tests
// addProtocolTests()

addResolvedTargets()


"""

    func testBuild() {
        let subject = PackageManifestBuilder(
            clientRuntimeVersion: .init("1.2.3"),
            crtVersion: .init("4.5.6"),
            services: ["A","B","C","D","E"].map { PackageManifestBuilder.Service(name: $0, includeIntegrationTests: true) },
            includeProtocolTests: false,
            includeIntegrationTests: false,
            excludeAWSServices: false,
            excludeRuntimeTests: false,
            basePackageContents: { "<contents of base package>" }
        )
        let result = try! subject.build()
        XCTAssertEqual(result, expected)
    }
}
