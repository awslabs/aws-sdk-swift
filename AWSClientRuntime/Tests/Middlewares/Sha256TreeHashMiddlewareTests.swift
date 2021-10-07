//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
import AwsCommonRuntimeKit
@testable import AWSClientRuntime

class Sha256TreeHashMiddlewareTests: XCTestCase {
    func testTreeHashAllZeroes() {
        let context = HttpContextBuilder().build()
        let expectation = XCTestExpectation(description: "closure was run")
        let byteArray: [UInt8] = Array(repeating: 0, count: 5767168)
        let byteBuffer = ByteBuffer(bytes: byteArray)
        let streamInput = StreamInput(body: ByteStream.buffer(byteBuffer))
        var stack = OperationStack<StreamInput, StreamOutput, StreamError>(id: "TreeHashMiddlewareTestStack")
        stack.serializeStep.intercept(position: .before, middleware: MockBodyMiddleware())
        stack.finalizeStep.intercept(position: .after, middleware: Sha256TreeHashMiddleware())
        _ = stack.handleMiddleware(context: context, input: streamInput, next: MockHandler(callback: { context, input in
            let linear = input.headers.value(for: "X-Amz-Content-Sha256")
            XCTAssertEqual(linear, "733cf513448ce6b20ad1bc5e50eb27c06aefae0c320713a5dd99f4e51bc1ca60")
            let treeHash = input.headers.value(for: "X-Amz-Sha256-Tree-Hash")
            XCTAssertEqual(treeHash, "861890b487038d840e9d71d43bbc0fd4571453fb9d9b1f370caa3582a29b0ec7")
            expectation.fulfill()
        }))
        
        wait(for: [expectation], timeout: 3.0)
    }
}

struct StreamInput: Reflection, Encodable {
    let body: ByteStream
}

struct StreamOutput: Decodable, HttpResponseBinding {
    init(httpResponse: HttpResponse, decoder: ResponseDecoder?) throws {}
    init() {}
}
struct StreamError: HttpResponseBinding {
    init(httpResponse: HttpResponse, decoder: ResponseDecoder?) throws {}
}

struct MockHandler: Handler {
    let callback: (HttpContext, SdkHttpRequest) -> Void
    func handle(context: HttpContext, input: SdkHttpRequest) -> Result<OperationOutput<StreamOutput>, SdkError<StreamError>> {
        callback(context, input)
        let streamOutput = StreamOutput()
        return .success(OperationOutput(httpResponse: HttpResponse(body: .none, statusCode: .accepted),
                                        output: streamOutput))
    }
    
    typealias Input = SdkHttpRequest
    
    typealias Output = OperationOutput<StreamOutput>
    
    typealias Context = HttpContext
    
    typealias MiddlewareError = SdkError<StreamError>
}

struct MockBodyMiddleware: Middleware {
    func handle<H>(context: HttpContext, input: SerializeStepInput<StreamInput>, next: H) -> Result<OperationOutput<StreamOutput>, SdkError<StreamError>> where H : Handler, HttpContext == H.Context, SdkError<StreamError> == H.MiddlewareError, SerializeStepInput<StreamInput> == H.Input, OperationOutput<StreamOutput> == H.Output {
        input.builder.withBody(HttpBody.stream(input.operationInput.body))
        return next.handle(context: context, input: input)
    }
    
    var id: String = "MockBodyMiddleware"
    
    
    typealias MInput = SerializeStepInput<StreamInput>
    
    typealias MOutput = OperationOutput<StreamOutput>
    
    typealias Context = HttpContext
    
    typealias MError = SdkError<StreamError>
    
    
}

