// swift-tools-version:5.5
import PackageDescription
import class Foundation.FileManager
import class Foundation.JSONDecoder
import struct Foundation.URL
import struct Foundation.Data
import struct ObjectiveC.ObjCBool

let rootURL = URL(fileURLWithPath: #file).deletingLastPathComponent()
let filterFileURL = rootURL.appendingPathComponent("filter.json")
let releaseURL = rootURL.appendingPathComponent("release")

var isDirectory = ObjCBool(true)
if !FileManager.default.fileExists(atPath: releaseURL.path, isDirectory: &isDirectory) || !isDirectory.boolValue {
    fatalError("Please check out a branch using a release tag. [git checkout -b v0.2.2 0.2.2]")
}

let clientRuntime: Target.Dependency = .product(name: "ClientRuntime", package: "ClientRuntime")
let clients = try FileManager.default
    .contentsOfDirectory(atPath: releaseURL.path)
    .filter { $0.hasPrefix("AWS") }

var filter: [String]? {
    guard FileManager.default.fileExists(atPath: filterFileURL.path),
        let data = try? Data(contentsOf: filterFileURL),
        let filter = try? JSONDecoder().decode([String].self, from: data) else {
            return nil
        }

    return filter
}

var filteredClients: [String] {
    guard let filter = filter else {
        // return all clients if there is no filter
        return clients
    }
    let filtered = clients.filter {
        filter.contains($0)
    }
    return filtered
}

var clientProducts: [Product] {
    filteredClients.map {
        .library(name: $0, targets: [$0])
    }
}

var clientTargets: [Target] {
    filteredClients.map {
        .target(name: $0, dependencies: [
                clientRuntime, 
                "AWSClientRuntime"
            ], 
            path: "release/\($0)")
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
    ] + clientProducts,
    dependencies: [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift.git", from: "0.2.2"),
        .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift.git", from: "0.2.3")
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ]
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ]
        ),
    ] + clientTargets
)

