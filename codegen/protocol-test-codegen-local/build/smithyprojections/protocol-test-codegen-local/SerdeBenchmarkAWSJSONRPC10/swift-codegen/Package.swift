// swift-tools-version: 5.9.0

import PackageDescription

let package = Package(
    name: "SerdeBenchmarkAWSJSONRPC10",
    platforms: [
        .macOS(.v12), .iOS(.v13)
    ],
    products: [
        .library(name: "SerdeBenchmarkAWSJSONRPC10", targets: ["SerdeBenchmarkAWSJSONRPC10"])
    ],
    dependencies: [
        .package(
            url: "aws-sdk-swift",
            exact: "0.0.1"
        ),
        .package(
            url: "https://github.com/smithy-lang/smithy-swift",
            exact: "0.0.1"
        ),
    ],
    targets: [
        .target(
            name: "SerdeBenchmarkAWSJSONRPC10",
            dependencies: [
                .product(
                    name: "AWSClientRuntime",
                    package: "AWSClientRuntime"
                ),
                .product(
                    name: "AWSSDKChecksums",
                    package: "AWSSDKChecksums"
                ),
                .product(
                    name: "AWSSDKHTTPAuth",
                    package: "AWSSDKHTTPAuth"
                ),
                .product(
                    name: "AWSSDKIdentity",
                    package: "AWSSDKIdentity"
                ),
                .product(
                    name: "ClientRuntime",
                    package: "smithy-swift"
                ),
                .product(
                    name: "Smithy",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyHTTPAPI",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyHTTPAuthAPI",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyIdentity",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyJSON",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyReadWrite",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyRetries",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyRetriesAPI",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyTestUtil",
                    package: "smithy-swift"
                ),
                .product(
                    name: "SmithyTimestamps",
                    package: "smithy-swift"
                ),
            ]
        ),
        .testTarget(
            name: "SerdeBenchmarkAWSJSONRPC10Tests",
            dependencies: [
                "SerdeBenchmarkAWSJSONRPC10",
                .product(
                    name: "SmithyTestUtil",
                    package: "smithy-swift"
                ),
            ]
        )
    ]
)
