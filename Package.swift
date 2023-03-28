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

let smithyTestUtil = PackageDescription.Target.Dependency.product(name: "SmithyTestUtil", package: "smithy-swift")
let clientRuntime = PackageDescription.Target.Dependency.product(name: "ClientRuntime", package: "smithy-swift")
let awsCommonRuntimeKit = PackageDescription.Target.Dependency.product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift")

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"]),
        
        .library(name: "AWSS3", targets: ["AWSS3"]),
    ],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-crt-swift", branch: "cached-file-config")
    ],
    targets: [
        // MARK: - Core Targets
        .target(name: "AWSClientRuntime", dependencies: [awsCommonRuntimeKit, clientRuntime], path: "./Sources/Core/AWSClientRuntime"),

        // MARK: - Core Test Targets
        .testTarget(name: "AWSClientRuntimeTests", dependencies: [clientRuntime, "AWSClientRuntime", smithyTestUtil], path: "./Tests/Core/AWSClientRuntimeTests", resources: [.process("Resources")]),

        .target(name: "AWSS3", dependencies: [clientRuntime, "AWSClientRuntime"], path: "./Sources/Services/AWSS3"),
        
        .testTarget(name: "AWSS3Tests", dependencies: [awsCommonRuntimeKit, clientRuntime, "AWSClientRuntime", "AWSS3", smithyTestUtil], path: "./Tests/Services/AWSS3Tests"),
    ]
)

package.dependencies += [
    .package(url: "https://github.com/awslabs/smithy-swift", branch: "epau/feat/file-based-config")
]
