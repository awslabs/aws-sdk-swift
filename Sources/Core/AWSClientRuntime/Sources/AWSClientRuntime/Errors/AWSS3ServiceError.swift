/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

public protocol AWSS3ServiceError: AWSServiceError {
    var requestID2: String? { get }
}
