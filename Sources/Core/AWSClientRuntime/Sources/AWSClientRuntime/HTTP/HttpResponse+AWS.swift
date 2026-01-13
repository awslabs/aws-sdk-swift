/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import class SmithyHTTPAPI.HTTPResponse

public extension HTTPResponse {

    /// The value of the x-amz-request-id header.
    var requestID: String? {
        return headers.value(for: "x-amz-request-id") ?? headers.value(for: "x-amzn-RequestId")
    }

    /// The value of the x-amz-id-2 header.
    var requestID2: String? {
        return headers.value(for: "x-amz-id-2")
    }
}
