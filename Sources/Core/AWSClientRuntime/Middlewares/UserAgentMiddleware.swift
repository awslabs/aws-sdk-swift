//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct UserAgentMiddleware<OperationStackOutput>: Middleware {
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
        input.withHeader(name: USER_AGENT, value: metadata.userAgent)

        return try await next.handle(context: context, input: input)
    }

    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext
}
