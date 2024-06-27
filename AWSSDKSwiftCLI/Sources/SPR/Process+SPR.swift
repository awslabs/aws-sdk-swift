//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import PackageDescription
import AWSCLIUtils

extension Process {

    enum SPR {
        /// Returns a process for executing `swift describe --type json` in a relative path
        static func describe(packagePath: String) -> Process {
            let process = sprProcess(["swift", "package", "describe", "--type", "json"])
            let packageURL = URL(fileURLWithPath: packagePath).standardizedFileURL
            process.currentDirectoryURL = packageURL
            log("package file URL: \(packageURL)")
            return process
        }

        static func archive(name: String, packagePath: String, archiveFileURL: URL) -> Process {
            let process = sprProcess(["swift", "package", "archive-source", "--output", archiveFileURL.path()])
            let packageFileURL = URL(fileURLWithPath: packagePath).standardizedFileURL
            process.currentDirectoryURL = packageFileURL
            return process
        }

        static func checksum(archiveFileURL: URL) -> Process {
            sprProcess(["shasum", "-b", "-a", "256", archiveFileURL.path()])
        }

        /// Returns a process for executing SPR commands.
        private static func sprProcess(_ args: [String]) -> Process {
            Process(args)
        }
    }
}
