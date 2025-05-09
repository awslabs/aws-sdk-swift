//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(SmithyReadWrite) import class SmithyJSON.Reader
@_spi(SmithyReadWrite) import struct ClientRuntime.RpcV2CborError
@_spi(SmithyReadWrite) import class SmithyCBOR.Reader
import class SmithyHTTPAPI.HTTPResponse

@_spi(SmithyReadWrite)
public enum AWSQueryCompatibleUtils {

    // CBOR
    public static func makeQueryCompatibleError(
        httpResponse: HTTPResponse,
        responseReader: SmithyCBOR.Reader,
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

    // awsJson1_0
    public static func makeQueryCompatibleError(
        httpResponse: HTTPResponse,
        responseReader: SmithyJSON.Reader,
        noErrorWrapping: Bool,
        errorDetails: String?
    ) throws -> AWSJSONError {
        let errorCode = try AwsQueryCompatibleErrorDetails.parse(errorDetails).code
        return try AWSJSONError(
            httpResponse: httpResponse,
            responseReader: responseReader,
            noErrorWrapping: noErrorWrapping,
            code: errorCode
        )
    }
}
