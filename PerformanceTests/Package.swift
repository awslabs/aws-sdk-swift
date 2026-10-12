// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SDKWorkbench",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .executable(
            name: "PerformanceTestRunner",
            targets: ["PerformanceTestRunner"]
        )
    ],
    dependencies: [
        .package(name: "aws-sdk-swift", path: ".."),
        .package(name: "smithy-swift", path: "../../smithy-swift"),

        // Keep this spec same as in smithy-swift.  See the comment there for why
        // swift-distributed-tracing is pinned below 1.6.0: tracing 1.6.0 ships
        // half of SDT-0002, and until swift-service-context releases its half,
        // resolving the two together makes `ServiceContext` ambiguous and
        // AsyncHTTPClient -- reached here via SmithySwiftNIO -- fails to compile.
        //
        // This has to be repeated here, and cannot be inherited from
        // smithy-swift: no target uses swift-distributed-tracing, so SwiftPM
        // prunes the dependency ("dependency 'swift-distributed-tracing' is not
        // used by any target") whenever smithy-swift is resolved as a dependency
        // rather than as the root package.  The constraint only binds in the
        // package that declares it, and this package is its own root.
        .package(url: "https://github.com/apple/swift-distributed-tracing.git", "1.3.0" ..< "1.6.0"),
    ],
    targets: [
        .executableTarget(
            name: "PerformanceTestRunner",
            dependencies: [
                .product(name: "AWSSTS", package: "aws-sdk-swift"),
                .product(name: "SmithySwiftNIO", package: "smithy-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift")
            ]
        ),
    ]
)
