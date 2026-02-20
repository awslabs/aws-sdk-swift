//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.ServiceError
import protocol ClientRuntime.HTTPError
import struct ClientRuntime.UnknownHTTPServiceError
import struct Foundation.Data
import enum Smithy.ClientError
import class Smithy.Context
import struct Smithy.ShapeID
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPRequestBuilder
import class SmithyHTTPAPI.HTTPResponse
import protocol SmithySerialization.ClientProtocol
import protocol SmithySerialization.Codec
import protocol SmithySerialization.DeserializableStruct
import struct SmithySerialization.Operation
import protocol SmithySerialization.SerializableStruct

public struct ClientProtocol: SmithySerialization.ClientProtocol {
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    public var id: ShapeID { try! .init("aws.protocols#awsJson1_0") }

    public var codec: any SmithySerialization.Codec = Codec()

    public init() {}

    public func serializeRequest<Input, Output>(
        operation: Operation<Input, Output>,
        input: Input,
        requestBuilder: HTTPRequestBuilder,
        context: Context
    ) throws where Input: SerializableStruct, Output: DeserializableStruct {
        let serializer = try codec.makeSerializer()
        try input.serialize(serializer)
        let data = try serializer.data
        requestBuilder.withBody(.data(data))
    }

    public func deserializeResponse<Input, Output>(
        operation: Operation<Input, Output>,
        context: Context,
        response: HTTPResponse
    ) async throws -> Output where Input: SerializableStruct, Output: DeserializableStruct {
        let data = try await response.body.readData() ?? Data()
        let deserializer = try codec.makeDeserializer(data: data)
        if (200..<300).contains(response.statusCode.rawValue) {
            return try Output.deserialize(deserializer)
        } else {
            let baseError = try BaseError.deserialize(deserializer)
            let code = baseError.__type ?? baseError.code ?? response.headers.value(for: "X-Amzn-Errortype") ?? "<NoCodeFound>"
            let strippedCode = String(code.split(separator: ":").first!.split(separator: "#").last!)
            if let entry = operation.errorTypeRegistry.codeLookup(code: strippedCode, matcher: { code, entry in
                entry.schema.id.name == code
            }) {
                let deserializer = try codec.makeDeserializer(data: data)
                let error = try entry.swiftType.deserialize(deserializer)

                // Cast the error so that we can fill its fields
                guard var modeledError = error as? ServiceError & HTTPError & Error else {
                    throw ClientError.invalidValue(
                        "Modeled error does not conform to ServiceError & HTTPError & Error.  " +
                        "This should never happen, please file a bug on aws-sdk-swift."
                    )
                }
                modeledError.message = baseError.message
                modeledError.httpResponse = response

                // Throw the error to the caller
                throw modeledError

                throw error as! Error
            } else {
                throw UnknownHTTPServiceError(httpResponse: response, message: baseError.message, typeName: code)
            }
        }
    }
}
