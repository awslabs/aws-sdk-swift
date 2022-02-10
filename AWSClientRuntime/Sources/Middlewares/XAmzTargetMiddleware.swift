// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

public struct XAmzTargetMiddleware<OperationStackInput,
                                   OperationStackOutput: HttpResponseBinding,
                                   OperationStackError: HttpResponseBinding>: Middleware {
    public let id: String = "XAmzTargetHeader"

    let xAmzTarget: String

    public init(xAmzTarget: String) {
        self.xAmzTarget = xAmzTarget
    }

    public func handle<H>(context: Context,
                          input: SerializeStepInput<OperationStackInput>,
                          next: H) -> Result<OperationOutput<OperationStackOutput>, MError>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context,
          Self.MError == H.MiddlewareError {

        input.builder.withHeader(name: "X-Amz-Target", value: xAmzTarget)

        return next.handle(context: context, input: input)
    }

    public typealias MInput = SerializeStepInput<OperationStackInput>
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias MError = SdkError<OperationStackError>
    public typealias Context = HttpContext
}
