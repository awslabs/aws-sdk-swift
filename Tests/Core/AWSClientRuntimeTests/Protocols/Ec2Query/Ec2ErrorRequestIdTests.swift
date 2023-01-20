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

class Ec2ErrorRequestIdTests: XCTestCase {

    func testEc2ResponseDecodesRequestID() throws {
        let data = """
        <Ec2Response>
            <Errors>
                <Error>
                    <Code>123</Code>
                    <Message>Sample Error</Message>
                </Error>
            </Errors>
            <RequestID>abcdefg12345</RequestID>
        </Ec2Response>
        """.data(using: .utf8)!
        let response = try XMLDecoder().decode(Ec2Response.self, from: data)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }

    func testEc2ResponseDecodesRequestId() throws {
        let data = """
        <Ec2Response>
            <Errors>
                <Error>
                    <Code>123</Code>
                    <Message>Sample Error</Message>
                </Error>
            </Errors>
            <RequestId>abcdefg12345</RequestId>
        </Ec2Response>
        """.data(using: .utf8)!
        let response = try XMLDecoder().decode(Ec2Response.self, from: data)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }

    func testEc2NarrowedResponseDecodesRequestID() throws {
        let data = """
        <Ec2NarrowedResponse>
            <Errors>
                <Error>Sample Error</Error>
            </Errors>
            <RequestID>abcdefg12345</RequestID>
        </Ec2NarrowedResponse>
        """.data(using: .utf8)!
        let response = try XMLDecoder().decode(Ec2NarrowedResponse<String>.self, from: data)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }

    func testEc2NarrowResponseDecodesRequestId() throws {
        let data = """
        <Ec2Response>
            <Errors>
                <Error>Sample Error</Error>
            </Errors>
            <RequestId>abcdefg12345</RequestId>
        </Ec2Response>
        """.data(using: .utf8)!
        let response = try XMLDecoder().decode(Ec2NarrowedResponse<String>.self, from: data)
        XCTAssertEqual(response.requestId, "abcdefg12345")
    }
}
