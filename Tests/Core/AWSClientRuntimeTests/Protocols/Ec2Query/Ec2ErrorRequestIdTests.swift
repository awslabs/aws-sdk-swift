//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//


import ClientRuntime
import SmithyTestUtil
import XCTest
import SmithyXML
@testable import AWSClientRuntime

class Ec2ErrorRequestIdTests: XCTestCase {

    func testEc2ResponseDecodesRequestID() async throws {
        let data = Data("""
        <Ec2Response>
            <Errors>
                <Error>
                    <Code>123</Code>
                    <Message>Sample Error</Message>
                </Error>
            </Errors>
            <RequestID>abcdefg12345</RequestID>
        </Ec2Response>
        """.utf8)
        let httpResponse = HttpResponse(body: .data(data), statusCode: .ok)
        let response = try await responseClosure(Ec2Response.httpBinding, responseDocumentBinding)(httpResponse)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }

    func testEc2ResponseDecodesRequestId() async throws {
        let data = Data("""
        <Ec2Response>
            <Errors>
                <Error>
                    <Code>123</Code>
                    <Message>Sample Error</Message>
                </Error>
            </Errors>
            <RequestId>abcdefg12345</RequestId>
        </Ec2Response>
        """.utf8)
        let httpResponse = HttpResponse(body: .data(data), statusCode: .ok)
        let response = try await responseClosure(Ec2Response.httpBinding, responseDocumentBinding)(httpResponse)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }

    func testEc2NarrowedResponseDecodesRequestID() async throws {
        let data = Data("""
        <Ec2NarrowedResponse>
            <Errors>
                <Error>Sample Error</Error>
            </Errors>
            <RequestID>abcdefg12345</RequestID>
        </Ec2NarrowedResponse>
        """.utf8)
        let httpResponse = HttpResponse(body: .data(data), statusCode: .ok)
        let response = try await responseClosure(Ec2Response.httpBinding, responseDocumentBinding)(httpResponse)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }

    func testEc2NarrowResponseDecodesRequestId() async throws {
        let data = Data("""
        <Ec2Response>
            <Errors>
                <Error>Sample Error</Error>
            </Errors>
            <RequestId>abcdefg12345</RequestId>
        </Ec2Response>
        """.utf8)
        let httpResponse = HttpResponse(body: .data(data), statusCode: .ok)
        let response = try await responseClosure(Ec2Response.httpBinding, responseDocumentBinding)(httpResponse)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }
}
