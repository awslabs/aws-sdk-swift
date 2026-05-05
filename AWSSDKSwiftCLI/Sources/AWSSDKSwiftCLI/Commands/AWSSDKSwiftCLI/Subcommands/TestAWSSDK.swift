//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Algorithms
import ArgumentParser
import Foundation
import AWSCLIUtils

// MARK: - Command

struct TestAWSSDKCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "test-aws-sdk",
        abstract: "Builds the package and executes its tests",
        discussion: "swift test"
    )
    
    @Argument(help: "The path to the aws-sdk-swift repository")
    var repoPath: String
    
    @Option(help: "The number of test batches")
    var batches: UInt = 1
    
    func run() throws {
        try TestAWSSDK(repoPath: repoPath, batches: batches).run()
    }
}

// MARK: - TestAWSSDK

struct TestAWSSDK {
    /// The path to the aws-sdk-swift repository.
    let repoPath: String
    
    /// The number of test batches.
    ///
    /// The actual number of batches may be smaller depending on the number of services.
    let batches: UInt

    func run() throws {
        try FileManager.default.changeWorkingDirectory(repoPath)
        
        // If batches is 1, then run `swift test` with the current Package.swift
        guard batches > 1 else {
            log("Testing Package.swift...")
            let task = Process.swift.test()
            try _run(task)
            return
        }

        for batch in 0..<batches {
            log("Testing batch \(batch) (\(batch + 1) of \(batches))")
            let testProcess = testProcess(batch: batch, of: batches)
            try _run(testProcess)
        }
    }

    // MARK: - Helpers

    private func testProcess(batch: UInt, of batches: UInt) -> Process {
        let envVars = [
            "AWS_SWIFT_SDK_BATCH_NUMBER": "\(batch)",
            "AWS_SWIFT_SDK_BATCH_TOTAL": "\(batches)",
            "AWS_SWIFT_SDK_ENABLE_SERVICE_TESTS": "true",
        ]
        return Process.swift.test(envVars: envVars)
    }
}
