//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct PutObjectPresignedURLMiddleware<OperationStackInput, OperationStackOutput: HttpResponseBinding>: Middleware {

    public typealias MInput = SerializeStepInput<PutObjectInput>
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext

    public let id: String = "PutObjectQueryItemMiddleware"

    public func handle<H>(context: Context, input: MInput, next: H) async throws -> MOutput
        where H: Handler, Self.MInput == H.Input, Self.MOutput == H.Output, Self.Context == H.Context {

        let metadata = input.operationInput.metadata ?? [:]
        for md in metadata {
            let metadataKey = "x-amz-meta-\(md.key.urlPercentEncoding())"
            let metadataValue = md.value.urlPercentEncoding()
            input.builder.withQueryItem(URLQueryItem(name: metadataKey, value: metadataValue))
        }
        return try await next.handle(context: context, input: input)
    }
}
