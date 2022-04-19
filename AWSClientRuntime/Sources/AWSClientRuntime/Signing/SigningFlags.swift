//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
        
public struct SigningFlags {
    public let useDoubleURIEncode: Bool
    public let shouldNormalizeURIPath: Bool
    public let omitSessionToken: Bool

    public init(useDoubleURIEncode: Bool, shouldNormalizeURIPath: Bool, omitSessionToken: Bool) {
        self.useDoubleURIEncode = useDoubleURIEncode
        self.shouldNormalizeURIPath = shouldNormalizeURIPath
        self.omitSessionToken = omitSessionToken
    }
}

extension SigningFlags {
    func toCRTType() -> SigningConfig.Flags {
        return SigningConfig.Flags(useDoubleURIEncode: useDoubleURIEncode,
                                   shouldNormalizeURIPath: shouldNormalizeURIPath,
                                   omitSessionToken: omitSessionToken)
    }
}
