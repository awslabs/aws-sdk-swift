//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

public enum AWSSignedBodyHeader {
    case none
    case contentSha256
}

extension AWSSignedBodyHeader {
    func toCRTType() -> SignedBodyHeaderType {
        switch self {
        case .none: return .none
        case .contentSha256: return .contentSha256
        }
    }
}
