//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(SmithyReadWrite) import struct ClientRuntime.RpcV2CborError
@_spi(SmithyReadWrite) import class SmithyCBOR.Reader
import class SmithyHTTPAPI.HTTPResponse

// support awsQueryCompatible trait
extension RpcV2CborError {
    @_spi(SmithyReadWrite)
    public static func makeQueryCompatibleError(
        httpResponse: HTTPResponse,
        responseReader: Reader,
        noErrorWrapping: Bool,
        errorDetails: String?
    ) throws -> RpcV2CborError {
        let errorCode = try AwsQueryCompatibleErrorDetails.parse(errorDetails).code
        return try RpcV2CborError(
            httpResponse: httpResponse,
            responseReader: responseReader,
            noErrorWrapping: noErrorWrapping,
            code: errorCode
        )
    }
}