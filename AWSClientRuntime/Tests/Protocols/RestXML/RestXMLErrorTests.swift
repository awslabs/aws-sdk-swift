//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        

import ClientRuntime
import SmithyTestUtil
import XCTest
@testable import AWSClientRuntime

class RestXMLErrorTests: HttpResponseTestBase {
    let host = "my-api.us-east-2.amazonaws.com"

    func testInvalidGreetingError() {
        do {
            guard let httpResponse = buildHttpResponse(
                code: 400,
                headers: [
                    "Content-Type": "application/xml"
                ],
                content: HttpBody.data("""
                <ErrorResponse>
                   <Error>
                      <Type>Sender</Type>
                      <Code>InvalidGreeting</Code>
                      <Message>Hi</Message>
                      <AnotherSetting>setting</AnotherSetting>
                   </Error>
                   <RequestId>foo-id</RequestId>
                </ErrorResponse>

                """.data(using: .utf8)),
                host: host
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
            }

            let decoder = XMLDecoder()
            let greetingWithErrorsOutputError = try GreetingWithErrorsOutputError(httpResponse: httpResponse, decoder: decoder)

            if case .invalidGreeting(let actual) = greetingWithErrorsOutputError {

                let expected = InvalidGreeting(
                    message: "Hi"
                )
                XCTAssertEqual(actual._statusCode, HttpStatusCode(rawValue: 400))
                XCTAssertEqual(expected.message, actual.message)
            } else {
                XCTFail("The deserialized error type does not match expected type")
            }

        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }
    
    func testComplexError() {
        do {
            guard let httpResponse = buildHttpResponse(
                code: 400,
                headers: [
                    "Content-Type": "application/xml",
                    "X-Header": "Header"
                ],
                content: HttpBody.data("""
                <ErrorResponse>
                   <Error>
                      <Type>Sender</Type>
                      <Code>ComplexXMLError</Code>
                      <Message>Hi</Message>
                      <TopLevel>Top level</TopLevel>
                      <Nested>
                          <Foo>bar</Foo>
                      </Nested>
                   </Error>
                   <RequestId>foo-id</RequestId>
                </ErrorResponse>

                """.data(using: .utf8)),
                host: host
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
            }

            let decoder = XMLDecoder()
            let greetingWithErrorsOutputError = try GreetingWithErrorsOutputError(httpResponse: httpResponse, decoder: decoder)

            if case .complexXMLError(let actual) = greetingWithErrorsOutputError {

                let expected = ComplexXMLError(
                    header: "Header",
                    nested: ComplexXMLNestedErrorData(
                        foo: "bar"
                    ),
                    topLevel: "Top level"
                )
                XCTAssertEqual(actual._statusCode, HttpStatusCode(rawValue: 400))
                XCTAssertEqual(expected.header, actual.header)
                XCTAssertEqual(expected.topLevel, actual.topLevel)
                XCTAssertEqual(expected.nested, actual.nested)
            } else {
                XCTFail("The deserialized error type does not match expected type")
            }

        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }
}
