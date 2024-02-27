//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

public typealias CRTAWSCredentialIdentity = AwsCommonRuntimeKit.Credentials

public extension AWSCredentialIdentity {
    /// Creates `AWSCredentialIdentity` from the provided `CRTAWSCredentialIdentity`.
    ///
    /// Throws if it fails to get the access key or secret key from the underlying `CRTAWSCredentialIdentity`.
    init(crtAWSCredentialIdentity: CRTAWSCredentialIdentity) throws {
        guard let accessKey = crtAWSCredentialIdentity.getAccessKey() else {
            throw ClientError.authError("Failed to get access key.")
        }

        guard let secret = crtAWSCredentialIdentity.getSecret() else {
            throw ClientError.authError("Failed to get secret.")
        }

        self.init(
            accessKey: accessKey,
            secret: secret,
            expiration: crtAWSCredentialIdentity.getExpiration(),
            sessionToken: crtAWSCredentialIdentity.getSessionToken()
        )
    }
}

public extension CRTAWSCredentialIdentity {
    /// Creates `CRTAWSCredentialIdentity` from the provided `AWSCredentialIdentity`.
    convenience init(awsCredentialIdentity: AWSCredentialIdentity) throws {
        try self.init(
            accessKey: awsCredentialIdentity.accessKey,
            secret: awsCredentialIdentity.secret,
            sessionToken: awsCredentialIdentity.sessionToken,
            expiration: awsCredentialIdentity.expiration
        )
    }
}
