//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct RestXMLError {
    public let errorCode: String?
    public let requestId: String?
    public let message: String?
    public init(httpResponse: HttpResponse) throws {
        switch httpResponse.body {
        case .stream(let reader):
            let responseBody = reader.toBytes().toData()
            do {
                let decoded: ErrorResponseContainer<RestXMLErrorPayload>
                decoded = try XMLDecoder().decode(responseBody: responseBody)
                self.errorCode = decoded.error.errorCode
                self.message = decoded.error.message
                self.requestId = decoded.requestId
            } catch {
                let decoded: RestXMLErrorNoErrorWrappingPayload = try XMLDecoder().decode(responseBody: responseBody)
                self.errorCode = decoded.errorCode
                self.message = decoded.message
                self.requestId = decoded.requestId
            }
        default:
            errorCode = nil
            requestId = nil
            message = nil
        }
    }
    public init(errorCode: String? = nil, requestId: String? = nil, message: String? = nil) {
        self.errorCode = errorCode
        self.requestId = requestId
        self.message = message
    }
}
