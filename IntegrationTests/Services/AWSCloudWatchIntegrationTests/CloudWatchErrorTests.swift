//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSCloudWatch
import ClientRuntime
import AWSClientRuntime

/// Tests Cloudwatch Errors
class CloudWatchErrorTests: XCTestCase {

    private var client: CloudWatchClient!
    private let region = "us-west-2"

    override func setUp() async throws {
        self.client = try CloudWatchClient(region: "us-west-2")
    }

    // this test can be removed once smoke tests are run in all builds
    func test_AmbiguousError() async throws {
        do {
            let response = try await client.getDashboard(input: .init(dashboardName: "foo"))
            XCTFail("Expected ResourceNotFound error but got successful response: \(response)")
        } catch let error as DashboardNotFoundError {
            // Test passed - we expected this error
            XCTAssertEqual(error.errorCode, "ResourceNotFound")
        } catch {
            XCTFail("Expected ResourceNotFound error but got different error: \(error)")
        }
    }
}
