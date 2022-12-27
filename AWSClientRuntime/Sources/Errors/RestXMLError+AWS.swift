/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

extension RestXMLError {
    public static func makeError(from response: HttpResponse) throws -> RestXMLError {
        response.statusCodeIsNotFoundAndBodyIsEmpty
            ? .makeNotFoundError(requestID: response.requestId)
            : try .init(httpResponse: response)
    }
    
    static func makeNotFoundError(requestID: String?) -> RestXMLError {
        return RestXMLError(errorCode: "NotFound", requestId: requestID)
    }
}
