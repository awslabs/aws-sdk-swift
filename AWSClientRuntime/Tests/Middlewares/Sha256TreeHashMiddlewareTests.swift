//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
import AwsCommonRuntimeKit
import SmithyTestUtil
@testable import AWSClientRuntime

class Sha256TreeHashMiddlewareTests: XCTestCase {
    override func setUp() {
        #if os(Linux)
        AwsCommonRuntimeKit.initialize()
        #endif
    }
    
    override func tearDown() {
        #if os(Linux)
        AwsCommonRuntimeKit.cleanUp()
        #endif
    }
    
    func testTreeHashAllZeroes() throws {
        let context = HttpContextBuilder().build()
        let expectation = XCTestExpectation(description: "closure was run")
        let bytesIn5_5MB: Int = Int(1024 * 1024 * 5.5)
        let byteArray: [UInt8] = Array(repeating: 0, count: bytesIn5_5MB)
        let byteBuffer = ByteBuffer(bytes: byteArray)
        let streamInput = MockStreamInput(body: ByteStream.buffer(byteBuffer))
        var stack = OperationStack<MockStreamInput, MockOutput, MockMiddlewareError>(id: "TreeHashMiddlewareTestStack")
        stack.serializeStep.intercept(position: .before, middleware: MockSerializeStreamMiddleware())
        let mockHttpResponse = HttpResponse(body: HttpBody.none, statusCode: .accepted)
        let mockOutput = try MockOutput(httpResponse: mockHttpResponse, decoder: nil)
        let output = OperationOutput<MockOutput>(httpResponse: mockHttpResponse, output: mockOutput)
        stack.finalizeStep.intercept(position: .after, middleware: Sha256TreeHashMiddleware())
        _ = stack.handleMiddleware(context: context, input: streamInput, next: MockHandler(handleCallback: { context, input in
            let linear = input.headers.value(for: "X-Amz-Content-Sha256")
            XCTAssertEqual(linear, "733cf513448ce6b20ad1bc5e50eb27c06aefae0c320713a5dd99f4e51bc1ca60")
            let treeHash = input.headers.value(for: "X-Amz-Sha256-Tree-Hash")
            XCTAssertEqual(treeHash, "861890b487038d840e9d71d43bbc0fd4571453fb9d9b1f370caa3582a29b0ec7")
            expectation.fulfill()
            return .success(output)
        }))
        
        wait(for: [expectation], timeout: 3.0)
    }
}
