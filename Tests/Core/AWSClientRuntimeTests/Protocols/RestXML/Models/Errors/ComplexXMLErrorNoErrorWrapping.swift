//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSClientRuntime
import ClientRuntime

public struct ComplexXMLErrorNoErrorWrapping: AWSServiceError, HTTPError, Error {
    public var typeName: String?
    public var message: String?
    public var httpResponse = HttpResponse()
    public var requestID: String?
    public var header: String?
    public var nested: ComplexXMLNestedErrorData?
    public var topLevel: String?

    public init (
        header: String? = nil,
        nested: ComplexXMLNestedErrorData? = nil,
        topLevel: String? = nil
    )
    {
        self.header = header
        self.nested = nested
        self.topLevel = topLevel
    }
}
