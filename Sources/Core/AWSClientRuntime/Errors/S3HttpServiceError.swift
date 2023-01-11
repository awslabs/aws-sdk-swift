/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public protocol S3HttpServiceError: AWSHttpServiceError {
    var _requestID2: String? { get set }
}
