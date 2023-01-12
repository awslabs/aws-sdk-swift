//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

/// Type of signing algorithm
public enum AWSSigningAlgorithm: String {
    ///  Signature Version 4
    case sigv4
    ///  Signature Version 4 Asymmetric
    case sigv4a
}

extension AWSSigningAlgorithm {

    /// Convert self to CRT SigningAlgorithmType
    /// - Returns: SigningAlgorithmType
    func toCRTType() -> SigningAlgorithmType {
        switch self {
        case .sigv4: return .signingV4
        case .sigv4a: return .signingV4Asymmetric
        }
    }
}
