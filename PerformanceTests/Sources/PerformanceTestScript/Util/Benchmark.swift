//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct BenchmarkResult: Codable {
    let name: String
    let description: String
    let unit: String
    let date: Int
    let measurements: [Double]
    let dimensions: [Dimension]?
}

struct Dimension: Codable {
    let name: String
    let value: String
}

struct BenchmarkReport: Codable {
    let productId: String
    let sdkVersion: String?
    let commitId: String
    let results: [BenchmarkResult]
}

struct BenchmarkRunner {

    var iterations: Int

    /// Executes the given test multiple times
    func runBenchmark(
        _ perfTest: PerformanceTest
    ) async throws -> BenchmarkResult {
        var measurements: [Double] = []

        for _ in 0..<iterations {
            measurements.append(try await perfTest.test())
        }

        let timestamp = Int(Date().timeIntervalSince1970)
        return BenchmarkResult(
            name: perfTest.name,
            description: perfTest.description,
            unit: perfTest.unit,
            date: timestamp,
            measurements: measurements,
            dimensions: perfTest.dimensions
        )
    }
}

extension BenchmarkReport {
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
