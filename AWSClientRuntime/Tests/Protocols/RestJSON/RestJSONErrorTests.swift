/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

class RestJSONErrorTests: HttpResponseTestBase {
    let host = "myapi.host.com"

    func testRestJsonComplexError() {
        guard let httpResponse = buildHttpResponse(
            code: 400,
            headers: [
                "Content-Type": "application/json",
                "X-Header": "Header",
                "X-Amzn-Errortype": "ComplexError"
            ],
            content: HttpBody.data("""
            {\"TopLevel\": \"Top level\"}
            """.data(using: .utf8))
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let greetingWithErrorsError = try? GreetingWithErrorsError(httpResponse: httpResponse, decoder: decoder) else {
            XCTFail("Failed to deserialize the error shape")
            return
        }

        if case .complexError(let actual) = greetingWithErrorsError {
            let expected = ComplexError(
                header: "Header",
                topLevel: "Top level"
            )
            XCTAssertEqual(actual._statusCode, HttpStatusCode(rawValue: 400))
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
            XCTAssertEqual(RestJSONError.sanitizeErrorType(errorName), "FooError")
        }
    }
}

public struct ComplexError: AWSHttpServiceError {
    public var _isThrottling: Bool = false
    public var _headers: Headers?
    public var _message: String?
    public var _requestID: String?
    public var _retryable: Bool = true
    public var _statusCode: HttpStatusCode?
    public var _type: ErrorType = .client
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

extension ComplexErrorBody: Decodable {
    private enum CodingKeys: String, CodingKey {
        case TopLevel
    }

    public init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        topLevel = try values.decodeIfPresent(String.self, forKey: .TopLevel)
    }
}

extension ComplexError {

    public init (httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {
        if let Header = httpResponse.headers.value(for: "X-Header") {
            self.header = Header
        } else {
            self.header = nil
        }

        if case .data(let data) = httpResponse.body,
            let unwrappedData = data,
            let responseDecoder = decoder {
            let output: ComplexErrorBody = try responseDecoder.decode(responseBody: unwrappedData)
            self.topLevel = output.topLevel
        } else {
            self.topLevel = nil
        }

        self._headers = httpResponse.headers
        self._statusCode = httpResponse.statusCode
        self._message = message
    }
}

public enum GreetingWithErrorsError {
    case complexError(ComplexError)
    case unknown(UnknownAWSHttpServiceError)

    public init(errorType: String?, httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {
        switch errorType {
        case "ComplexError" : self = .complexError(try ComplexError(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
        default : self = .unknown(UnknownAWSHttpServiceError(httpResponse: httpResponse, message: message))
        }
    }
}

extension GreetingWithErrorsError: HttpResponseBinding {
    public init(httpResponse: HttpResponse, decoder: ResponseDecoder? = nil) throws {
        let errorDetails = try RestJSONError(httpResponse: httpResponse)
        let requestID = httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)
        try self.init(errorType: errorDetails.errorType, httpResponse: httpResponse, decoder: decoder, message: errorDetails.errorMessage, requestID: requestID)
    }
}
