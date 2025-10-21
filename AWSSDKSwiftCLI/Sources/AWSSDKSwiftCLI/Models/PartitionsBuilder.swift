//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

struct PartitionsBuilder {
    let repoPath: String
    let partitionsFilePath: String
    let partitionsSwiftFilePath: String

    init(
        repoPath: String,
        partitionsFilePath: String = "codegen/sdk-codegen/sdk-partitions.json",
        partitionsSwiftFilePath: String = "Sources/Core/AWSSDKDynamic/Sources/AWSSDKDynamic/Partitions.swift"
    ) {
        self.repoPath = repoPath
        self.partitionsFilePath = partitionsFilePath
        self.partitionsSwiftFilePath = partitionsSwiftFilePath
    }

    func generatePartitionsFile() throws {
        let repoFileURL = URL(fileURLWithPath: repoPath)
        let partitionsFileURL = repoFileURL.appending(path: partitionsFilePath)
        let partitionsData = try Data(contentsOf: partitionsFileURL)
        guard let partitions = String(data: partitionsData, encoding: .utf8) else {
            throw Error("sdk-partitions.json does not contain UTF-8 data.")
        }
        _ = try JSONSerialization.jsonObject(with: partitionsData) // verifies partitions are valid JSON
        let partitionsSwiftFileContents = """
            //
            // Copyright Amazon.com Inc. or its affiliates.
            // All Rights Reserved.
            //
            // SPDX-License-Identifier: Apache-2.0
            //
            
            // Code is auto-generated. DO NOT EDIT!
            
            public let partitions = #\"\"\"
            \(partitions)
            \"\"\"#
            
            """
        let partitionsSwiftFileURL =
            repoFileURL.appending(path: partitionsSwiftFilePath)
        try FileManager.default.createDirectory(
            at: partitionsSwiftFileURL.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        try Data(partitionsSwiftFileContents.utf8).write(to: partitionsSwiftFileURL)
    }
}
