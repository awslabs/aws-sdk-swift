// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

public struct ContentTypeMiddleware: Middleware {
    public let id: String = "ContentType"

    let contentType: String

    public init(contentType: String) {
        self.contentType = contentType
    }

    public func handle<H>(context: Context,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<SdkHttpRequestBuilder, Error>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {

        input.withHeader(name: "Content-Type", value: contentType)

        return next.handle(context: context, input: input)
    }

    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = SdkHttpRequestBuilder
    public typealias Context = HttpContext
}
