//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser

@main
struct AWSSDKSwiftCLI: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "AWSSDKSwiftCLI",
        abstract: "CLI for managing the AWS SDK for Swift",
        subcommands: [
            GeneratePackageManifestCommand.self,
            PrepareReleaseCommand.self,
            SyncClientRuntimeVersionCommand.self,
            TestAWSSDKCommand.self,
            GenerateDocIndexCommand.self,
            SPRPublish.self,
        ]
    )
}
