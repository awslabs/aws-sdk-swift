//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import ClientRuntime
import SmithyHTTPAPI

public struct UserAgentMiddleware<OperationStackInput, OperationStackOutput> {
    public let id: String = "UserAgentHeader"

    private let X_AMZ_USER_AGENT: String = "x-amz-user-agent"
    private let USER_AGENT: String = "User-Agent"

    let metadata: AWSUserAgentMetadata

    public init(metadata: AWSUserAgentMetadata) {
        self.metadata = metadata
    }

    private func addHeader(builder: SdkHttpRequestBuilder) {
        builder.withHeader(name: USER_AGENT, value: metadata.userAgent)
    }
}

extension UserAgentMiddleware: HttpInterceptor {
    public typealias InputType = OperationStackInput
    public typealias OutputType = OperationStackOutput

    public func modifyBeforeRetryLoop(context: some MutableRequest<Self.InputType, SdkHttpRequest>) async throws {
        let builder = context.getRequest().toBuilder()
        addHeader(builder: builder)
        context.updateRequest(updated: builder.build())
    }
}
