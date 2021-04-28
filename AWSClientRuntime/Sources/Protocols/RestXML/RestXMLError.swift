//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

public struct RestXMLError {
    public let errorCode: String?
    public let requestId: String?
    public init(httpResponse: HttpResponse) throws {
        if case .data(let data) = httpResponse.body,
           let responseBody = data {
            do {
            let decoded: ErrorResponseContainer<RestXMLErrorPayload> = try XMLDecoder().decode(responseBody: responseBody)
                self.errorCode = decoded.error.errorCode
                self.requestId = decoded.requestId
                return
            } catch {
                let decoded: RestXMLErrorNoErrorWrappingPayload = try XMLDecoder().decode(responseBody: responseBody)
                self.errorCode = decoded.errorCode
                self.requestId = decoded.requestId
                return
            }
        }
        errorCode = nil
        requestId = nil
    }
}
