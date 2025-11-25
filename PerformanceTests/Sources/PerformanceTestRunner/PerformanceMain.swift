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
struct PerformanceMain {
    static func main() async throws {
        let runner = PerformanceTestRunner(iterations: 5)
        let commitId = ProcessRunner.getGitCommitId()
        let sdkVersion = ProcessRunner.getSdkVersion()

        // Add more tests here
        let performanceTests: [PerformanceTest] = [
            AWSSTSGetCallerIdentity(),
            AWSSTSGetCallerIdentityNIO()
        ]

        var results: [PerformanceTestResult] = []
        for test in performanceTests {
            let result = try await runner.runTest(test)
            results.append(result)
        }

        let report = PerformanceTestReport(
            sdkVersion: sdkVersion,
            commitId: commitId,
            results: results
        )
        report.printFormatted()
    }
}
