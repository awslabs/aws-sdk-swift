// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

public struct ContentTypeMiddleware<StackInput>: Middleware {
    public let id: String = "ContentType"

    let contentType: String

    public init(contentType: String) {
        self.contentType = contentType
    }

    public func handle<H>(context: Context,
                          input: SerializeInput<StackInput>,
                          next: H) -> Result<SerializeInput<StackInput>, Error>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {

        input.builder.withHeader(name: "Content-Type", value: contentType)

        return next.handle(context: context, input: input)
    }

    public typealias MInput = SerializeInput<StackInput>
    public typealias MOutput = SerializeInput<StackInput>
    public typealias Context = HttpContext
}
