//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
        
public struct SigningFlags {
    let useDoubleURIEncode: Bool
    let shouldNormalizeURIPath: Bool
    let omitSessionToken: Bool
}

extension SigningFlags {
    func toCRTType() -> SigningConfig.Flags {
        return SigningConfig.Flags(useDoubleURIEncode: useDoubleURIEncode,
                                   shouldNormalizeURIPath: shouldNormalizeURIPath,
                                   omitSessionToken: omitSessionToken)
    }
}
