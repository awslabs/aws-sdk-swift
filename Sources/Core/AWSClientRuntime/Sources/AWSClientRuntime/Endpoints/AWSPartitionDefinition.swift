//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

enum PartitionLoadingError: Error {
    case fileNotFound
    case readError(String)
}

// Loading trebuchet-provided sdk-partitions.json
public func loadAWSPartitionJSON() throws -> String {
    guard let url = Bundle.main.url(forResource: "sdk-partitions", withExtension: "json") else {
        throw PartitionLoadingError.fileNotFound
    }

    do {
        return try String(contentsOf: url, encoding: .utf8)
    } catch {
        throw PartitionLoadingError.readError("Failed to read the partitions file: \(error)")
    }
}
