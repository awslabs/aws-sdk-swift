//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct AWSS3ErrorWith200StatusXMLMiddleware<OperationStackOutput>: Middleware {
    public let id: String = "AWSS3ErrorWith200StatusXMLMiddleware"
    private let errorStatusCode: HttpStatusCode = .internalServerError

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

        if try await isErrorWith200Status(response: response.httpResponse) {
            // Handle the error as a 500 Internal Server Error
            let modifiedResponse = response
            modifiedResponse.httpResponse.statusCode = errorStatusCode
            return modifiedResponse
        }

        return response
    }

    private func isErrorWith200Status(response: HttpResponse) async throws -> Bool {
        // Check if the status code is OK (200)
        guard response.statusCode == .ok else {
            return false
        }

        // Check if the response body contains an XML Error
        guard let data = try await response.body.readData() else {
            return false
        }

        response.body = .data(data)
        let xmlString = String(data: data, encoding: .utf8) ?? ""
        return xmlString.contains("<Error>")
    }

    public typealias MInput = SdkHttpRequest
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext
}

extension AWSS3ErrorWith200StatusXMLMiddleware: HttpInterceptor {
    public func modifyBeforeDeserialization(context: some MutableResponse<Self.RequestType, Self.ResponseType, Self.AttributesType>) async throws {
        let response = context.getResponse()
        if try await isErrorWith200Status(response: response) {
            response.statusCode = errorStatusCode
            context.updateResponse(updated: response)
        }
    }
}
