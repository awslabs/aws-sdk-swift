//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyReadWrite
import SmithyXML
import ClientRuntime

public struct Ec2Response {
    public var errors: Ec2Errors?
    public var requestId: String?

    public static var httpBinding: HTTPResponseOutputBinding<Ec2Response, Reader> {
        return { httpResponse, responseDocumentBinding in
            let reader = try await responseDocumentBinding(httpResponse)
            var value = Ec2Response()
            value.errors = try reader["Errors"].readIfPresent(readingClosure: Ec2Errors.readingClosure)
            value.requestId = try reader["RequestId"].readIfPresent() ?? reader["RequestID"].readIfPresent()
            return value
        }
    }
}
