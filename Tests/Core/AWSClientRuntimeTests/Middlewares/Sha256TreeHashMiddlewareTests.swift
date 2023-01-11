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
    
    func testTreeHashAllZeroes() async throws {
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
        stack.finalizeStep.intercept(position: .after, middleware: Sha256TreeHashMiddleware<MockOutput, MockMiddlewareError>())
        _ = try await stack.handleMiddleware(context: context, input: streamInput, next: MockHandler(handleCallback: { context, input in
            let linear = input.headers.value(for: "X-Amz-Content-Sha256")
            XCTAssertEqual(linear, "733cf513448ce6b20ad1bc5e50eb27c06aefae0c320713a5dd99f4e51bc1ca60")
            let treeHash = input.headers.value(for: "X-Amz-Sha256-Tree-Hash")
            XCTAssertEqual(treeHash, "a3a82dbe3644dd6046be472f2e3ec1f8ef47f8f3adb86d0de4de7a254f255455")
            expectation.fulfill()
            return output
        }))
        
        wait(for: [expectation], timeout: 3.0)
    }
}
