// swift-tools-version:5.4

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import PackageDescription
import class Foundation.FileManager

/*
 This Package.swift file is used to compile against locally
   - generated version of the AWS Swift SDK
   - checked out version of ClientRuntime
   - checked out version of AwsCrt

 Note: This Package.swift file is overwritten in our tagged releases


 In order to use setup local development:
 1. Create a folder:
   mkdir -p ~/Projects/Amplify/SwiftSDK
   cd ~/Projects/Amplify/SwiftSDK

 2. Checkout projects:
   git clone https://github.com/awslabs/aws-sdk-swift.git
   git clone https://github.com/awslabs/smithy-swift.git
   git clone https://github.com/awslabs/aws-crt-swift.git --recursive

 3.  Build
   cd ~/Projects/Amplify/SwiftSDK/aws-sdk-swift
   echo "compositeProjects=$HOME/Projects/Amplify/SwiftSDK/smithy-swift" >> local.properties
   ./gradlew -p codegen/sdk-codegen build
   ./gradlew -p codegen/sdk-codegen stageSdks

 As a result, there should be a folder called 'release' in aws-sdk-swift.

 To depend on these locally generated SDKs, change your project's
 Package.swift file to something like:

    let package = Package(
        name: "YourNameHere",
        platforms: [.macOS(.v10_15), .iOS(.v13)],
        dependencies: [
            .package(name: "AWSSwiftSDK", path: "/Users/<YourUserName>/Projects/Amplify/SwiftSDK/aws-sdk-swift")
        ],
        targets: [
             .target(
                 name: "YourNameHere",
                 dependencies: [.product(name: "S3", package: "AWSSwiftSDK")])
        ]
     )
*/

let RELEASE = "release"
let LOCAL_BASE_DIR = "Projects/Amplify/SwiftSDK"
let AWS_SDK_SWIFT_DIR = "\(LOCAL_BASE_DIR)/aws-sdk-swift"
let AWS_CRT_SWIFT_DIR = "\(LOCAL_BASE_DIR)/aws-crt-swift"
let SMITHY_SWIFT_DIR = "\(LOCAL_BASE_DIR)/smithy-swift"
let LOCAL_RELEASE_SWIFT_DIR = "\(AWS_SDK_SWIFT_DIR)/\(RELEASE)"

let package = Package(
    name: "AWSSwiftSDK",
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
            path: "./AWSClientRuntime/Sources"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ],
            path: "./AWSClientRuntime/Tests"
        )
    ]
)

let fileManager = FileManager.default
let awsSDKSwiftDir = fileManager.homeDirectoryForCurrentUser.appendingPathComponent(AWS_SDK_SWIFT_DIR)
let awsCRTSwiftDir = fileManager.homeDirectoryForCurrentUser.appendingPathComponent(AWS_CRT_SWIFT_DIR)
let smithySwiftDir = fileManager.homeDirectoryForCurrentUser.appendingPathComponent(SMITHY_SWIFT_DIR)

let localReleaseSwiftSDKDir = fileManager.homeDirectoryForCurrentUser.appendingPathComponent(LOCAL_RELEASE_SWIFT_DIR)

func setupDependencies() {
    package.dependencies += [
        .package(name: "AwsCrt", path: "\(awsCRTSwiftDir.path)"),
        .package(name: "ClientRuntime", path: "\(smithySwiftDir.appendingPathComponent("Packages").path)")
    ]
    let sdksToIncludeInTargets = try! FileManager.default.contentsOfDirectory(atPath: "\(localReleaseSwiftSDKDir.path)")
    includeTargets(sdksToIncludeInTargets)
}

func includeTargets(_ releasedSDKs: [String]) {
    var libs: [PackageDescription.Product] = []
    var targets: [PackageDescription.Target] = []
    for sdkName in releasedSDKs {
        libs.append(.library(name: sdkName, targets: [sdkName]))
        targets.append(.target(name: sdkName,
                               dependencies: [.product(name: "ClientRuntime", package: "ClientRuntime"), "AWSClientRuntime"],
                               path: "./\(RELEASE)/\(sdkName)"))
    }
    package.products += libs
    package.targets += targets
}

setupDependencies()


