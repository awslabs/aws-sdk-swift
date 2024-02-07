//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class ClientRuntime.HttpResponse
import class SmithyXML.Reader
import var ClientRuntime.responseDocumentBinding

public struct Ec2QueryError {
    public var errorCode: String?
    public var requestId: String?
    public var message: String?

    public init(httpResponse: HttpResponse) async throws {
        let response = try await Ec2Response.httpBinding(httpResponse, responseDocumentBinding)
        self.errorCode = response.errors?.error?.code
        self.message = response.errors?.error?.message
        self.requestId = response.requestId
    }
}
