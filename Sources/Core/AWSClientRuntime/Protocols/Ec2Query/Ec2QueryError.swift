//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct Ec2QueryError {
    public let errorCode: String? = nil
    public let requestId: String? = nil
    public let message: String? = nil

    public init(httpResponse: HttpResponse) async throws {
        guard let data = try await httpResponse.body.readData() else {
//            errorCode = nil
//            requestId = nil
//            message = nil
            return
        }
        #warning("FIXME")
//        let decoded: Ec2Response = try XMLDecoder().decode(responseBody: data)
//        self.errorCode = decoded.errors.error.code
//        self.message = decoded.errors.error.message
//        self.requestId = decoded.requestId
    }
}
