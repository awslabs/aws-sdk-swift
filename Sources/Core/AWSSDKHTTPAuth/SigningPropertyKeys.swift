//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import SmithyHTTPAuthAPI
import struct Foundation.TimeInterval

public extension SigningPropertyKeys {
    // Keys used to store/retrieve AWSSigningConfig fields in/from signingProperties passed to AWSSigV4Signer
    static let signingAlgorithm = AttributeKey<SigningAlgorithm>(name: "signingAlgorithm")
    static let unsignedBody = AttributeKey<Bool>(name: "UnsignedBody")
    static let signedBodyHeader = AttributeKey<AWSSignedBodyHeader>(name: "SignedBodyHeader")
    static let useDoubleURIEncode = AttributeKey<Bool>(name: "UseDoubleURIEncode")
    static let shouldNormalizeURIPath = AttributeKey<Bool>(name: "ShouldNormalizeURIPath")
    static let omitSessionToken = AttributeKey<Bool>(name: "OmitSessionToken")
    static let signatureType = AttributeKey<AWSSignatureType>(name: "SignatureType")
    static let bidirectionalStreaming = AttributeKey<Bool>(name: "BidirectionalStreaming")
    static let expiration = AttributeKey<TimeInterval>(name: "Expiration")
    static let checksum = AttributeKey<String>(name: "checksum")
    static let isChunkedEligibleStream = AttributeKey<Bool>(name: "isChunkedEligibleStream")
}
