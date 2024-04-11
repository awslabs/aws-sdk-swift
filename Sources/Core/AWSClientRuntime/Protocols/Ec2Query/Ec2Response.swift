//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyReadWrite
import class SmithyXML.Reader
import ClientRuntime

public struct Ec2Response {
    public var errors: Ec2Errors?
    public var requestId: String?

    public static var httpBinding: WireResponseOutputBinding<HttpResponse, Ec2Response, SmithyXML.Reader> {
        return { httpResponse, wireResponseDocumentBinding in
            let reader = try await wireResponseDocumentBinding(httpResponse)
            var value = Ec2Response()
            value.errors = try reader["Errors"].readIfPresent(with: Ec2Errors.readingClosure)
            value.requestId = try reader["RequestId"].readIfPresent() ?? reader["RequestID"].readIfPresent()
            return value
        }
    }
}
