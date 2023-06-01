/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import protocol ClientRuntime.ServiceError

/// Provides properties for an error returned by an AWS service.
public protocol AWSServiceError: ServiceError {

    /// The Request ID for a request made to an AWS service, if available.
    var requestID: String? { get }
}
