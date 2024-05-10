/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public extension HttpResponse {

    /// The value of the x-amz-request-id header.
    var requestId: String? {
        return headers.value(for: "x-amz-request-id")
    }

    /// The value of the x-amz-id-2 header.
    var requestId2: String? {
        return headers.value(for: "x-amz-id-2")
    }
}
