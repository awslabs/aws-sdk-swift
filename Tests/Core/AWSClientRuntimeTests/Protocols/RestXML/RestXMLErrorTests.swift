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

    func testInvalidGreetingError() async {
        do {
            guard let httpResponse = buildHttpResponse(
                code: 400,
                headers: [
                    "Content-Type": "application/xml"
                ],
                content: HttpBody(byteStream: ByteStream.from(data:"""
                <ErrorResponse>
                   <Error>
                      <Type>Sender</Type>
                      <Code>InvalidGreeting</Code>
                      <Message>Hi</Message>
                      <AnotherSetting>setting</AnotherSetting>
                   </Error>
                   <RequestId>foo-id</RequestId>
                </ErrorResponse>

                """.data(using: .utf8)!))
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
            }

            let decoder = XMLDecoder()
            let greetingWithErrorsOutputError = try await GreetingWithErrorsOutputError.makeError(httpResponse: httpResponse, decoder: decoder)

            if let actual = greetingWithErrorsOutputError as? InvalidGreeting {

                let expected = InvalidGreeting(
                    message: "Hi"
                )
                XCTAssertEqual(actual._statusCode, HttpStatusCode(rawValue: 400))
                XCTAssertEqual(expected.message, actual.message)
                XCTAssertEqual("foo-id", actual._requestID)
            } else {
                XCTFail("The deserialized error type does not match expected type")
            }

        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }

    func testComplexError() async {
        do {
            guard let httpResponse = buildHttpResponse(
                code: 400,
                headers: [
                    "Content-Type": "application/xml",
                    "X-Header": "Header"
                ],
                content: HttpBody(byteStream: ByteStream.from(data:"""
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

                """.data(using: .utf8)!))
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
            }

            let decoder = XMLDecoder()
            let greetingWithErrorsOutputError = try await GreetingWithErrorsOutputError.makeError(httpResponse: httpResponse, decoder: decoder)

            if let actual = greetingWithErrorsOutputError as? ComplexXMLError {

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
                XCTAssertEqual("Hi", actual._message)
                XCTAssertEqual("foo-id", actual._requestID)
            } else {
                XCTFail("The deserialized error type does not match expected type")
            }

        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }

    func testComplexErrorWithNoErrorWrapping() async {
        do {
            guard let httpResponse = buildHttpResponse(
                code: 400,
                headers: [
                    "Content-Type": "application/xml",
                    "X-Header": "Header"
                ],
                content: HttpBody(byteStream: ByteStream.from(data:"""
                   <Error>
                      <Type>Sender</Type>
                      <Code>ComplexXMLErrorNoErrorWrapping</Code>
                      <Message>Hi</Message>
                      <TopLevel>Top level</TopLevel>
                      <Nested>
                          <Foo>bar</Foo>
                      </Nested>
                      <RequestId>foo-id</RequestId>
                   </Error>
                """.data(using: .utf8)!))
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
            }

            let decoder = XMLDecoder()
            let greetingWithErrorsOutputError = try await GreetingWithErrorsNoErrorWrappingOutputError.makeError(httpResponse: httpResponse, decoder: decoder)

            if let actual = greetingWithErrorsOutputError as? ComplexXMLErrorNoErrorWrapping {

                let expected = ComplexXMLErrorNoErrorWrapping(
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
                XCTAssertEqual("Hi", actual._message)
                XCTAssertEqual("foo-id", actual._requestID)
            } else {
                XCTFail("The deserialized error type does not match expected type")
            }

        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }

    func testUnhandledAccessDeniedErrors() async {
        do {
            guard let httpResponse = buildHttpResponse(
                code: 403,
                headers: [
                    "Content-Type": "application/xml",
                    "X-Header": "Header"
                ],
                content: HttpBody(byteStream: ByteStream.from(data:"""
                <?xml version="1.0" encoding="UTF-8"?>
                <Error>
                    <Code>AccessDenied</Code>
                    <Message>Access Denied</Message>
                    <RequestId>abcdefg123456</RequestId>
                    <HostId>987654321abcdefg</HostId>
                </Error>
                """.data(using: .utf8)!))
            ) else {
                XCTFail("Something is wrong with the created http response")
                return
            }

            let decoder = XMLDecoder()
            let greetingWithErrorsOutputError = try await GreetingWithErrorsOutputError.makeError(httpResponse: httpResponse, decoder: decoder)
            if let actual = greetingWithErrorsOutputError as? UnknownAWSHttpServiceError {
                XCTAssertEqual("Access Denied", actual._message)
                XCTAssertEqual("abcdefg123456", actual._requestID)
            } else {
                XCTFail("The deserialized error type does not match expected type")
            }
        } catch let err {
            XCTFail(err.localizedDescription)
        }
    }
}
