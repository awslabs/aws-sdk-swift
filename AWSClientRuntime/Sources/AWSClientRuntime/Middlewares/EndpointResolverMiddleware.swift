// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

// TODO: this struct is unfinished. proper endpoint resolving will need to be added futuristically
public struct EndpointResolverMiddleware<OperationInput>: Middleware {

    public let id: String = "EndpointResolver"

    public init() {}

    public func handle<H>(context: Context,
                          input: SerializeStepInput<OperationInput>,
                          next: H) -> Result<SdkHttpRequestBuilder, Error>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {

        let host = context.getHost()
        let method = context.getMethod()
        let path = context.getPath()

        input.builder.withMethod(method)
            .withHost(host)
            .withPath(path)
            .withHeader(name: "Host", value: host)
        return next.handle(context: context, input: input)
    }

    public typealias MInput = SerializeStepInput<OperationInput>
    public typealias MOutput = SdkHttpRequestBuilder
    public typealias Context = HttpContext
}
