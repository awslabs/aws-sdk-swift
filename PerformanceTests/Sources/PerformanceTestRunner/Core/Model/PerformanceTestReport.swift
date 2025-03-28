//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Represents a report containing the results of performance tests.
struct PerformanceTestReport: Codable {
    /// The product ID of the SDK.
    var productId: String = "AWS SDK for Swift"

    /// The version of the SDK. Optional.
    let sdkVersion: String?

    /// The git commit ID.
    let commitId: String

    /// An array of result objects, representing the results of each test that was run.
    let results: [PerformanceTestResult]
}

extension PerformanceTestReport {
    func printFormatted() {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted

        if let jsonData = try? jsonEncoder.encode(self),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Error encoding JSON")
        }
    }
}
