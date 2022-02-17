// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import PackageDescription

let package = Package(
    name: "TestSdk",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        //FIXME change this path to be non-localized
        .package(name: "AWSS3", path: "~/Projects/Amplify/SwiftSDK/aws-sdk-swift/codegen/sdk-codegen/build/smithyprojections/sdk-codegen/s3.2006-03-01/swift-codegen"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "TestSdk",
            dependencies: [
                "AWSS3"
            ],
            path: "Sources/TestSdk",
            resources: [.copy("Resources")]),
        .testTarget(
            name: "TestSdkTests",
            dependencies: ["TestSdk"]),
    ]
)
