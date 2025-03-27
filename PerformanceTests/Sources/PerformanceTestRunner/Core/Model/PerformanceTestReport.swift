//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct PerformanceTestReport: Codable {
    var productId: String = "AWS SDK for Swift"
    let sdkVersion: String?
    let commitId: String
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
