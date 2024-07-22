//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import ClientRuntime
import SmithyHTTPAPI
import SmithyXML
import struct Foundation.Data
import SmithyStreams

public struct AWSS3ErrorWith200StatusXMLMiddleware<OperationStackInput, OperationStackOutput> {
    public let id: String = "AWSS3ErrorWith200StatusXMLMiddleware"
    private let errorStatusCode: HTTPStatusCode = .internalServerError

    public init() {}

    private func isRootErrorElement(data: Data) throws -> Bool {
        let reader = try Reader.from(data: data)

        // Use findNode to check if there's an "Error" node in the XML
        return reader.findNode("Error") != nil
    }

    private func isErrorWith200Status(response: HTTPResponse) async throws -> Bool {
        // Check if the status code is OK (200)
        guard response.statusCode == .ok else {
            return false
        }

        // Check if the response body contains an XML Error
        guard let data = try await response.body.readData() else {
            return false
        }

        //response.body = .data(data)
        //response.body = .stream(BufferedStream(data: data))

        return try isRootErrorElement(data: data)
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
