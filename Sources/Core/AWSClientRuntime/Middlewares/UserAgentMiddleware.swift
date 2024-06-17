//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import ClientRuntime
import SmithyHTTPAPI

public struct UserAgentMiddleware<OperationStackInput, OperationStackOutput>: Middleware {
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
          Self.MOutput == H.Output {
        addHeader(builder: input)
        return try await next.handle(context: context, input: input)
    }

    private func addHeader(builder: SdkHttpRequestBuilder) {
        builder.withHeader(name: USER_AGENT, value: metadata.userAgent)
    }

    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput>
}

extension UserAgentMiddleware: HttpInterceptor {
    public typealias InputType = OperationStackInput
    public typealias OutputType = OperationStackOutput

    public func modifyBeforeRetryLoop(
        context: some MutableRequest<Self.InputType, SdkHttpRequest, Context>
    ) async throws {
        let builder = context.getRequest().toBuilder()
        addHeader(builder: builder)
        context.updateRequest(updated: builder.build())
    }
}
