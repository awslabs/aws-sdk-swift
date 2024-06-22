//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ArgumentParser
import ClientRuntime

struct SPRPublish: AsyncParsableCommand {
    
    static var configuration = CommandConfiguration(
        commandName: "spr-publish",
        abstract: "Publishes a new version of a package to SPR."
    )

    @Option(help: "The ID of the package being published.  Must meet the requirements of the Swift Package Registry spec.")
    var id: String

    @Option(help: "The name of the package being published.  Must match the name defined in the package's Package.swift.")
    var name: String

    @Option(help: "The version of the package to be published, i.e. \"1.2.3\".  The version must be valid per Semantic Versioning 2.0 (https://semver.org/).")
    var version: String

    @Option(help: "The relative path to the Swift package being published.")
    var packagePath: String

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

    var checksum = ""

    mutating func run() async throws {
        await setOptions()
        try verifyPackage()
        try await uploadArchive()
        try await uploadManifest()
        try await uploadMetadata()
        try await updateList()
    }

    private mutating func setOptions() async {
        await SDKLoggingSystem.initialize(logLevel: .error)
        let env = ProcessInfo.processInfo.environment
        bucket = bucket ?? env["AWS_SDK_SPR_BUCKET"]
        if region.isEmpty {
            region = env["AWS_SDK_SPR_REGION"] ?? "us-east-1"
        }
        distributionID = distributionID ?? env["AWS_SDK_SPR_DISTRIBUTION_ID"]
    }
}
