/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

/// AWS specific Service Error structure used when exact error could not be deduced from the `HttpResponse`
public struct UnknownAWSHTTPServiceError: AWSServiceError, HTTPError, Error {
    /// The error type for this error, or `nil` if the type is not known.
    public var typeName: String?

    public var message: String?

    public var requestID: String?

    public var httpResponse: HttpResponse
}

extension UnknownAWSHTTPServiceError {

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
        typeName: String? = nil
    ) {
        self.typeName = typeName
        self.message = message
        self.requestID = requestID ?? httpResponse.requestId
        self.httpResponse = httpResponse
    }
}

extension UnknownAWSHTTPServiceError {

    public static func makeError(
        httpResponse: HttpResponse,
        message: String? = nil,
        requestID: String? = nil,
        typeName: String? = nil
    ) async throws -> Error {
        UnknownAWSHTTPServiceError(
            httpResponse: httpResponse,
            message: message,
            requestID: requestID,
            typeName: typeName
        )
    }
}
