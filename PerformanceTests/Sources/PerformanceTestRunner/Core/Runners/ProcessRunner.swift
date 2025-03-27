//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct ProcessRunner {
    static func runProcess(
        executable: String = "/usr/bin/env",
        arguments: [String]
    ) -> String {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: executable)
        process.arguments = arguments

        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = Pipe()

        do {
            try process.run()
            process.waitUntilExit()
            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            return String(data: outputData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        } catch {
            print("ProcessRunner Error: \(error.localizedDescription)")
            return ""
        }
    }

    /// Retrieves the current Git commit ID.
    static func getGitCommitId() -> String {
        return ProcessRunner.runProcess(arguments: ["git", "rev-parse", "HEAD"])
    }

    /// Retrieves the SDK version from a file.
    static func getSdkVersion() -> String {
        return ProcessRunner.runProcess(arguments: ["cat", "../../aws-sdk-swift/Package.version"])
    }
}
