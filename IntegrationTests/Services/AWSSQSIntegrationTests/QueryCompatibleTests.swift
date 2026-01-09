//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSSQS
import ClientRuntime
import AWSClientRuntime
import SmithyHTTPAPI

final class QueryCompatibleTests: XCTestCase {

    // Test Case 1: Parse Code field from header

    func test_QueryCompatible_TC1_ParseCodeFromHeader() async throws {
        // Create a mock HTTP client that returns the expected error response
        let mockHTTPClient = MockHTTPClient { request in
            // Verify the request has the x-amzn-query-mode header (TC4)
            XCTAssertEqual(request.headers.value(for: "x-amzn-query-mode"), "true")

            // Return error response with x-amzn-query-error header
            let response = HTTPResponse(
                body: .data(Data("""
                {
                    "__type": "com.amazonaws.sqs#QueueDoesNotExist",
                    "message": "Some user-visible message"
                }
                """.utf8)),
                statusCode: .badRequest
            )
            response.headers.add(name: "x-amzn-query-error", value: "AWS.SimpleQueueService.NonExistentQueue;Sender")
            response.headers.add(name: "Content-Type", value: "application/x-amz-json-1.0")
            return response
        }

        let config = try await SQSClient.SQSClientConfiguration(
            region: "us-west-2",
            httpClientEngine: mockHTTPClient
        )
        let mockClient = SQSClient(config: config)

        do {
            _ = try await mockClient.getQueueUrl(input: .init(queueName: "non-existent-queue"))
            XCTFail("Expected QueueDoesNotExist error")
        } catch let error as QueueDoesNotExist {
            // TC1: Verify error code is parsed from header
            XCTAssertNotNil(error.errorCode, "Error code should not be nil")
            XCTAssertEqual(error.errorCode, "AWS.SimpleQueueService.NonExistentQueue",
                          "Error code should be parsed from x-amzn-query-error header")
        }
    }

    // Test Case 2: Handle missing Code field

    func test_QueryCompatible_TC2_HandleMissingCode() async throws {
        let mockHTTPClient = MockHTTPClient { request in
            // Return error response WITHOUT x-amzn-query-error header
            let response = HTTPResponse(
                body: .data(Data("""
                {
                    "__type": "com.amazonaws.sqs#QueueDoesNotExist",
                    "message": "Some user-visible message"
                }
                """.utf8)),
                statusCode: .badRequest
            )
            response.headers.add(name: "Content-Type", value: "application/x-amz-json-1.0")
            return response
        }

        let config = try await SQSClient.SQSClientConfiguration(
            region: "us-west-2",
            httpClientEngine: mockHTTPClient
        )
        let mockClient = SQSClient(config: config)

        do {
            _ = try await mockClient.getQueueUrl(input: .init(queueName: "non-existent-queue"))
            XCTFail("Expected QueueDoesNotExist error")
        } catch let error as AWSServiceError {
            // TC2: Verify error code falls back to __type field
            XCTAssertNotNil(error.errorCode, "Error code should not be nil")
            XCTAssertEqual(error.errorCode, "QueueDoesNotExist",
                          "Error code should be parsed from __type field when header is missing")
        }
    }

    // Test Case 3: Parse Type field

    func test_QueryCompatible_TC3_ParseTypeField() async throws {
        let mockHTTPClient = MockHTTPClient { request in
            let response = HTTPResponse(
                body: .data(Data("""
                {
                    "__type": "com.amazonaws.sqs#QueueDoesNotExist",
                    "message": "Some user-visible message"
                }
                """.utf8)),
                statusCode: .badRequest
            )
            response.headers.add(name: "x-amzn-query-error", value: "AWS.SimpleQueueService.NonExistentQueue;Sender")
            response.headers.add(name: "Content-Type", value: "application/x-amz-json-1.0")
            return response
        }

        let config = try await SQSClient.SQSClientConfiguration(
            region: "us-west-2",
            httpClientEngine: mockHTTPClient
        )
        let mockClient = SQSClient(config: config)

        do {
            _ = try await mockClient.getQueueUrl(input: .init(queueName: "non-existent-queue"))
            XCTFail("Expected QueueDoesNotExist error")
        } catch let error as HTTPError {
            // TC3: Verify Type field can be parsed.
            // This is NOT exposed to customers on the error.
            let errorDetails = error.httpResponse.headers.value(for: "x-amzn-query-error")
            let parsedError = try AwsQueryCompatibleErrorDetails.parse(errorDetails)
            XCTAssertEqual(parsedError?.type, "Sender")
        }
    }

    // Test Case 4: Verify x-amzn-query-mode header is sent

    func test_QueryCompatible_TC4_SendsQueryModeHeader() async throws {
        var capturedHeaders: Headers?

        let mockHTTPClient = MockHTTPClient { request in
            capturedHeaders = request.headers

            // Return successful response
            let response = HTTPResponse(
                body: .data(Data("""
                {
                    "QueueUrl": "https://sqs.us-west-2.amazonaws.com/123456789012/test-queue"
                }
                """.utf8)),
                statusCode: .ok
            )
            return response
        }

        let config = try await SQSClient.SQSClientConfiguration(
            region: "us-west-2",
            httpClientEngine: mockHTTPClient
        )
        let mockClient = SQSClient(config: config)

        _ = try await mockClient.getQueueUrl(input: .init(queueName: "test-queue"))

        // TC4: Verify x-amzn-query-mode header is present and set to "true"
        XCTAssertNotNil(capturedHeaders)
        XCTAssertEqual(capturedHeaders?.value(for: "x-amzn-query-mode"), "true",
                      "x-amzn-query-mode header should be present and set to 'true'")
    }
}

// Mock HTTP Client Implementation

private final class MockHTTPClient: HTTPClient, @unchecked Sendable {
    private let handler: (HTTPRequest) async throws -> HTTPResponse

    init(handler: @escaping (HTTPRequest) -> HTTPResponse) {
        self.handler = { request in
            return handler(request)
        }
    }

    func send(request: HTTPRequest) async throws -> HTTPResponse {
        return try await handler(request)
    }

    func close() async throws {
        // No-op for mock
    }
}
