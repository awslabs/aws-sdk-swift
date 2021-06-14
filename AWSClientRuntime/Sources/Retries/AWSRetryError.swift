//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public enum AWSRetryError {
    case transient
    case throttling
    case serverError
    case clientError
}

extension AWSRetryError {
    func toCRTType() -> RetryError {
        switch self {
        case .transient: return .transient
        case .throttling: return .throttling
        case .serverError: return .serverError
        case .clientError: return .clientError
        }
    }
}
