//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@testable import AWSSDKSwiftCLI
import Algorithms
import XCTest
import AWSCLIUtils

class TestAWSSDKTests: CLITestCase {

    // MARK: Golden Path

    func testGoldenPath() throws {
        var commands: [String] = []
        var envs = [[String: String]?]()
        let runner = ProcessRunner {
            commands.append($0.commandString)
            envs.append($0.environment)
        }
        ProcessRunner.testRunner = runner

        let subject = TestAWSSDK.mock(batches: 4)
        try! subject.run()

        XCTAssertEqual(commands.count, 4)
        XCTAssertTrue(commands.allSatisfy { $0.hasSuffix("swift test") })
        XCTAssertEqual(envs.count, 4)
        XCTAssertEqual(envs, [
            [
                "AWS_SWIFT_SDK_BATCH_NUMBER": "0",
                "AWS_SWIFT_SDK_BATCH_TOTAL": "4",
                "AWS_SWIFT_SDK_ENABLE_SERVICE_TESTS": "true",
            ],
            [
                "AWS_SWIFT_SDK_BATCH_NUMBER": "1",
                "AWS_SWIFT_SDK_BATCH_TOTAL": "4",
                "AWS_SWIFT_SDK_ENABLE_SERVICE_TESTS": "true",
            ],
            [
                "AWS_SWIFT_SDK_BATCH_NUMBER": "2",
                "AWS_SWIFT_SDK_BATCH_TOTAL": "4",
                "AWS_SWIFT_SDK_ENABLE_SERVICE_TESTS": "true",
            ],
            [
                "AWS_SWIFT_SDK_BATCH_NUMBER": "3",
                "AWS_SWIFT_SDK_BATCH_TOTAL": "4",
                "AWS_SWIFT_SDK_ENABLE_SERVICE_TESTS": "true",
            ],
        ])
    }

    func testRunWhenBatchesIsOne() {
        var commands: [String] = []
        let runner = ProcessRunner {
            commands.append($0.commandString)
        }
        ProcessRunner.testRunner = runner
        let subject = TestAWSSDK.mock(batches: 1)
        try! subject.run()

        XCTAssertEqual(commands.count, 1)
        XCTAssertTrue(commands[0].hasSuffix("swift test"))
    }
}

// MARK: - Mocks

extension TestAWSSDK {
    static func mock(
        repoPath: String = ".",
        batches: UInt = 1
    ) -> Self {
        TestAWSSDK(
            repoPath: repoPath,
            batches: batches
        )
    }
}
