//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

public enum AWSSignedBodyHeader {
    /// Do not add a header
    case none

    /// Add the "x-amz-content-sha256" header with the canonical request's body value
    case contentSha256
    
    func toCRTType() -> SignedBodyHeaderType {
        switch self {
        case .none: return .none
        case .contentSha256: return .contentSha256
        }
    }
}
