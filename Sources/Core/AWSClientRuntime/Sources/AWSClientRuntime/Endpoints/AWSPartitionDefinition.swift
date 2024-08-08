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

public class PartitionData {
    private static var cachedPartitionJSON: String?
    // Use a dispatch queue to synchronize access to the cache
    private static let cacheQueue = DispatchQueue(label: "awsClientRuntime.partitionCacheQueue", attributes: .concurrent)

    // Loading trebuchet-provided sdk-partitions.json
    public static func loadAWSPartitionJSON() throws -> String {
        // Read from cache if available
        if let cached = getCachedPartitionJSON() {
            return cached
        }

        guard let url = Bundle.module.url(forResource: "sdk-partitions", withExtension: "json") else {
            throw PartitionLoadingError.fileNotFound
        }

        do {
            let partitionJSON = try String(contentsOf: url, encoding: .utf8)
            setCachedPartitionJSON(partitionJSON)
            return partitionJSON
        } catch {
            throw PartitionLoadingError.readError("Failed to read the partitions file: \(error)")
        }
    }

    private static func getCachedPartitionJSON() -> String? {
        var cached: String?
        cacheQueue.sync {
            cached = cachedPartitionJSON
        }
        return cached
    }

    private static func setCachedPartitionJSON(_ json: String) {
        cacheQueue.async(flags: .barrier) {
            self.cachedPartitionJSON = json
        }
    }
}
