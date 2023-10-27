//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import Foundation

public struct AWSSigningConfig {
    public let credentials: AWSCredentials?
    public let credentialsProvider: CredentialsProviding?
    public let expiration: TimeInterval
    public let signedBodyHeader: AWSSignedBodyHeader
    public let signedBodyValue: AWSSignedBodyValue
    public let flags: SigningFlags
    public let date: Date
    public let service: String
    public let region: String
    public let shouldSignHeader: ((String) -> Bool)?
    public let signatureType: AWSSignatureType
    public let signingAlgorithm: AWSSigningAlgorithm

    public init(
        credentials: AWSCredentials? = nil,
        credentialsProvider: CredentialsProviding? = nil,
        expiration: TimeInterval = 0,
        signedBodyHeader: AWSSignedBodyHeader = .none,
        signedBodyValue: AWSSignedBodyValue,
        flags: SigningFlags,
        date: Date,
        service: String,
        region: String,
        shouldSignHeader: ((String) -> Bool)? = nil,
        signatureType: AWSSignatureType,
        signingAlgorithm: AWSSigningAlgorithm
    ) {
        self.credentials = credentials
        self.credentialsProvider = credentialsProvider
        self.expiration = expiration
        self.signedBodyHeader = signedBodyHeader
        self.signedBodyValue = signedBodyValue
        self.flags = flags
        self.date = date
        self.service = service
        self.region = region
        self.shouldSignHeader = shouldSignHeader
        self.signatureType = signatureType
        self.signingAlgorithm = signingAlgorithm
    }
}

extension AWSSigningConfig {
    func toCRTType() throws -> SigningConfig {
        SigningConfig(
            algorithm: signingAlgorithm.toCRTType(),
            signatureType: signatureType.toCRTType(),
            service: service,
            region: region,
            date: date,
            credentials: try credentials.map { try CRTCredentials(credentials: $0) },
            credentialsProvider: try credentialsProvider?.getCRTCredentialsProvider(),
            expiration: expiration,
            signedBodyHeader: signedBodyHeader.toCRTType(),
            signedBodyValue: signedBodyValue.toCRTType(),
            shouldSignHeader: shouldSignHeader,
            useDoubleURIEncode: flags.useDoubleURIEncode,
            shouldNormalizeURIPath: flags.shouldNormalizeURIPath,
            omitSessionToken: flags.omitSessionToken
        )
    }
}
