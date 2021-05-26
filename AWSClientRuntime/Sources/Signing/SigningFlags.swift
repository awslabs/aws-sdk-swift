//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
        
public struct SigningFlags {
    /// We assume the uri will be encoded once in preparation for transmission.  Certain services
    /// do not decode before checking signature, requiring us to actually double-encode the uri in the canonical
    /// request in order to pass a signature check.
    let useDoubleURIEncode: Bool

    /// Controls whether or not the uri paths should be normalized when building the canonical request
    let shouldNormalizeURIPath: Bool

    /// Should the "X-Amz-Security-Token" query param be omitted?
    /// Normally, this parameter is added during signing if the credentials have a session token.
    /// The only known case where this should be true is when signing a websocket handshake to IoT Core.
    let omitSessionToken: Bool
}

extension SigningFlags {
    func toCRTType() -> SigningConfig.Flags {
        return SigningConfig.Flags(useDoubleURIEncode: useDoubleURIEncode,
                                   shouldNormalizeURIPath: shouldNormalizeURIPath,
                                   omitSessionToken: omitSessionToken)
    }
}
