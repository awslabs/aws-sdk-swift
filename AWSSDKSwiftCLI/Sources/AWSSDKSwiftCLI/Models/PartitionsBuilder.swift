//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import struct AWSCLIUtils.Error

struct PartitionsBuilder {
    let partitionsFileURL: URL
    let partitionsSwiftFileURL: URL

    // MARK: - init

    init(repoPath: String) {
        let repoFileURL = URL(fileURLWithPath: repoPath)
        self.init(
            partitionsFileURL: repoFileURL.appendingPathComponent("codegen/sdk-codegen/sdk-partitions.json"),
            partitionsSwiftFileURL: repoFileURL.appendingPathComponent(
                "Sources/Core/AWSSDKDynamic/Sources/AWSSDKDynamic/Partitions.swift"
            )
        )
    }

    init(
        partitionsFileURL: URL,
        partitionsSwiftFileURL: URL
    ) {
        self.partitionsFileURL = partitionsFileURL
        self.partitionsSwiftFileURL = partitionsSwiftFileURL
    }

    // MARK: - Code generation

    func generatePartitionsFile() throws {
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
        try FileManager.default.createDirectory(
            at: partitionsSwiftFileURL.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        try Data(partitionsSwiftFileContents.utf8).write(to: partitionsSwiftFileURL)
    }
}
