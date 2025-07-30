//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.Attributes
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct SmithyIdentity.AWSCredentialIdentity

public struct EmptyAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {

    public init() {}

    public func getIdentity(identityProperties: Attributes? = nil) async throws -> AWSCredentialIdentity {
        throw EmptyAWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
            "If you encounter this error, please file a bug report at https://github.com/awslabs/aws-sdk-swift/issues."
        )
    }
}

enum EmptyAWSCredentialIdentityResolverError: Error {
    case failedToResolveAWSCredentials(String)
}
