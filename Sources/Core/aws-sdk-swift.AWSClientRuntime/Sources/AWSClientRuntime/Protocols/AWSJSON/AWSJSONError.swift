//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.BaseError
import enum ClientRuntime.BaseErrorDecodeError
import class SmithyHTTPAPI.HttpResponse
import class SmithyJSON.Reader

public struct AWSJSONError: BaseError {
    public let code: String
    public let message: String?
    public let requestID: String?
    public var errorBodyReader: Reader { responseReader }

    public let httpResponse: HttpResponse
    private let responseReader: Reader

    public init(httpResponse: HttpResponse, responseReader: Reader, noErrorWrapping: Bool) throws {
        let code: String? = try httpResponse.headers.value(for: "X-Amzn-Errortype")
                            ?? responseReader["code"].readIfPresent()
                            ?? responseReader["__type"].readIfPresent()
        let message: String? = try responseReader["Message"].readIfPresent()
        let requestID: String? = try responseReader["RequestId"].readIfPresent()
        guard let code else { throw BaseErrorDecodeError.missingRequiredData }
        self.code = sanitizeErrorType(code)
        self.message = message
        self.requestID = requestID
        self.httpResponse = httpResponse
        self.responseReader = responseReader
    }
}
