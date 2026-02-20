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
        self.client = try CloudWatchClient(region: region)
    }

    // Per discussion with Smithy, this test should resolve to `ResourceNotFound` instead of
    // `DashboardNotFound` as this test did previously, because the query-compatible
    // code should be checked against shape names for a match before attempting to match it
    // against an awsQueryError value.
    func test_AmbiguousError() async throws {
        do {
            let response = try await client.getDashboard(input: .init(dashboardName: "foo"))
            XCTFail("Expected ResourceNotFound error but got successful response: \(response)")
        } catch let error as ResourceNotFound {
            // Test passed - we expected this error
            XCTAssertEqual(error.errorCode, "ResourceNotFound")
        } catch {
            XCTFail("Expected ResourceNotFound error but got different error: \(error)")
        }
    }
}
