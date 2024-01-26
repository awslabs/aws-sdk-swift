//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct AWSS3ErrorWith200StatusXMLMiddleware<OperationStackOutput>: Middleware {
    public let id: String = "AWSS3ErrorWith200StatusXMLMiddleware"

    public init() {}

    public func handle<H>(context: Context,
                          input: SdkHttpRequest,
                          next: H) async throws -> OperationOutput<OperationStackOutput>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {

        // Let the next handler in the chain process the input
        let response = try await next.handle(context: context, input: input)

        // Check if the status code is OK (200)
        guard response.httpResponse.statusCode == .ok else {
            return response
        }

        // Check if the response body contains an XML Error
        guard let data = try await response.httpResponse.body.readData() else {
            return response
        }

        response.httpResponse.body = .data(data)

        let xmlString = String(data: data, encoding: .utf8) ?? ""
        if xmlString.contains("<Error>") {
            // Handle the error as a 500 Internal Server Error
            let modifiedResponse = response
            modifiedResponse.httpResponse.statusCode = .internalServerError
            return modifiedResponse
        }

        return response
    }

    public typealias MInput = SdkHttpRequest
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext
}
