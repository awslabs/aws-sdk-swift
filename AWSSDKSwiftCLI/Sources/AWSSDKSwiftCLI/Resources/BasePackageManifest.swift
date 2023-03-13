// swift-tools-version:5.5

//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// This manifest is auto-generated.  Do not commit edits to this file;
// they will be overwritten.

import Foundation
import PackageDescription

// MARK: - Target Dependencies

extension Target.Dependency {
    static var awsClientRuntime: Self { "AWSClientRuntime" }
    static var crt: Self { .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift") }
    static var clientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var smithyTestUtils: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
}

// MARK: - Base Package

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"])
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [.crt, .clientRuntime],
            path: "./Sources/Core/AWSClientRuntime"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [.awsClientRuntime, .clientRuntime, .smithyTestUtils],
            path: "./Tests/Core/AWSClientRuntimeTests"
        )
    ]
)

// MARK: - Dependencies

func addDependencies(clientRuntimeVersion: Version, crtVersion: Version) {
    addClientRuntimeDependency(clientRuntimeVersion)
    addCRTDependency(crtVersion)
}

func addClientRuntimeDependency(_ version: Version) {
    let smithySwiftURL = "https://github.com/awslabs/smithy-swift"
    let useLocalDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_LOCAL_DEPS"] != nil
    let useMainDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_MAIN_DEPS"] != nil
    switch (useLocalDeps, useMainDeps) {
    case (true, true):
        fatalError("Unable to determine which dependencies to use. Please only specify one of AWS_SWIFT_SDK_USE_LOCAL_DEPS or AWS_SWIFT_SDK_USE_MAIN_DEPS.")
    case (true, false):
        package.dependencies += [
            .package(path: "../smithy-swift")
        ]
    case (false, true):
        package.dependencies += [
            .package(url: smithySwiftURL, .branch("main"))
        ]
    case (false, false):
        package.dependencies += [
            .package(url: smithySwiftURL, .exact(version))
        ]
    }
}

func addCRTDependency(_ version: Version) {
    package.dependencies += [
        .package(url: "https://github.com/awslabs/aws-crt-swift", .exact(version))
    ]
}

// MARK: - Services

func addServiceTarget(_ name: String) {
    let testName = "\(name)Tests"
    package.targets += [
        .target(
            name: name,
            dependencies: [.clientRuntime, .awsClientRuntime],
            path: "./Sources/Services/\(name)"
        ),
        .testTarget(
            name: "\(testName)",
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils],
            path: "./Tests/Services/\(testName)"
        )
    ]
}
