/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

/// AWS specific Service Error structure used when exact error could not be deduced from the `HttpResponse`
public struct UnknownAWSHttpServiceError: AWSHttpServiceError {
    /// The error type for this error, or `nil` if the type is not known.
    public var _errorType: String?

    public var _isThrottling: Bool = false

    public var _statusCode: HttpStatusCode?

    public var _headers: Headers?

    public var _message: String?

    public var _requestID: String?

    public var _retryable: Bool = false

//    public var _type: ErrorType = .unknown
}

extension UnknownAWSHttpServiceError {

    /// Creates an `UnknownAWSHttpServiceError` from a `HttpResponse` and associated parameters.
    /// - Parameters:
    ///   - httpResponse: The `HttpResponse` for this error.
    ///   - message: The message associated with this error.  Defaults to `nil`.
    ///   - requestID: The request ID associated with this error.  Defaults to `nil`.
    ///   - errorType: The error type associated with this error.  Defaults to `nil`.
    public init(
        httpResponse: HttpResponse,
        message: String? = nil,
        requestID: String? = nil,
        errorType: String? = nil
    ) {
        self._errorType = errorType
        self._statusCode = httpResponse.statusCode
        self._headers = httpResponse.headers
        self._requestID = requestID ?? httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)
        self._message = message
    }
}

extension UnknownAWSHttpServiceError: WaiterTypedError {

    /// The Smithy identifier, without namespace, for the type of this error, or `nil` if the
    /// error has no known type.
    public var waiterErrorType: String? { _errorType }
}
