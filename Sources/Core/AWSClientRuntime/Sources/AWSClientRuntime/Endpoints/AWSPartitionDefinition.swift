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

actor PartitionDataCache {
    private var cachedPartitionJSON: String?

    func getCachedPartitionJSON() -> String? {
        return cachedPartitionJSON
    }

    func setCachedPartitionJSON(_ json: String) {
        cachedPartitionJSON = json
    }
}

public class PartitionData {
    private static let cache = PartitionDataCache()

    // Loading trebuchet-provided sdk-partitions.json
    public static func loadAWSPartitionJSON() async throws -> String {
        // Read from cache if available
        if let cached = await cache.getCachedPartitionJSON() {
            return cached
        }

        guard let url = Bundle.module.url(forResource: "sdk-partitions", withExtension: "json") else {
            throw PartitionLoadingError.fileNotFound
        }

        do {
            let partitionJSON = try String(contentsOf: url, encoding: .utf8)
            await cache.setCachedPartitionJSON(partitionJSON)
            return partitionJSON
        } catch {
            throw PartitionLoadingError.readError("Failed to read the partitions file: \(error)")
        }
    }
}
