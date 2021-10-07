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
        let byteArray: [UInt8] = Array(repeating: 0, count: 5767168)
        let byteBuffer = ByteBuffer(bytes: byteArray) // 5.5MB buffer
        let streamInput = StreamInput(body: ByteStream.buffer(byteBuffer))
        var stack = OperationStack<StreamInput, StreamOutput, StreamError>(id: "TreeHashMiddlewareTestStack")
        stack.serializeStep.intercept(position: .before, middleware: MockBodyMiddleware())
        stack.finalizeStep.intercept(position: .after, middleware: Sha256TreeHashMiddleware())
        _ = stack.handleMiddleware(context: context, input: streamInput, next: MockHandler(callback: { context, input in
            let linear = input.headers.value(for: "X-Amz-Content-Sha256")
            XCTAssertEqual(linear, "czz1E0SM5rIK0bxeUOsnwGrvrgwyBxOl3Zn05RvBymA=")
            let treeHash = input.headers.value(for: "X-Amz-Sha256-Tree-Hash")
            XCTAssertEqual(treeHash, "x7O1UHyNIXvn/g19LDbAILBPDnqTAz6FwI+MsNCADq0=")
        }))
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

