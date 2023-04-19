//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct SigV4Config {
    let credentialsProvider: CredentialsProviding?
    let signingService: String?
    let signatureType: AWSSignatureType
    let useDoubleURIEncode: Bool
    let shouldNormalizeURIPath: Bool
    let omitSessionToken: Bool
    let expiration: TimeInterval
    let signedBodyHeader: AWSSignedBodyHeader
    let unsignedBody: Bool
    let signingAlgorithm: AWSSigningAlgorithm

    public init(
        credentialsProvider: CredentialsProviding? = nil,
        signingService: String? = nil,
        signatureType: AWSSignatureType = .requestHeaders,
        useDoubleURIEncode: Bool = true,
        shouldNormalizeURIPath: Bool = true,
        omitSessionToken: Bool = false,
        expiration: TimeInterval = 0,
        signedBodyHeader: AWSSignedBodyHeader = .none,
        unsignedBody: Bool,
        signingAlgorithm: AWSSigningAlgorithm
    ) {
        self.credentialsProvider = credentialsProvider
        self.signingService = signingService
        self.signatureType = signatureType
        self.useDoubleURIEncode = useDoubleURIEncode
        self.shouldNormalizeURIPath = shouldNormalizeURIPath
        self.omitSessionToken = omitSessionToken
        self.expiration = expiration
        self.signedBodyHeader = signedBodyHeader
        self.unsignedBody = unsignedBody
        self.signingAlgorithm = signingAlgorithm
    }
}
