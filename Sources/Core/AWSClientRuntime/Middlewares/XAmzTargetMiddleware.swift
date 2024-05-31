// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.

import class Smithy.Context
import SmithyHTTPAPI
import ClientRuntime

public struct XAmzTargetMiddleware<OperationStackInput, OperationStackOutput>: Middleware {
    public let id: String = "XAmzTargetHeader"

    let xAmzTarget: String

    public init(xAmzTarget: String) {
        self.xAmzTarget = xAmzTarget
    }

    public func handle<H>(context: Context,
                          input: SerializeStepInput<OperationStackInput>,
                          next: H) async throws -> OperationOutput<OperationStackOutput>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output {

        addHeader(builder: input.builder)
        return try await next.handle(context: context, input: input)
    }

    private func addHeader(builder: SdkHttpRequestBuilder) {
        builder.withHeader(name: "X-Amz-Target", value: xAmzTarget)
    }

    public typealias MInput = SerializeStepInput<OperationStackInput>
    public typealias MOutput = OperationOutput<OperationStackOutput>
}

extension XAmzTargetMiddleware: HttpInterceptor {
    public typealias InputType = OperationStackInput
    public typealias OutputType = OperationStackOutput

    public func modifyBeforeRetryLoop(
        context: some MutableRequest<Self.InputType, Self.RequestType, Self.AttributesType>
    ) async throws {
        let builder = context.getRequest().toBuilder()
        addHeader(builder: builder)
        context.updateRequest(updated: builder.build())
    }
}
