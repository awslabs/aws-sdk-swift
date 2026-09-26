//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSDynamoDB
import ClientRuntime
import AWSClientRuntime
import SmithyHTTPAPI
import AWSIntegrationTestUtils
import AWSSDKIdentity

final class QueryCompatibleTest: XCTestCase {

    // Test Case 5: Validate SDK does not send x-amzn-query-mode header
    // when service doesn't have @awsQueryCompatible trait

    func test_QueryCompatible_TC5_NoQueryModeHeaderForNonCompatibleService() async throws {
        let headersRecorder = HeadersRecorder()

        let mockHTTPClient = MockHTTPClient { request in
            await headersRecorder.record(request.headers)

            // Return DynamoDB error response
            let response = HTTPResponse(
                body: .data(Data("""
                {
                    "__type": "com.amazon.coral.validate#ValidationException",
                    "message": "Test validation error"
                }
                """.utf8)),
                statusCode: .badRequest
            )
            response.headers.add(name: "Content-Type", value: "application/x-amz-json-1.0")
            return response
        }

        let credentials = AWSCredentialIdentity(accessKey: "test", secret: "test")
        let resolver = StaticAWSCredentialIdentityResolver(credentials)

        let config = try await DynamoDBClient.DynamoDBClientConfig(
            awsCredentialIdentityResolver: resolver,
            region: "us-east-1",
            httpClientEngine: mockHTTPClient
        )

        let client = DynamoDBClient(config: config)

        do {
            _ = try await client.getItem(input: GetItemInput(
                key: ["id": .s("test")],
                tableName: "TestTable"
            ))
            XCTFail("Expected ValidationException error")
        } catch {
            // TC5: Verify x-amzn-query-mode header is NOT present in wire request
            let capturedHeaders = await headersRecorder.headers
            XCTAssertNotNil(capturedHeaders)
            XCTAssertNil(capturedHeaders?.value(for: "x-amzn-query-mode"),
                        "x-amzn-query-mode header should NOT be present for services without @awsQueryCompatible trait")
        }
    }
}
