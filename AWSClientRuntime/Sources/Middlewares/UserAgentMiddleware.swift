//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime

public struct UserAgentMiddleware<OperationStackOutput: HttpResponseBinding>: Middleware {
    public let id: String = "UserAgentHeader"
    
    private let X_AMZ_USER_AGENT: String = "x-amz-user-agent"
    private let USER_AGENT: String = "User-Agent"
    
    let metadata: AWSUserAgentMetadata
    
    public init(metadata: AWSUserAgentMetadata) {
        self.metadata = metadata
    }
    
    public func handle<H>(context: Context,
                          input: SdkHttpRequestBuilder,
                          next: H) async throws -> OperationOutput<OperationStackOutput>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
        // x-amz-user-agent and User-Agent is swapped here.  See top note in the
        // sdk-user-agent-header SEP. More details here in the SEP about legacy issues with metrics
        input.withHeader(name: X_AMZ_USER_AGENT, value: metadata.userAgent)
        input.withHeader(name: USER_AGENT, value: metadata.xAmzUserAgent)
        
        return try await next.handle(context: context, input: input)
    }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext
}
