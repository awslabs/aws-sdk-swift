//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSCloudWatch
import ClientRuntime
@_spi(UnknownAWSHTTPServiceError) import AWSClientRuntime
import SmithyHTTPAPI
import AwsCommonRuntimeKit

/// Tests Cloudwatch Errors
class CloudWatchErrorTests: XCTestCase {

    // this test can be removed when smoke tests are run during all builds
    func test_AmbiguousError() async throws {
        let client = try CloudWatchClient(region: "us-west-2")
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

    func test_awsUnknownError() async throws {
        let errorCode = "UnmodeledError"
        let requestID = "abc123def456"

        // Create a HTTPResponse with an unmodeled CBOR error
        let bodyEncoder = try CBOREncoder()
        bodyEncoder.encode(.map_start(1))
        bodyEncoder.encode(.text("__type"))
        bodyEncoder.encode(.text(errorCode))
        let response = HTTPResponse(
            headers: Headers([
                "Content-Type": "application/cbor",
                "smithy-protocol": "rpc-v2-cbor",
                "x-amz-request-id": requestID
            ]),
            body: .data(Data(bodyEncoder.getEncoded())),
            statusCode: .badRequest
        )

        // Create a client, mocked with the unmodeled error response
        let config = try await CloudWatchClient.Configuration(
            region: "us-west-2",
            httpClientEngine: MockHTTPClient(response: response)
        )
        let client = CloudWatchClient(config: config)

        // Call getDashboard, parse an error from the mocked response,
        // verify its type is UnknownAWSHTTPServiceError and check contents of a couple fields
        do {
            _ = try await client.getDashboard(input: GetDashboardInput(dashboardName: "abc"))
            XCTFail("Request should have thrown an error")
        } catch let awsError as UnknownAWSHTTPServiceError {
            XCTAssertEqual(awsError.errorCode, errorCode)
            XCTAssertEqual(awsError.requestID, requestID)
        } catch {
            print(error)
            XCTFail("Error was not an UnknownAWSHTTPServiceError, was \(type(of: error)) instead")
        }
    }
}

private final class MockHTTPClient: HTTPClient {
    let response: HTTPResponse

    init(response: HTTPResponse) {
        self.response = response
    }

    func send(request: SmithyHTTPAPI.HTTPRequest) async throws -> HTTPResponse {
        response
    }
}
