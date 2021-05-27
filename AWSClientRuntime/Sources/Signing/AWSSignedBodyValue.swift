//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

public enum AWSSignedBodyValue {
    case empty
    case emptySha256
    case unsignedPayload
    case streamingSha256Payload
    case streamingSha256Events
}

extension AWSSignedBodyValue {
    func toCRTType() -> SignedBodyValue {
        switch self {
        case .empty: return .empty
        case .emptySha256: return .emptySha256
        case .unsignedPayload: return .unsignedPayload
        case .streamingSha256Payload: return .streamingSha256Payload
        case .streamingSha256Events: return .streamingSha256Events
        }
    }
}
