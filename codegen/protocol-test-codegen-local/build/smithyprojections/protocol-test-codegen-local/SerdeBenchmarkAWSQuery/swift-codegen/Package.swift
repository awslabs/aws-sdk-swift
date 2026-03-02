// swift-tools-version: 5.9.0

import PackageDescription

let package = Package(
    name: "SerdeBenchmarkAWSQuery",
    platforms: [
        .macOS(.v12), .iOS(.v13)
    ],
    products: [
        .library(name: "SerdeBenchmarkAWSQuery", targets: ["SerdeBenchmarkAWSQuery"])
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
            name: "SerdeBenchmarkAWSQuery",
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
                    name: "SmithyFormURL",
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
                .product(
                    name: "SmithyXML",
                    package: "smithy-swift"
                ),
            ]
        ),
        .testTarget(
            name: "SerdeBenchmarkAWSQueryTests",
            dependencies: [
                "SerdeBenchmarkAWSQuery",
                .product(
                    name: "SmithyTestUtil",
                    package: "smithy-swift"
                ),
            ]
        )
    ]
)
