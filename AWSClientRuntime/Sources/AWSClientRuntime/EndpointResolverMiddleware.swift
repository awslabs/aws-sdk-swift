// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

//TODO: this struct is unfinished. proper endpoint resolving will need to be added futuristically
public struct EndpointResolverMiddleware: Middleware {
    
    public var id: String = "EndpointResolver"
    
    public init() {}
    
    public func handle<H>(context: Context,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<SdkHttpRequestBuilder, Error>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
        
        let host = context.getHost()
        let method = context.getMethod()
        let path = context.getPath()
        
        input.withMethod(method)
            .withHost(host)
            .withPath(path)
            .withHeader(name: "Host", value: host)
        return next.handle(context: context, input: input)
    }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = SdkHttpRequestBuilder
    public typealias Context = HttpContext
}
