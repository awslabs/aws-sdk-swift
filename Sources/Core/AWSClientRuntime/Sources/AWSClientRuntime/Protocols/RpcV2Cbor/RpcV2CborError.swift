//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.BaseError
import enum ClientRuntime.BaseErrorDecodeError
import class SmithyHTTPAPI.HTTPResponse

public struct RpcV2CborError: BaseError {
    public let code: String
    public let message: String?
    public let requestID: String?
    @_spi(SmithyReadWrite) public var errorBodyReader: Reader { responseReader }

    public let httpResponse: HTTPResponse
    private let responseReader: Reader

    @_spi(SmithyReadWrite)
    public init(httpResponse: HTTPResponse, responseReader: Reader, noErrorWrapping: Bool, code: String? = nil) throws {
        // TODO
        self.httpResponse = httpResponse
        self.responseReader = responseReader
        self.code = code ?? "UnknownError"
        self.message = nil
        self.requestID = nil
    }
}

extension RpcV2CborError {
    @_spi(SmithyReadWrite)
    public static func makeQueryCompatibleError(
        httpResponse: HTTPResponse,
        responseReader: Reader,
        noErrorWrapping: Bool,
        errorDetails: String?
    ) throws -> AWSJSONError {
        let errorCode = try AwsQueryCompatibleErrorDetails.parse(errorDetails).code
        return try RpcV2CborError(
            httpResponse: httpResponse,
            responseReader: responseReader,
            noErrorWrapping: noErrorWrapping,
            code: errorCode
        )
    }
}
