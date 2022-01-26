// swift-tools-version:5.4

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
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"]),
        .library(name: "AWSJSONRuntime", targets: ["AWSJSONRuntime"]),
        .library(name: "AWSXMLRuntime", targets: ["AWSXMLRuntime"])
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ],
            path: "./AWSRuntime/Sources"
        ),
        .testTarget(
            name: "AWSRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ],
            path: "./AWSRuntime/Tests"
        ),
        .target(
            name: "AWSJSONRuntime",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "JSONRuntime", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ],
            path: "./AWSJSONRuntime/Sources"
        ),
        .testTarget(
            name: "AWSJSONRuntimeTests",
            dependencies: [
                "AWSJSONRuntime",
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ],
            path: "./AWSJSONRuntime/Tests"
        ),
        .target(
            name: "AWSXMLRuntime",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "XMLRuntime", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ],
            path: "./AWSXMLRuntime/Sources"
        ),
        .testTarget(
            name: "AWSXMLRuntimeTests",
            dependencies: [
                "AWSXMLRuntime",
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ],
            path: "./AWSXMLRuntime/Tests"
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
