// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

public struct XAmzTargetMiddleware<OperationStackOutput: HttpResponseBinding,
                                   OperationStackError: HttpResponseBinding>: Middleware {
    public let id: String = "XAmzTargetHeader"

    let xAmzTarget: String

    public init(xAmzTarget: String) {
        self.xAmzTarget = xAmzTarget
    }

    public func handle<H>(context: Context,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<OperationOutput<OperationStackOutput, OperationStackError>, Error>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {

        input.withHeader(name: "X-Amz-Target", value: xAmzTarget)

        return next.handle(context: context, input: input)
    }

    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput, OperationStackError>
    public typealias Context = HttpContext
}
