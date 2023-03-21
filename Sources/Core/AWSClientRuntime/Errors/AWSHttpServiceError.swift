/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public let X_AMZN_REQUEST_ID_HEADER = "X-Amzn-RequestId"

public protocol AWSHttpServiceError: HttpServiceError {
    var _requestID: String? { get set }

    /// For an error that is identifiable to a Smithy error type, the error code will be the
    /// non-namespaced name of the error shape.  For unidentified errors, the error code
    /// may be a Smithy type not handled by this SDK, or may contain other identifying
    /// information.
    var _errorCode: String? { get }
}

public extension UnknownServiceError {

    var _errorCode: String? { _errorType }
}

public extension AWSHttpServiceError {

    var _errorCode: String? { _modelName }
}
