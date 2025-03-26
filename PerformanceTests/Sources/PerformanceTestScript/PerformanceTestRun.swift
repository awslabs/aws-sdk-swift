//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

// MARK: - Main Entry Point
@main
struct PerformanceTestRun {
    static func main() async throws {
        let runner = BenchmarkRunner(iterations: 5)
        let commitId = ProcessRunner.getGitCommitId()
        let sdkVersion = ProcessRunner.getSdkVersion()

        // Add more tests here
        let performanceTests = [
            AWSSTSGetCallerIdentity()
        ]

        var benchmarks: [BenchmarkResult] = []
        for test in performanceTests {
            let result = try await runner.runBenchmark(test)
            benchmarks.append(result)
        }

        let report = BenchmarkReport(
            productId: "AWS SDK for Swift",
            sdkVersion: sdkVersion,
            commitId: commitId,
            results: benchmarks
        )
        report.printFormatted()
    }
}
