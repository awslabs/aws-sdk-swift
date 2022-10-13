// swift-tools-version:5.4

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import PackageDescription
import class Foundation.FileManager
import class Foundation.ProcessInfo
import struct Foundation.URL

/*
 This Package.swift file is used to compile against locally
   - generated version of the AWS Swift SDK
   - checked out version of ClientRuntime
   - checked out version of AwsCrt

 Note: This Package.swift file is overwritten in our tagged releases


 In order to use setup local development:

 1. Install a Java 18 JDK if one is not already installed to your system.
   The OpenJDK-based Amazon Corretto JDK is available at https://aws.amazon.com/corretto .

 2. Create a folder:
   mkdir -p ~/Projects/Amplify/SwiftSDK
   cd ~/Projects/Amplify/SwiftSDK

 3. Checkout projects:
   git clone https://github.com/awslabs/aws-sdk-swift.git
   git clone https://github.com/awslabs/smithy-swift.git
   git clone https://github.com/awslabs/aws-crt-swift.git --recursive

 4.  Build
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
            .package(path: "/Users/<YourUserName>/Projects/Amplify/SwiftSDK/aws-sdk-swift")
        ],
        targets: [
             .target(
                 name: "YourNameHere",
                 dependencies: [.product(name: "AWSS3", package: "aws-sdk-swift")])
        ]
     )
*/

let RELEASE = "release"
let LOCAL_BASE_DIR = "Projects/Amplify/SwiftSDK"
let AWS_SDK_SWIFT_DIR = "\(LOCAL_BASE_DIR)/aws-sdk-swift"
let AWS_CRT_SWIFT_DIR = "\(LOCAL_BASE_DIR)/aws-crt-swift"
let SMITHY_SWIFT_DIR = "\(LOCAL_BASE_DIR)/smithy-swift"

let homePath = FileManager.default.homeDirectoryForCurrentUser
let env = ProcessInfo.processInfo.environment

let awsSDKSwiftDir, awsCRTSwiftDir, smithySwiftDir: URL
if let awsSDKSwiftCIPath = env["AWS_SDK_SWIFT_CI_DIR"], let awsCRTSwiftCIPath = env["AWS_CRT_SWIFT_CI_DIR"],
    let smithySwiftCIPath = env["SMITHY_SWIFT_CI_DIR"] {
    awsSDKSwiftDir = URL(fileURLWithPath: awsSDKSwiftCIPath)
    awsCRTSwiftDir = URL(fileURLWithPath: awsCRTSwiftCIPath)
    smithySwiftDir = URL(fileURLWithPath: smithySwiftCIPath)
} else {
    awsSDKSwiftDir = homePath.appendingPathComponent(AWS_SDK_SWIFT_DIR)
    awsCRTSwiftDir = homePath.appendingPathComponent(AWS_CRT_SWIFT_DIR)
    smithySwiftDir = homePath.appendingPathComponent(SMITHY_SWIFT_DIR)
}

let localReleaseSwiftSDKDir = awsSDKSwiftDir.appendingPathComponent(RELEASE)

private extension Package {

    func setupDependencies() -> Package {
        dependencies += [
            .package(name: "aws-crt-swift", path: awsCRTSwiftDir.path),
            .package(name: "smithy-swift", path: smithySwiftDir.path)
        ]

        let sdksToIncludeInTargets = try! FileManager.default.contentsOfDirectory(atPath: localReleaseSwiftSDKDir.path)
            .filter { target in
                !target.hasPrefix(".")
            }
        includeTargets(package: self, releasedSDKs: sdksToIncludeInTargets)
        return self
    }

    private func includeTargets(package: Package, releasedSDKs: [String]) {
        var libs: [PackageDescription.Product] = []
        var targets: [PackageDescription.Target] = []
        for sdkName in releasedSDKs {
            libs.append(.library(name: sdkName, targets: [sdkName]))
            targets.append(.target(name: sdkName,
                                   dependencies: [.product(name: "ClientRuntime", package: "smithy-swift"), "AWSClientRuntime"],
                                   path: "./\(RELEASE)/\(sdkName)"))
        }
        package.products += libs
        package.targets += targets
    }
}

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
                .product(name: "ClientRuntime", package: "smithy-swift"),
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift")
            ],
            path: "./AWSClientRuntime/Sources"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "smithy-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift")
            ],
            path: "./AWSClientRuntime/Tests"
        )
    ]
).setupDependencies()
