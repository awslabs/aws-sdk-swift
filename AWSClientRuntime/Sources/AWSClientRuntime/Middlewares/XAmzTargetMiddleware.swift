// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

public struct XAmzTargetMiddleware<StackInput>: Middleware {
    public let id: String = "XAmzTargetHeader"

    let xAmzTarget: String

    public init(xAmzTarget: String) {
        self.xAmzTarget = xAmzTarget
    }

    public func handle<H>(context: Context,
                          input: SerializeStepInput<StackInput>,
                          next: H) -> Result<SerializeStepInput<StackInput>, Error>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {

        input.builder.withHeader(name: "X-Amz-Target", value: xAmzTarget)

        return next.handle(context: context, input: input)
    }

    public typealias MInput = SerializeStepInput<StackInput>
    public typealias MOutput = SerializeStepInput<StackInput>
    public typealias Context = HttpContext
}
