/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import class SmithyXML.Reader

extension RestXMLError {

    /// Makes a `RestXMLError` from the provided `HttpResponse`.
    /// If the response body is empty and the status code is "not-found" aka 404, then this returns a `RestXMLError` instance with an error code of "NotFound".
    /// Otherwise, it creates an instance of `RestXMLError` by calling ``RestXMLError.init(httpResponse: HttpResponse)``.
    /// - Parameter httpResponse: The HTTP response from the server.
    /// - Parameter responseReader: The Reader created from the XML response body.
    /// - Parameter noErrorWrapping: `true` if the error is wrapped in a XML `ErrorResponse` element, `false` otherwise.
    /// - Returns: A`RestXMLError` instance with an error code of "NotFound" if the response body is empty and the status code is 404, else returns a `RestXMLError` by calling the `RestXMLError` initializer.
    /// - Throws: An error if it fails to decode the response body.
    public static func makeError(
        from httpResponse: HttpResponse,
        responseReader: SmithyXML.Reader,
        noErrorWrapping: Bool
    ) async throws -> RestXMLError {
        return httpResponse.statusCodeIsNotFoundAndBodyIsEmpty
            ? .init(code: "NotFound", message: "404 Not Found", requestID: httpResponse.requestId)
            : try .init(responseReader: responseReader, noErrorWrapping: noErrorWrapping)
    }
}
