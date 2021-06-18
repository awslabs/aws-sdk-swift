/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

/// AWS specific Service Error structure used when exact error could not be deduced from the `HttpResponse`
public struct UnknownAWSHttpServiceError: AWSHttpServiceError, Equatable {
    public var _isThrottling: Bool = false
    
    public var _statusCode: HttpStatusCode?

    public var _headers: Headers?

    public var _message: String?

    public var _requestID: String?

    public var _retryable: Bool = false

    public var _type: ErrorType = .unknown
}

extension UnknownAWSHttpServiceError {
    public init(httpResponse: HttpResponse, message: String? = nil, requestID: String? = nil) {
        self._statusCode = httpResponse.statusCode
        self._headers = httpResponse.headers
        self._requestID = requestID ?? httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)
        self._message = message
    }
}
