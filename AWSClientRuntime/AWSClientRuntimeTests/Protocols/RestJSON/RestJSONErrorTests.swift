//
// Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

import ClientRuntime
import SmithyTestUtil
@testable import AWSClientRuntime
import XCTest

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
            content: ResponseType.data("""
            {\"TopLevel\": \"Top level\"}
            """.data(using: .utf8)),
            host: host
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let greetingWithErrorsError = try? GreetingWithErrorsError(from: httpResponse, decoder: decoder) else {
            XCTFail("Failed to deserialize the error shape")
            return
        }
        
        if case .complexError(let actual) = greetingWithErrorsError {
            let expected = ComplexError(
                Header: "Header",
                TopLevel: "Top level"
            )
            XCTAssertEqual(actual.statusCode, HttpStatusCode(rawValue: 400))
            XCTAssertEqual(actual.Header, expected.Header)
            XCTAssertEqual(actual.TopLevel, expected.TopLevel)
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
    public var headers: HttpHeaders?
    public var message: String?
    public var requestID: String?
    public var retryable: Bool? = true
    public var statusCode: HttpStatusCode?
    public var type: ErrorType = .client
    public var Header: String?
    public var TopLevel: String?

    public init (
        Header: String? = nil,
        TopLevel: String? = nil
    )
    {
        self.Header = Header
        self.TopLevel = TopLevel
    }
}

struct ComplexErrorBody {
    public let TopLevel: String?
}

extension ComplexErrorBody: Decodable {
    private enum CodingKeys: String, CodingKey {
        case TopLevel
    }

    public init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        TopLevel = try values.decodeIfPresent(String.self, forKey: .TopLevel)
    }
}

extension ComplexError {
    public init (httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil) throws {
        if let Header = httpResponse.headers.value(for: "X-Header") {
            self.Header = Header
        } else {
            self.Header = nil
        }
        
        if case .data(let data) = httpResponse.content,
            let unwrappedData = data,
            let responseDecoder = decoder {
            let output: ComplexErrorBody = try responseDecoder.decode(responseBody: unwrappedData)
            self.TopLevel = output.TopLevel
        } else {
            self.TopLevel = nil
        }
        
        self.headers = httpResponse.headers
        self.statusCode = httpResponse.statusCode
        self.requestID = httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)
        self.message = message
    }
}

public enum GreetingWithErrorsError {
    case complexError(ComplexError)
    case unknown(UnknownServiceError)
    
    public init(rawValue: String, httpResponse: HttpResponse, decoder: ResponseDecoder?, message: String?) throws {
        switch rawValue {
        case "ComplexError" : self = .complexError(try ComplexError(httpResponse: httpResponse, decoder: decoder, message: message))
        default : self = .unknown(UnknownServiceError(httpResponse: httpResponse, message: message))
        }
    }
}

extension GreetingWithErrorsError {
    public init(from httpResponse: HttpResponse, decoder: ResponseDecoder?) throws {
    let errorDetails = try RestJSONError(httpResponse: httpResponse)
    try self.init(rawValue: errorDetails.errorType!, httpResponse: httpResponse, decoder: decoder, message: errorDetails.errorMessage)
  }
}
