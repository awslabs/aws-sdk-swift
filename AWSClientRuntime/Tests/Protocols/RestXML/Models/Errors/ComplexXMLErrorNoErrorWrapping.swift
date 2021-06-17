//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct ComplexXMLErrorNoErrorWrapping: ClientRuntime.ServiceError, Equatable {
    public var _isThrottling: Bool = false
    public var _headers: Headers?
    public var _statusCode: HttpStatusCode?
    public var _message: String?
    public var _requestID: String?
    public var _retryable: Bool = false
    public var _type: ErrorType = .client
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
