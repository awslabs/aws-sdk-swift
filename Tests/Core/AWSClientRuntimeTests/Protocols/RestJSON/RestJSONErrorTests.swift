/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import SmithyReadWrite
import SmithyJSON
import ClientRuntime
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

class RestJSONErrorTests: HttpResponseTestBase {
    let host = "myapi.host.com"

    func testRestJsonComplexError() async throws {
        guard let httpResponse = buildHttpResponse(
            code: 400,
            headers: [
                "Content-Type": "application/json",
                "X-Header": "Header",
                "X-Amzn-Errortype": "ComplexError"
            ],
            content: ByteStream.data("""
            {\"TopLevel\": \"Top level\"}
            """.data(using: .utf8))
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
        }

        let greetingWithErrorsError = try await wireResponseErrorClosure(GreetingWithErrorsError.httpErrorBinding, wireResponseDocumentBinding())(httpResponse)

        if let actual = greetingWithErrorsError as? ComplexError {
            let expected = ComplexError(
                header: "Header",
                topLevel: "Top level"
            )
            XCTAssertEqual(actual.httpResponse.statusCode, HttpStatusCode(rawValue: 400))
            XCTAssertEqual(actual.header, expected.header)
            XCTAssertEqual(actual.topLevel, expected.topLevel)
        } else {
            XCTFail("The deserialized error type does not match expected type")
        }
    }

    func testSanitizeErrorName() {
        let errorNames = [
            "   FooError  ",
            "FooError:http://my.fake.com/",
            "my.protocoltests.restjson#FooError",
            "my.protocoltests.restjson#FooError:http://my.fake.com"
        ]

        for errorName in errorNames {
            XCTAssertEqual(sanitizeErrorType(errorName), "FooError")
        }
    }
}

public struct ComplexError: AWSServiceError, HTTPError, Error {
    public var typeName: String?
    public var httpResponse = HttpResponse()
    public var message: String?
    public var requestID: String?
    public var header: String?
    public var topLevel: String?

    public init (
        header: String? = nil,
        topLevel: String? = nil
    ) {
        self.header = header
        self.topLevel = topLevel
    }
}

struct ComplexErrorBody {
    public let topLevel: String?
}

extension ComplexError {

    static func makeError(baseError: AWSClientRuntime.RestJSONError) throws -> ComplexError {
        let reader = baseError.errorBodyReader
        var value = ComplexError()
        if let Header = baseError.httpResponse.headers.value(for: "X-Header") {
            value.header = Header
        } else {
            value.header = nil
        }
        value.topLevel = try reader["TopLevel"].readIfPresent()
        value.httpResponse = baseError.httpResponse
        value.message = baseError.message
        value.requestID = baseError.requestID
        return value
    }
}

public enum GreetingWithErrorsError {
    
    static var httpErrorBinding: SmithyReadWrite.WireResponseErrorBinding<ClientRuntime.HttpResponse, SmithyJSON.Reader> {
        { httpResponse, responseDocumentClosure in
            let responseReader = try await responseDocumentClosure(httpResponse)
            let baseError = try AWSClientRuntime.RestJSONError(httpResponse: httpResponse, responseReader: responseReader, noErrorWrapping: false)
            switch baseError.code {
            case "ComplexError": return try ComplexError.makeError(baseError: baseError)
            default: return try AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(baseError: baseError)
            }
        }
    }
}
