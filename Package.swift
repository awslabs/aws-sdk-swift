// swift-tools-version:5.4
import PackageDescription
import class Foundation.FileManager

let releasedSDKs = ["Cognitoidentity",
                    "Cognitoidentityprovider",
                    "Dynamodb",
                    "Lambda",
                    "Pinpoint",
                    "S3",
                    "Secretsmanager"]

let ALPHA_SWIFT_SDK = "AlphaSwiftSDK"
let LOCAL_BASE_DIR = "Projects/Amplify/SwiftSDK"
let AWS_SDK_SWIFT_DIR = "\(LOCAL_BASE_DIR)/aws-sdk-swift"
let AWS_CRT_SWIFT_DIR = "\(LOCAL_BASE_DIR)/aws-crt-swift"
let SMITHY_SWIFT_DIR = "\(LOCAL_BASE_DIR)/smithy-swift"
let ALPHA_SWIFT_DIR = "\(AWS_SDK_SWIFT_DIR)/\(ALPHA_SWIFT_SDK)"

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

let localAlphaSwiftSDKDir = fileManager.homeDirectoryForCurrentUser.appendingPathComponent(ALPHA_SWIFT_DIR)

enum ExecutionMode {
    case LocalDevelopment
    case ReleaseBranch
}

func determineExecutionMode() -> ExecutionMode {
    if FileManager.default.fileExists(atPath: localAlphaSwiftSDKDir.path) {
        return .LocalDevelopment
    }
    return .ReleaseBranch
}

func setupDependencies(executionMode: ExecutionMode) {
    var sdksToIncludeInTargets: [String]
    switch(executionMode) {
    case .LocalDevelopment:
        package.dependencies += [
            .package(name: "AwsCrt", path: "\(awsCRTSwiftDir.path)"),
            .package(name: "ClientRuntime", path: "\(smithySwiftDir.appendingPathComponent("Packages").path)")
        ]
        sdksToIncludeInTargets = try! FileManager.default.contentsOfDirectory(atPath: "\(localAlphaSwiftSDKDir.path)")
    case .ReleaseBranch:
        let relatedDependenciesBranch = "master"
        package.dependencies += [
            .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch(relatedDependenciesBranch)),
            .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift", .branch(relatedDependenciesBranch))
        ]
        sdksToIncludeInTargets = releasedSDKs
    }
    includeTargets(sdksToIncludeInTargets)
}

func includeTargets(_ releasedSDKs: [String]) {
    var libs: [PackageDescription.Product] = []
    var targets: [PackageDescription.Target] = []
    for sdkName in releasedSDKs {
        libs.append(.library(name: sdkName, targets: [sdkName]))
        targets.append(.target(name: sdkName,
                               dependencies: [.product(name: "ClientRuntime", package: "ClientRuntime"), "AWSClientRuntime"],
                               path: "./\(ALPHA_SWIFT_SDK)/\(sdkName)"))
    }
    package.products += libs
    package.targets += targets
}

setupDependencies(executionMode: determineExecutionMode())

