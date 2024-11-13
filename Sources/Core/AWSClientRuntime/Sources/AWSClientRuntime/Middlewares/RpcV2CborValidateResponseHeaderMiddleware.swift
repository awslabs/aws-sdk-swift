//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import SmithyHTTPAPI

public struct RpcV2CborValidateResponseHeaderMiddleware<Input, Output> {
    public let id: Swift.String = "RpcV2CborValidateResponseHeaderMiddleware"

    public init() {}
}

public enum ServiceResponseError: Error {
    case missingHeader(String)
    case badHeaderValue(String)
}

extension RpcV2CborValidateResponseHeaderMiddleware: Interceptor {

    public typealias InputType = Input
    public typealias OutputType = Output
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    public func readBeforeDeserialization(context: some BeforeDeserialization<InputType, RequestType, ResponseType>) async throws {
        let response = context.getResponse()
        let smithyProtocolHeader = response.headers.value(for: "smithy-protocol")

        guard let smithyProtocolHeader else {
            throw ServiceResponseError.missingHeader("smithy-protocol header is missing from a response over RpcV2 Cbor!")
        }

        guard smithyProtocolHeader == "rpc-v2-cbor" else {
            throw ServiceResponseError.badHeaderValue("smithy-protocol header is set to \(smithyProtocolHeader) instead of expected value rpc-v2-cbor")
        }
    }
}
