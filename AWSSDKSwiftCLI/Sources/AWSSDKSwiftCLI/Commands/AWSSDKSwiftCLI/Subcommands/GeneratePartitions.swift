//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation
import AWSCLIUtils

struct GeneratePartitionsCommand: ParsableCommand {

    static var configuration = CommandConfiguration(
        commandName: "generate-partitions",
        abstract: "Generates the Partitions.swift file for the AWSSDKDynamic target."
    )

    @Argument(help: "The path to the aws-sdk-swift repository")
    var repoPath: String

    func run() throws {
        try PartitionsBuilder(
            repoPath: repoPath
        ).generatePartitionsFile()
    }
}
