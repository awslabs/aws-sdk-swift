// swift-tools-version:5.5

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import PackageDescription
import class Foundation.ProcessInfo

let package = Package(
    name: "AWSClientRuntime",
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
            dependencies: [
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ],
            path: "./Sources"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ],
            path: "./Tests"
        )
    ]
)

if let smithySwiftDir = ProcessInfo.processInfo.environment["SMITHY_SWIFT_CI_DIR"],
   let crtDir = ProcessInfo.processInfo.environment["AWS_CRT_SWIFT_CI_DIR"] {
    package.dependencies += [
        .package(name: "AwsCrt", path: "\(crtDir)"),
        .package(name: "ClientRuntime", path: "\(smithySwiftDir)/Packages")
    ]
} else {
    package.dependencies += [
        .package(name: "AwsCrt", path: "~/Projects/Amplify/SwiftSDK/aws-crt-swift"),
        .package(name: "ClientRuntime", path: "~/Projects/Amplify/SwiftSDK/smithy-swift/Packages")
    ]
}
