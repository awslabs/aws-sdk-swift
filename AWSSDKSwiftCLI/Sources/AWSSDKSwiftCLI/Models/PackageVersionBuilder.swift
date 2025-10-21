//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

struct PackageVersionBuilder {
    let packageVersionFileURL: URL
    let packageVersionSwiftFileURL: URL

    init(repoPath: String) {
        let repoFileURL = URL(fileURLWithPath: repoPath)
        self.packageVersionFileURL = repoFileURL.appending(path: "Package.version.next")
        self.packageVersionSwiftFileURL = repoFileURL.appending(path: "Sources/Core/AWSSDKDynamic/Sources/AWSSDKDynamic/PackageVersion.swift")
    }

    init(
        packageVersionFileURL: URL,
        packageVersionSwiftFileURL: URL
    ) {
        self.packageVersionFileURL = packageVersionFileURL
        self.packageVersionSwiftFileURL = packageVersionSwiftFileURL
    }

    func generatePackageVersionFile() throws {
        let currentVersionData = try Data(contentsOf: packageVersionFileURL)
        guard let packageVersion = String(data: currentVersionData, encoding: .utf8) else {
            throw Error("Package.version.next does not contain UTF-8 data.")
        }
        _ = try Version(packageVersion) // throws if currentVersion is not a valid version string
        let packageVersionFileContents = """
            //
            // Copyright Amazon.com Inc. or its affiliates.
            // All Rights Reserved.
            //
            // SPDX-License-Identifier: Apache-2.0
            //
            
            // Code is auto-generated. DO NOT EDIT!
            
            public let packageVersion = "\(packageVersion.trimmingCharacters(in: .whitespacesAndNewlines))"
            """
        try FileManager.default.createDirectory(
            at: packageVersionSwiftFileURL.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        try Data(packageVersionFileContents.utf8).write(to: packageVersionSwiftFileURL)
    }
}
