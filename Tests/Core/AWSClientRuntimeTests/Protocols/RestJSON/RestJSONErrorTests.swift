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

    func testRestJsonComplexError() async throws {
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
        let greetingWithErrorsError = try await GreetingWithErrorsError.makeError(httpResponse: httpResponse, decoder: decoder)

        if let actual = greetingWithErrorsError as? ComplexError {
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
    public var _errorType: String?
    public var _isThrottling: Bool = false
    public var _headers: Headers?
    public var _message: String?
    public var _requestID: String?
    public var _retryable: Bool = true
    public var _statusCode: HttpStatusCode?
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

    public init (httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) async throws {
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
}

extension GreetingWithErrorsError: HttpResponseErrorBinding {
    public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder?) async throws -> ServiceError {
        let errorDetails = try await RestJSONError(httpResponse: httpResponse)
        let requestID = httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)
        switch errorDetails.errorType {
        case "ComplexError": return try await ComplexError(httpResponse: httpResponse, decoder: decoder, message: errorDetails.errorMessage, requestID: requestID)
        default: return UnknownAWSHttpServiceError(httpResponse: httpResponse, message: errorDetails.errorMessage)
        }
    }
}
