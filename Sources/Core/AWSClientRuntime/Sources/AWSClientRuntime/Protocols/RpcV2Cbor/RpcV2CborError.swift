//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.BaseError
import enum ClientRuntime.BaseErrorDecodeError
import class SmithyHTTPAPI.HTTPResponse
@_spi(SmithyReadWrite) import class SmithyCBOR.Reader

public struct RpcV2CborError: BaseError {
    public let code: String
    public let message: String?
    public let requestID: String?
    @_spi(SmithyReadWrite) public var errorBodyReader: Reader { responseReader }

    public let httpResponse: HTTPResponse
    private let responseReader: Reader

    @_spi(SmithyReadWrite)
    public init(httpResponse: HTTPResponse, responseReader: Reader, noErrorWrapping: Bool, code: String? = nil) throws {

        // Improve this code
        switch responseReader.cborValue {
        case .map(let errorDetails):
            if case let .text(errorCode) = errorDetails["__type"] {
                self.code = sanitizeErrorType(errorCode)
            } else {
                self.code = "UnknownError"
            }

            if case let .text(errorMessage) = errorDetails["Message"] {
                self.message  = errorMessage
            } else {
                self.message = nil
            }
        default:
            self.code = "UnknownError"
            self.message = nil
        }

        self.httpResponse = httpResponse
        self.responseReader = responseReader
        self.requestID = nil
    }
}

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
