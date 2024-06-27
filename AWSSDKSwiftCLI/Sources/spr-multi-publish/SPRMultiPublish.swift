//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ArgumentParser
import SPR
import AWSCLIUtils

@main
struct SPRMultiPublish: AsyncParsableCommand {

    static var configuration = CommandConfiguration(
        commandName: "spr-multi-publish",
        abstract: "Publishes a new version of all aws-sdk-swift & smithy-swift packages to SPR."
    )

    @Option(help: "The scope of the package being published.  Must meet the requirements of the Swift Package Registry spec.")
    var scope: String

    @Option(help: "The version of the package to be published, i.e. \"1.2.3\".  The version must be valid per Semantic Versioning 2.0 (https://semver.org/).")
    var version: String

    @Option(help: "The AWS region in which the registry is located.  Alternate to this option, the region may be obtained from environment var AWS_SDK_SPR_REGION.  Defaults to us-east-1.")
    var region: String = ""

    @Option(help: "The bucket name for the S3 bucket hosting the Registry. Alternate to this option, the bucket may be obtained from environment var AWS_SDK_SPR_BUCKET.")
    var bucket: String?

    @Option(help: "The base URL for the registry.")
    var url: String

    @Option(help: "The CloudFront distribution ID for the registry.  Alternate to this option, the distribution ID may be obtained from environment var AWS_SDK_SPR_DISTRIBUTION_ID.")
    var distributionID: String?

    @Option(help: "If true, any existing release matching this version will be replaced.  If false and the selected version already exists, the publish command fails.  Defaults to false.")
    var replace = false

    mutating func run() async throws {
        let allPackages = try runtimePackages + serviceClientPackages
        for (name, path) in allPackages {
            log("Package: \(name)")
            log("    Path: \(path)")
            let manifestURL = URL(fileURLWithPath: path).standardizedFileURL
            guard FileManager.default.fileExists(atPath: manifestURL.path) else {
                throw Error("File does not exist at \(manifestURL)")
            }
//            var publisher = SPRPublisher(
//                scope: scope,
//                name: name,
//                version: version,
//                path: path,
//                region: region,
//                bucket: bucket,
//                url: url,
//                distributionID: distributionID,
//                replace: replace
//            )
//            try await publisher.run()
        }
    }

    private var runtimePackages: [(String, String)] {
        return [
            ("smithy-swift", "../../smithy-swift/"),
            runtimePackage("AWSClientRuntime"),
            runtimePackage("AWSSDKChecksums"),
            runtimePackage("AWSSDKCommon"),
            runtimePackage("AWSSDKEventStreamsAuth"),
            runtimePackage("AWSSDKHTTPAuth"),
            runtimePackage("AWSSDKIdentity"),
        ]
    }

    private var serviceClientPackages: [(String, String)] {
        get throws {
            try FileManager.default
                .contentsOfDirectory(atPath: "../Sources/Services")
                .sorted()
                .filter { !$0.hasPrefix(".") }
                .map { serviceClientPackage($0) }
        }
    }

    private func runtimePackage(_ name: String) -> (String, String) {
        return (name, "../Sources/Core/\(name)/")
    }

    private func serviceClientPackage(_ name: String) -> (String, String) {
        return (name, "../Sources/Services/\(name)/")
    }
}
