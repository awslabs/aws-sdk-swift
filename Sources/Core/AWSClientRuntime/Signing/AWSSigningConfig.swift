//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import Foundation

public struct AWSSigningConfig {
    public let credentials: AWSCredentialIdentity?
    public let awsCredentialIdentityResolver: (any AWSCredentialIdentityResolver)?
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
        credentials: AWSCredentialIdentity? = nil,
        awsCredentialIdentityResolver: (any AWSCredentialIdentityResolver)? = nil,
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
        self.awsCredentialIdentityResolver = awsCredentialIdentityResolver
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
        // Never include the Transfer-Encoding header in the signature,
        // since older versions of URLSession will modify this header's value
        // prior to sending a request.
        //
        // The Transfer-Encoding header does not affect the AWS operation being
        // performed and is just there to coordinate the flow of data to the server.
        //
        // For all other headers, use the shouldSignHeaders block that was passed to
        // determine if the header should be included in the signature.  If the
        // shouldSignHeaders block was not provided, then include all headers other
        // than Transfer-Encoding.
        let modifiedShouldSignHeader = { (name: String) in
            guard name.lowercased(with: Locale(identifier: "en_US_POSIX")) != "transfer-encoding" else { return false }
            return shouldSignHeader?(name) ?? true
        }

        return SigningConfig(
            algorithm: signingAlgorithm.toCRTType(),
            signatureType: signatureType.toCRTType(),
            service: service,
            region: region,
            date: date,
            credentials: try credentials.map {
                try CRTAWSCredentialIdentity(awsCredentialIdentity: $0)
            },
            credentialsProvider: try awsCredentialIdentityResolver?
                .getCRTAWSCredentialIdentityResolver(),
            expiration: expiration,
            signedBodyHeader: signedBodyHeader.toCRTType(),
            signedBodyValue: signedBodyValue.toCRTType(),
            shouldSignHeader: modifiedShouldSignHeader,
            useDoubleURIEncode: flags.useDoubleURIEncode,
            shouldNormalizeURIPath: flags.shouldNormalizeURIPath,
            omitSessionToken: flags.omitSessionToken
        )
    }
}
