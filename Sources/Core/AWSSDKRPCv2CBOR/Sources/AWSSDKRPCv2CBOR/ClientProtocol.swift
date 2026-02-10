//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class AWSClientRuntime.AwsQueryCompatibleErrorDetails
@_spi(UnknownAWSHTTPServiceError) import struct AWSClientRuntime.UnknownAWSHTTPServiceError
//import struct ClientRuntime.MutateHeadersMiddleware
import protocol ClientRuntime.HTTPError
import protocol ClientRuntime.ServiceError
import struct Foundation.Data
@_spi(RPCv2CBOR) import struct RPCv2CBOR.BaseError
import struct RPCv2CBOR.Codec
import struct RPCv2CBOR.HTTPClientProtocol
import struct Smithy.AWSQueryCompatibleTrait
import struct Smithy.AWSQueryErrorTrait
import enum Smithy.ClientError
import class Smithy.Context
import struct Smithy.ShapeID
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPRequestBuilder
import class SmithyHTTPAPI.HTTPResponse
import protocol SmithySerialization.ClientProtocol
import protocol SmithySerialization.Codec
import struct SmithySerialization.Operation
import protocol SmithySerialization.SerializableStruct
import protocol SmithySerialization.DeserializableStruct
import struct SmithySerialization.TypeRegistry

public struct ClientProtocol: SmithySerialization.ClientProtocol, Sendable {
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    public let id = ShapeID("smithy.protocols", "rpcv2Cbor")

    public var codec: any SmithySerialization.Codec = RPCv2CBOR.Codec()

    public init() {}

    public func serializeRequest<Input, Output>(operation: Operation<Input, Output>, input: Input, requestBuilder: HTTPRequestBuilder, context: Context) throws where Input: SerializableStruct, Output: DeserializableStruct {

        // AWS RPCv2CBOR serializes the same way as smithy generic.
        let smithyCBORClientProtocol = RPCv2CBOR.HTTPClientProtocol()
        try smithyCBORClientProtocol.serializeRequest(operation: operation, input: input, requestBuilder: requestBuilder, context: context)
    }

    public func deserializeResponse<Input, Output>(operation: Operation<Input, Output>, context: Context, response: HTTPResponse) async throws -> Output where Input: SerializableStruct, Output: DeserializableStruct {
        let bodyData = try await response.body.readData() ?? Data()
        if (200..<300).contains(response.statusCode.rawValue) {
            // HTTP code indicates success.  Attempt to parse the output type & return it.
            let deserializer = try codec.makeDeserializer(data: bodyData)
            return try Output.deserialize(deserializer)
        } else {
            // Since HTTP code was not 2xx or 3xx, treat response as an error.

            // Deserialize the rpcv2cbor "base error" to determine the error code.
            let typeDeserializer = try codec.makeDeserializer(data: bodyData)
            let baseError = try BaseError.deserialize(typeDeserializer)

            // Use the base error to get the error code in the error response
            let headerValue = response.headers.value(for: "x-amzn-query-error")
            let specialErrorCode = try AwsQueryCompatibleErrorDetails.parse(headerValue)?.code

            // Resolve the final error code to be used in matching the error to a modeled type
            let code = (specialErrorCode ?? baseError.__type ?? "NoCodeFound").substringAfter("#")

            // Try to find a match for the code by shape name
            let registryEntry: TypeRegistry.Entry?
            if let match = operation.errorTypeRegistry.codeLookup(code: code, matcher: { code, entry in
                code == entry.schema.id.name
            }) {
                // Code matched on shape name, return the match
                registryEntry = match
            } else if operation.serviceSchema.hasTrait(AWSQueryCompatibleTrait.self) {
                // If unable to match on shape name and this is a query-compatible service,
                // try to match on the name in the AWSQueryError trait
                registryEntry = try operation.errorTypeRegistry.codeLookup(code: code, matcher: Self.queryErrorMatcher(code:entry:))
            } else {
                registryEntry = nil
            }

            // If a type registry match was found, create that type from the response & throw
            // Else create & throw an UnknownHTTPServiceError
            if let registryEntry {

                // Code matched a modeled error.  Deserialize the error to the specific type specified in the code
                let errorDeserializer = try codec.makeDeserializer(data: bodyData)
                let error = try registryEntry.swiftType.deserialize(errorDeserializer)

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
            } else {
                throw UnknownAWSHTTPServiceError(
                    httpResponse: response,
                    message: baseError.message,
                    requestID: response.requestID,
                    requestID2: response.requestID2,
                    typeName: code
                )
            }
        }
    }

    private static func queryErrorMatcher(code: String, entry: TypeRegistry.Entry) throws -> Bool {
        let queryErrorCode = try entry.schema.getTrait(AWSQueryErrorTrait.self)?.code
        return code == queryErrorCode
    }
}
