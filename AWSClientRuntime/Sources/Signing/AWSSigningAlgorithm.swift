//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public enum AWSSigningAlgorithm {
    case sigv4
    
    func toCRTType() -> SigningAlgorithmType {
        switch self {
            case .sigv4: return .signingV4
        }
    }
}
