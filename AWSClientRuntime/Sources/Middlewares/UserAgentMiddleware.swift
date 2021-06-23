//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime

let X_AMZ_USER_AGENT: String = "x-amz-user-agent"
let USER_AGENT: String = "User-Agent"

public struct UserAgentMiddleware<OperationStackOutput: HttpResponseBinding,
                                  OperationStackError: HttpResponseBinding>: Middleware {
    public let id: String = "UserAgentHeader"
    
    let metadata: AWSUserAgentMetadata
    
    public init(metadata: AWSUserAgentMetadata) {
        self.metadata = metadata
    }
    
    public func handle<H>(context: Context,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<OperationOutput<OperationStackOutput>, MError>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context,
          Self.MError == H.MiddlewareError {
        // x-amz-user-agent and User-Agent is swapped here.  See top note in the
        // sdk-user-agent-header SEP. More details here in the SEP about legacy issues with metrics
        input.withHeader(name: X_AMZ_USER_AGENT, value: metadata.userAgent)
        input.withHeader(name: USER_AGENT, value: metadata.xAmzUserAgent)
        
        return next.handle(context: context, input: input)
    }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias MError = SdkError<OperationStackError>
    public typealias Context = HttpContext
}
