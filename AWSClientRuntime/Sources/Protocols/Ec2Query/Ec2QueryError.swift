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
        guard let data = httpResponse.body.toBytes()?.getData() else {
            errorCode = nil
            requestId = nil
            message = nil
            return
        }
        
        let decoded: Ec2Response = try XMLDecoder().decode(responseBody: data)
        self.errorCode = decoded.errors.error.code
        self.message = decoded.errors.error.message
        self.requestId = decoded.requestId
    }
}
