//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

public enum AWSSignatureType {
    case requestHeaders
    case requestQueryParams
    case requestChunk
    case requestTrailingHeaders
    case requestEvent
}

extension AWSSignatureType {
    func toCRTType() -> SignatureType {
        switch self {
        case .requestChunk: return .requestChunk
        case .requestHeaders: return .requestHeaders
        case .requestQueryParams: return .requestQueryParams
        case .requestTrailingHeaders: return .requestTrailingHeaders
        case .requestEvent: return .requestEvent
        }
    }
}
