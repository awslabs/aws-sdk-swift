/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public extension HttpResponse {
    /// Returns true if the status code is `HttpStatusCode.notFound` and the body is empty.
    var statusCodeIsNotFoundAndBodyIsEmpty: Bool {
        return statusCode == .notFound && body.isEmpty
    }
    
    var requestId: String? {
        return headers.value(for: "x-amz-request-id")
    }
    
    var requestId2: String? {
        return headers.value(for: "x-amz-id-2")
    }
}
