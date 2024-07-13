//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import ClientRuntime
import SmithyHTTPAPI

public struct AWSS3ErrorWith200StatusXMLMiddleware<OperationStackInput, OperationStackOutput> {
    public let id: String = "AWSS3ErrorWith200StatusXMLMiddleware"
    private let errorStatusCode: HttpStatusCode = .internalServerError

    public init() {}

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
        let xmlString = String(decoding: data, as: UTF8.self)
        return xmlString.contains("<Error>")
    }
}

extension AWSS3ErrorWith200StatusXMLMiddleware: HttpInterceptor {
    public typealias InputType = OperationStackInput
    public typealias OutputType = OperationStackOutput

    public func modifyBeforeDeserialization(
        context: some MutableResponse<Self.InputType, Self.RequestType, Self.ResponseType>
    ) async throws {
        let response = context.getResponse()
        if try await isErrorWith200Status(response: response) {
            response.statusCode = errorStatusCode
            context.updateResponse(updated: response)
        }
    }
}
