//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public struct SigV4Config {
    let credentialsProvider: AWSCredentialsProvider?
    let signingService: String?
    let signatureType: AWSSignatureType
    let useDoubleURIEncode: Bool
    let shouldNormalizeURIPath: Bool
    let omitSessionToken: Bool
    let signedBodyHeader: AWSSignedBodyHeader
    let unsignedBody: Bool
    
    public init(credentialsProvider: AWSCredentialsProvider? = nil,
                signingService: String? = nil,
                signatureType: AWSSignatureType = .requestHeaders,
                useDoubleURIEncode: Bool = true,
                shouldNormalizeURIPath: Bool = true,
                omitSessionToken: Bool = false,
                signedBodyHeader: AWSSignedBodyHeader = .none,
                unsignedBody: Bool) {
        self.credentialsProvider = credentialsProvider
        self.signingService = signingService
        self.signatureType = signatureType
        self.useDoubleURIEncode = useDoubleURIEncode
        self.shouldNormalizeURIPath = shouldNormalizeURIPath
        self.omitSessionToken = omitSessionToken
        self.signedBodyHeader = signedBodyHeader
        self.unsignedBody = unsignedBody
    }
}
