/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public let X_AMZN_REQUEST_ID_HEADER = "X-Amzn-RequestId"

public protocol AWSHttpServiceError: HttpServiceError {
    var _requestID: String? { get set }
}
