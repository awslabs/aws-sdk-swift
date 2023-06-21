/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

/// AWS specific Service Error structure used when exact error could not be deduced from the `HttpResponse`
public struct UnknownAWSHTTPServiceError: AWSServiceError, HTTPError, Error {

    public var errorCode: String? { typeName }

    /// The error type name for this error, or `nil` if the type is not known.
    public var typeName: String?

    public var message: String?

    public var requestID: String?

    public var requestID2: String?

    public var httpResponse: HttpResponse
}

extension UnknownAWSHTTPServiceError {

    /// Creates an `UnknownAWSHttpServiceError` from a `HttpResponse` and associated parameters.
    /// - Parameters:
    ///   - httpResponse: The `HttpResponse` for this error.
    ///   - message: The message associated with this error.
    ///   - requestID: The request ID associated with this error.
    ///   - requestID2: The request ID2 associated with this error (defined on S3 only.)  Defaults to `nil`.
    ///   - typeName: The non-namespaced name of the error type for this error.
    public init(
        httpResponse: HttpResponse,
        message: String?,
        requestID: String?,
        requestID2: String? = nil,
        typeName: String?
    ) {
        self.typeName = typeName
        self.message = message
        self.requestID = requestID ?? httpResponse.requestId
        self.requestID2 = requestID2
        self.httpResponse = httpResponse
    }
}

extension UnknownAWSHTTPServiceError {

    /// Returns an appropriate error object to represent a HTTP response that could not be matched to a known error type.
    ///
    /// May return an instance of `UnknownAWSHTTPServiceError` or another error type.
    /// - Parameters:
    ///   - httpResponse: The HTTP/HTTPS response for the error
    ///   - message: The message associated with this error, or `nil`.
    ///   - requestID: The request ID associated with this error, or `nil`.
    ///   - requestID2: The request ID2 associated with this error (ID2 used on S3 only.)  Defaults to `nil`.
    ///   - typeName: The non-namespaced name of the error type for this error, or `nil`.
    /// - Returns: An error that represents the response.
    public static func makeError(
        httpResponse: HttpResponse,
        message: String?,
        requestID: String?,
        requestID2: String? = nil,
        typeName: String?
    ) async throws -> Error {
        let candidates: [UnknownAWSHTTPErrorCandidate.Type] = [
            InvalidAccessKeyId.self
        ]
        if let Candidate = candidates.first(where: { $0.errorCode == typeName }) {
            return Candidate.init(
                httpResponse: httpResponse,
                message: message,
                requestID: requestID,
                requestID2: requestID2
            )
        }
        return UnknownAWSHTTPServiceError(
            httpResponse: httpResponse,
            message: message,
            requestID: requestID,
            requestID2: requestID2,
            typeName: typeName
        )
    }
}
