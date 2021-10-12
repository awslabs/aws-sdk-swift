//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct Ec2QueryError {
    public let errorCode: String?
    public let requestId: String?
    public let message: String?

    public init(httpResponse: HttpResponse) throws {
        if case .data(let data) = httpResponse.body,
           let responseBody = data {
            let decoded: Ec2Response = try XMLDecoder().decode(responseBody: responseBody)
            self.errorCode = decoded.errors.error.code
            self.message = decoded.errors.error.message
            self.requestId = decoded.requestId
            return
        } else if case .stream(let byteStream) = httpResponse.body {
            let decoded: Ec2Response = try XMLDecoder().decode(responseBody: byteStream.toBytes().toData())
            self.errorCode = decoded.errors.error.code
            self.message = decoded.errors.error.message
            self.requestId = decoded.requestId
            return
        }
        errorCode = nil
        requestId = nil
        message = nil
    }
}
