/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

extension RestXMLError {
    /// Makes a `RestXMLError` from the provided `HttpResponse`.
    /// If the response body is empty and the status code is "not-found" aka 404, then this returns a `RestXMLError` instance with an error code of "NotFound".
    /// Otherwise, it creates an instance of `RestXMLError` by calling ``RestXMLError.init(httpResponse: HttpResponse)``.
    ///
    /// - Parameter response: The HTTP response
    ///
    /// - Returns: A`RestXMLError` instance with an error code of "NotFound" if the response body is empty and the status code is 404. Otherwise returns a `RestXMLError` by calling ``RestXMLError.init(httpResponse: HttpResponse)``.
    ///
    /// - Throws: An error if it fails to decode the response body.
    public static func makeError(from response: HttpResponse) throws -> RestXMLError {
        response.statusCodeIsNotFoundAndBodyIsEmpty
            ? .makeNotFoundError(requestID: response.requestId)
            : try .init(httpResponse: response)
    }
    
    static func makeNotFoundError(requestID: String?) -> RestXMLError {
        return RestXMLError(errorCode: "NotFound", requestId: requestID)
    }
}
