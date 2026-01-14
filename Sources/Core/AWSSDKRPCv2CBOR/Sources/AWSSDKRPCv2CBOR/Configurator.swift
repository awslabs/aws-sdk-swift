//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class AWSClientRuntime.AwsQueryCompatibleErrorDetails
@_spi(UnknownAWSHTTPServiceError) import struct AWSClientRuntime.UnknownAWSHTTPServiceError
import protocol ClientRuntime.HTTPConfigurating
import struct ClientRuntime.MutateHeadersMiddleware
import class ClientRuntime.OrchestratorBuilder
import struct RPCv2CBOR.Configurator
import struct RPCv2CBOR.HTTPClientProtocol
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
import struct SmithySerialization.Operation
import protocol SmithySerialization.SerializableStruct
import protocol SmithySerialization.DeserializableStruct

public struct Configurator: HTTPConfigurating {
    public typealias ClientProtocol = RPCv2CBOR.HTTPClientProtocol

    public init() {}

    public var clientProtocol: ClientProtocol { makeClientProtocol() }

    public func configure<InputType, OutputType>(
        _ operation: Operation<InputType, OutputType>,
        _ builder: OrchestratorBuilder<InputType, OutputType, HTTPRequest, HTTPResponse>
    ) where InputType: SerializableStruct, OutputType: DeserializableStruct {

        // Create a non-AWS-specific Configurator
        var configurator = RPCv2CBOR.Configurator()

        // Set the configurator to use a ClientProtocol modified for AWS RPCv2CBOR services
        configurator.makeHTTPClientProtocol = self.makeClientProtocol

        // Run the non-AWS-specific configurator
        configurator.configure(operation, builder)

        // Now, apply AWS-specific customizations.

        // Add the `x-amz-query-mode` header if the service supports it
        if operation.serviceSchema.traits[.init("aws.protocols", "awsQueryCompatible")] != nil {
            builder.interceptors.add(MutateHeadersMiddleware(overrides: ["x-amzn-query-mode": "true"]))
        }
    }

    @Sendable
    public func makeClientProtocol() -> RPCv2CBOR.HTTPClientProtocol {

        // Create a non-AWS-specific HTTPClientProtocol
        var clientProtocol = RPCv2CBOR.HTTPClientProtocol()

        // Set the error code block to look for a query-compatible error code.
        clientProtocol.errorCodeBlock = { response in
            let headerValue = response.headers.value(for: "x-amzn-query-error")
            return try AwsQueryCompatibleErrorDetails.parse(headerValue)?.code
        }

        // Set the unknown error block to return an UnknownAWSHTTPServiceError.
        clientProtocol.unknownErrorBlock = { code, message, response in
            UnknownAWSHTTPServiceError(
                httpResponse: response,
                message: message,
                requestID: response.requestID,
                typeName: code
            )
        }

        // Return the client protocol, with AWS-specific mods applied
        return clientProtocol
    }
}
