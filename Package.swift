// swift-tools-version: 5.9

//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import PackageDescription

let package = Package(
    name: "ConfigFileReader",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "ConfigFileReader", targets: ["ConfigFileReader"]),
    ],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-sdk-swift.git", branch: "main")
    ],
    targets: [
        .target(
            name: "ConfigFileReader",
            dependencies: [
                .product(name: "AWSSDKCommon", package: "aws-sdk-swift")
            ]
        ),
        .testTarget(
            name: "ConfigFileReaderTests",
            dependencies: [
                "ConfigFileReader",
                .product(name: "AWSSDKCommon", package: "aws-sdk-swift"),
            ],
            resources: [.process("Resources")]
        ),
    ]
)
