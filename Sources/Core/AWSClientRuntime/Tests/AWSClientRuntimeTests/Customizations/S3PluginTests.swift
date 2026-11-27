//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@testable import AWSClientRuntime
import ClientRuntime
import Foundation
@_spi(SchemaBasedSerde) import Smithy
import SmithyHTTPAPI
@_spi(SchemaBasedSerde) import SmithySerialization
import XCTest

final class S3PluginTests: XCTestCase {

    // MARK: - Errors returned with status 200

    func test_errorWith200_itChangesTheStatusTo500() async throws {
        let body = "<Error><Code>SlowDown</Code><Message>Please reduce your request rate.</Message></Error>"

        let response = try await intercept(status: .ok, body: body, operation: .plain)

        XCTAssertEqual(response.statusCode, .internalServerError)
        let data = try await response.body.readData()
        XCTAssertEqual(data, Data(body.utf8))
    }

    func test_errorWith200_itChangesTheStatusTo500AfterAnXMLDeclaration() async throws {
        let body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Error><Code>InternalError</Code></Error>"

        let response = try await intercept(status: .ok, body: body, operation: .plain)

        XCTAssertEqual(response.statusCode, .internalServerError)
    }

    func test_errorWith200_itLeavesASuccessfulResponseUnchanged() async throws {
        let body = "<CopyObjectResult><ETag>\"abc\"</ETag></CopyObjectResult>"

        let response = try await intercept(status: .ok, body: body, operation: .plain)

        XCTAssertEqual(response.statusCode, .ok)
        let data = try await response.body.readData()
        XCTAssertEqual(data, Data(body.utf8))
    }

    func test_errorWith200_itDoesNotCheckOperationsWithAStreamingOutput() async throws {
        let response = try await intercept(status: .ok, body: "<Error></Error>", operation: .streaming)

        XCTAssertEqual(response.statusCode, .ok)
    }

    func test_errorWith200_itLeavesErrorStatusesUnchanged() async throws {
        let body = "<Error><Code>NoSuchKey</Code></Error>"

        let response = try await intercept(status: .notFound, body: body, operation: .plain)

        XCTAssertEqual(response.statusCode, .notFound)
    }

    func test_errorWith200_itLeavesABodyThatIsNotXMLUnchanged() async throws {
        let response = try await intercept(status: .ok, body: "not xml", operation: .plain)

        XCTAssertEqual(response.statusCode, .ok)
    }

    // MARK: - Unwrapped output

    func test_unwrappedOutput_itWrapsTheBodyInARootElement() async throws {
        let body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
            "<LocationConstraint xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">us-west-2</LocationConstraint>"

        let response = try await intercept(status: .ok, body: body, operation: .unwrapped)

        XCTAssertEqual(response.statusCode, .ok)
        let wrapped = String(data: try await response.body.readData() ?? Data(), encoding: .utf8)
        XCTAssertEqual(wrapped, "<UnwrappedOutput>\n" +
            "<LocationConstraint xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">us-west-2</LocationConstraint>" +
            "</UnwrappedOutput>")
    }

    func test_unwrappedOutput_itDoesNotWrapAnError() async throws {
        let body = "<Error><Code>NoSuchBucket</Code></Error>"

        let response = try await intercept(status: .notFound, body: body, operation: .unwrapped)

        let data = try await response.body.readData()
        XCTAssertEqual(data, Data(body.utf8))
    }

    // MARK: - Without operation properties

    func test_withoutOperationProperties_itLeavesTheResponseUnchanged() async throws {
        let response = try await intercept(status: .ok, body: "<Error></Error>", operation: nil)

        XCTAssertEqual(response.statusCode, .ok)
    }

    // MARK: - Helpers

    private func intercept(
        status: HTTPStatusCode,
        body: String,
        operation: TestOperation?
    ) async throws -> HTTPResponse {
        let builder = ContextBuilder()
        if let operation { _ = builder.withOperationProperties(value: operation) }
        let context = DefaultInterceptorContext<String, String, HTTPRequest, HTTPResponse>(
            input: "", attributes: builder.build()
        )
        context.updateResponse(updated: HTTPResponse(body: .data(Data(body.utf8)), statusCode: status))

        try await S3ResponseInterceptor<String, String>().modifyBeforeDeserialization(context: context)
        return context.getResponse()
    }
}

private struct TestOperation: OperationProperties {
    let schema: Schema
    let outputSchema: Schema

    var serviceSchema: Schema { Schema(id: .init("test", "Service"), type: .service) }
    var inputSchema: Schema { Schema(id: .init("test", "Input"), type: .structure) }
    var errorTypeRegistry: TypeRegistry { TypeRegistry([]) }

    static let plain = TestOperation(
        schema: Schema(id: .init("test", "CopyObject"), type: .operation),
        outputSchema: output(streaming: false)
    )

    static let streaming = TestOperation(
        schema: Schema(id: .init("test", "GetObject"), type: .operation),
        outputSchema: output(streaming: true)
    )

    static let unwrapped = TestOperation(
        schema: Schema(
            id: .init("test", "GetBucketLocation"),
            type: .operation,
            // Force-try is safe because the trait's node is valid
            // swiftlint:disable:next force_try
            traits: TraitCollection(traits: [try! S3UnwrappedXMLOutputTrait(node: [:])])
        ),
        outputSchema: output(streaming: false)
    )

    private static func output(streaming: Bool) -> Schema {
        // Force-try is safe because the trait's node is valid
        // swiftlint:disable:next force_try
        let traits = streaming ? TraitCollection(traits: [try! StreamingTrait(node: [:])]) : TraitCollection()
        return Schema(
            id: .init("test", "Output"),
            type: .structure,
            members: [
                Schema(
                    id: .init("test", "Output", "Body"),
                    type: .blob,
                    traits: traits,
                    containerType: .structure,
                    target: Prelude.blobSchema,
                    index: 0
                ),
            ]
        )
    }
}
