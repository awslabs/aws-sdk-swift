// swift-tools-version:5.4.0

import PackageDescription
import class Foundation.ProcessInfo
import class Foundation.FileManager

let baseDir = "./protocol-test-codegen/build/smithyprojections/protocol-test-codegen"
let baseDirLocal = "./protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local"

let package = Package(
    name: "ProtocolCodegenTests",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        .library(name: "AWSRestJsonTestSDK", targets: ["AWSRestJsonTestSDK"]),
        .library(name: "AWSJson1_0TestSDK", targets: ["AWSJson1_0TestSDK"]),
        .library(name: "AWSJson1_1TestSDK", targets: ["AWSJson1_1TestSDK"]),
        .library(name: "RestXmlTestSDK", targets: ["RestXmlTestSDK"]),
        .library(name: "AWSQueryTestSDK", targets: ["AWSQueryTestSDK"]),

        .library(name: "aws_restjson", targets: ["aws_restjson"]),
        .library(name: "rest_json_extras", targets: ["rest_json_extras"])
    ],
    targets: [
        .target(
            name: "AWSRestJsonTestSDK",
            dependencies: [
                .product(name: "ClientRuntime",
                         package: "ClientRuntime"
                ),
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
            ],
            path: "\(baseDir)/aws-restjson/swift-codegen/AWSRestJsonTestSDK"
        ),
        .testTarget(
            name: "AWSRestJsonTestSDKTests",
            dependencies: [
                "AWSRestJsonTestSDK",
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ],
            path: "\(baseDir)/aws-restjson/swift-codegen/AWSRestJsonTestSDKTests"
        ),
        
        .target(
            name: "AWSJson1_0TestSDK",
            dependencies: [
                .product(
                    name: "ClientRuntime",
                    package: "ClientRuntime"
                ),
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
            ],
            path: "\(baseDir)/aws-json-10/swift-codegen/AWSJson1_0TestSDK"
        ),
        .testTarget(
            name: "AWSJson1_0TestSDKTests",
            dependencies: [
                "AWSJson1_0TestSDK",
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ],
            path: "\(baseDir)/aws-json-10/swift-codegen/AWSJson1_0TestSDKTests"
        ),
        .target(
            name: "AWSJson1_1TestSDK",
            dependencies: [
                .product(
                    name: "ClientRuntime",
                    package: "ClientRuntime"
                ),
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
            ],
            path: "\(baseDir)/aws-json-11/swift-codegen/AWSJson1_1TestSDK"
        ),
        .testTarget(
            name: "AWSJson1_1TestSDKTests",
            dependencies: [
                "AWSJson1_1TestSDK",
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ],
            path: "\(baseDir)/aws-json-11/swift-codegen/AWSJson1_1TestSDKTests"
        ),
        .target(
            name: "RestXmlTestSDK",
            dependencies: [
                .product(
                    name: "ClientRuntime",
                    package: "ClientRuntime"
                ),
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
            ],
            path: "\(baseDir)/rest-xml/swift-codegen/RestXmlTestSDK"
        ),
        .testTarget(
            name: "RestXmlTestSDKTests",
            dependencies: [
                "RestXmlTestSDK",
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ],
            path: "\(baseDir)/rest-xml/swift-codegen/RestXmlTestSDKTests"
        ),
        .target(
            name: "AWSQueryTestSDK",
            dependencies: [
                .product(
                    name: "ClientRuntime",
                    package: "ClientRuntime"
                ),
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
            ],
            path: "\(baseDir)/aws-query/swift-codegen/AWSQueryTestSDK"
        ),
        .testTarget(
            name: "AWSQueryTestSDKTests",
            dependencies: [
                "AWSQueryTestSDK",
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ],
            path: "\(baseDir)/aws-query/swift-codegen/AWSQueryTestSDKTests"
        ),
        .target(
            name: "aws_restjson",
            dependencies: [
                .product(
                    name: "ClientRuntime",
                    package: "ClientRuntime"
                ),
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
            ],
            path: "\(baseDirLocal)/aws-restjson/swift-codegen/aws_restjson"
        ),
        .testTarget(
            name: "aws_restjsonTests",
            dependencies: [
                "aws_restjson",
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ],
            path: "\(baseDirLocal)/aws-restjson/swift-codegen/aws_restjsonTests"
        ),
        .target(
            name: "rest_json_extras",
            dependencies: [
                .product(
                    name: "ClientRuntime",
                    package: "ClientRuntime"
                ),
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
            ],
            path: "\(baseDirLocal)/rest_json_extras/swift-codegen/rest_json_extras"
        ),
        .testTarget(
            name: "rest_json_extrasTests",
            dependencies: [
                "rest_json_extras",
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ],
            path: "\(baseDirLocal)/rest_json_extras/swift-codegen/rest_json_extrasTests"
        )
    ]
)
    
if let smithySwiftDir = ProcessInfo.processInfo.environment["SMITHY_SWIFT_CI_DIR"],
   let sdkDir = ProcessInfo.processInfo.environment["AWS_SDK_SWIFT_CI_DIR"] {
    package.dependencies += [
        .package(name: "ClientRuntime", path: "\(smithySwiftDir)/Packages"),
        .package(name: "AWSClientRuntime", path: "\(sdkDir)/AWSClientRuntime"),
    ]
} else {
    package.dependencies += [
        .package(name: "ClientRuntime", path: "~/Projects/Amplify/SwiftSDK/smithy-swift/Packages"),
        .package(name: "AWSClientRuntime", path: "~/Projects/Amplify/SwiftSDK/aws-sdk-swift/AWSClientRuntime"),
    ]
}
