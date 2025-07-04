//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct PerformanceTestRunner {

    var iterations: Int

    /// Executes the given test multiple times
    func runTest(
        _ perfTest: PerformanceTest
    ) async throws -> PerformanceTestResult {
        var measurements: [Double] = []

        for _ in 0..<iterations {
            measurements.append(try await perfTest.test())
        }

        let timestamp = Int(Date().timeIntervalSince1970)
        return PerformanceTestResult(
            name: perfTest.name,
            description: perfTest.description,
            unit: perfTest.unit.rawValue,
            date: timestamp,
            measurements: measurements,
            dimensions: perfTest.dimensions
        )
    }
}
