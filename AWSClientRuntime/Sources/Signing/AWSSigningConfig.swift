//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import struct Foundation.Date
        
public struct AWSSigningConfig {
    public let credentials: AWSCredentials?
    public let credentialsProvider: AWSCredentialsProvider?
    public let expiration: Int64
    public let signedBodyHeader: AWSSignedBodyHeader
    public let signedBodyValue: AWSSignedBodyValue
    public let flags: SigningFlags
    public let date: Date
    public let service: String
    public let region: String
    public let signatureType: AWSSignatureType
    public let signingAlgorithm: AWSSigningAlgorithm
    
    public init(credentials: AWSCredentials? = nil,
                credentialsProvider: AWSCredentialsProvider? = nil,
                expiration: Int64 = 0,
                signedBodyHeader: AWSSignedBodyHeader = .none,
                signedBodyValue: AWSSignedBodyValue,
                flags: SigningFlags,
                date: Date,
                service: String,
                region: String,
                signatureType: AWSSignatureType,
                signingAlgorithm: AWSSigningAlgorithm = .sigv4) {
        self.credentials = credentials
        self.credentialsProvider = credentialsProvider
        self.expiration = expiration
        self.signedBodyHeader = signedBodyHeader
        self.signedBodyValue = signedBodyValue
        self.flags = flags
        self.date = date
        self.service = service
        self.region = region
        self.signatureType = signatureType
        self.signingAlgorithm = signingAlgorithm
    }
}

extension AWSSigningConfig {
    func toCRTType() -> SigningConfig {
        return SigningConfig(credentials: credentials?.toCRTType(),
                             credentialsProvider: credentialsProvider?.crtCredentialsProvider,
                             date: date.awsDateTimeIntervalSince1970,
                             service: service,
                             region: region,
                             expiration: expiration,
                             signedBodyHeader: signedBodyHeader.toCRTType(),
                             signedBodyValue: signedBodyValue.toCRTType(),
                             flags: flags.toCRTType(),
                             signatureType: signatureType.toCRTType(),
                             signingAlgorithm: signingAlgorithm.toCRTType(),
                             configType: .aws)
    }
}
