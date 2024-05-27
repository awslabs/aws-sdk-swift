//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyIdentityAPI
import AwsCommonRuntimeKit

/// A credential identity resolver that uses the input identity resolver to resolve the credentials.
/// The provided identity resolver must conform to `AWSCredentialIdentityResolver`.
public struct CustomAWSCredentialIdentityResolver: AWSCredentialIdentityResolvedByCRT {
    public let crtAWSCredentialIdentityResolver: AwsCommonRuntimeKit.CredentialsProvider

    /// - Parameter identityResolver: An object conforming to `AWSCredentialIdentityResolver` to resolve the credentials.
    ///
    /// - Returns: A credential identity resolver that uses the provided resolver to resolve credentials.
    public init(_ identityResolver: any AWSCredentialIdentityResolver) throws {
        self.crtAWSCredentialIdentityResolver = try AwsCommonRuntimeKit.CredentialsProvider(
            provider: AWSCredentialIdentityResolverCRTAdapter(
                awsCredentialIdentityResolver: identityResolver
            )
        )
    }
}
