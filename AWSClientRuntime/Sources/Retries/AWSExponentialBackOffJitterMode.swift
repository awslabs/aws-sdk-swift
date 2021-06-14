//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public enum AWSExponentialBackOffJitterMode {
    case `default`
    case none
    case full
    case decorrelated
}

extension AWSExponentialBackOffJitterMode {
    func toCRTType() -> CRTExponentialBackoffJitterMode {
        switch self {
        case .default : return .default
        case .none: return .none
        case .full: return .full
        case .decorrelated: return .decorrelated
        }
    }
}

