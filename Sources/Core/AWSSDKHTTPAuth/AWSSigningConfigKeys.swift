//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import SmithyChecksumsAPI
import struct Foundation.TimeInterval

public enum AWSSigningConfigKeys {
    // Keys used to store/retrieve AWSSigningConfig fields in/from signingProperties passed to AWSSigV4Signer
    public static let awsSigningAlgorithm = AttributeKey<AWSSigningAlgorithm>(name: "awsSigningAlgorithm")
    public static let signingName = AttributeKey<String>(name: "SigningName")
    public static let signingRegion = AttributeKey<String>(name: "SigningRegion")
    public static let unsignedBody = AttributeKey<Bool>(name: "UnsignedBody")
    public static let signedBodyHeader = AttributeKey<AWSSignedBodyHeader>(name: "SignedBodyHeader")
    public static let useDoubleURIEncode = AttributeKey<Bool>(name: "UseDoubleURIEncode")
    public static let shouldNormalizeURIPath = AttributeKey<Bool>(name: "ShouldNormalizeURIPath")
    public static let omitSessionToken = AttributeKey<Bool>(name: "OmitSessionToken")
    public static let signatureType = AttributeKey<AWSSignatureType>(name: "SignatureType")
    public static let bidirectionalStreaming = AttributeKey<Bool>(name: "BidirectionalStreaming")
    public static let expiration = AttributeKey<TimeInterval>(name: "Expiration")
    public static let checksum = AttributeKey<ChecksumAlgorithm>(name: "checksum")
    public static let isChunkedEligibleStream = AttributeKey<Bool>(name: "isChunkedEligibleStream")
}
