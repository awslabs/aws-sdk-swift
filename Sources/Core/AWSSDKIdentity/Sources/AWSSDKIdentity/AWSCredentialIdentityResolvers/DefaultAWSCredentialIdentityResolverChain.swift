//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class AwsCommonRuntimeKit.CredentialsProvider
import ClientRuntime
import protocol SmithyIdentity.AWSCredentialIdentityResolvedByCRT
@_spi(FileBasedConfig) import AWSSDKCommon
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Smithy.Attributes

// swiftlint:disable type_name
// ^ Required to mute swiftlint warning about type name being too long.

/// A credential identity resolver that uses the default AWS credential identity resolver chain used by most AWS SDKs.
/// This is the default resolver when no credential identity resolver is provided by the user.
///
/// The chain resolves the credential identity in the following order:
/// 1. Environment
/// 2. Profile
/// 3. Web Identity Tokens (STS Web Identity)
/// 4. ECS (IAM roles for tasks)
/// 5. EC2 Instance Metadata (IMDSv2)
///
/// The credentials retrieved from the chain are cached for 15 minutes.
public struct DefaultAWSCredentialIdentityResolverChain: AWSCredentialIdentityResolver {
    /// Creates a credential identity resolver that uses the default AWS credential identity resolver chain used by most AWS SDKs.
    public init() {}

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        typealias ResolverFactory = () throws -> any AWSCredentialIdentityResolver

        let resolverFactories: [ResolverFactory] = [
            { try EnvironmentAWSCredentialIdentityResolver() },
            { try ProfileAWSCredentialIdentityResolver() },
            { try STSWebIdentityAWSCredentialIdentityResolver() },
            { try ECSAWSCredentialIdentityResolver() },
            { try IMDSAWSCredentialIdentityResolver() }
        ]

        let lastIndex = resolverFactories.count - 1
        for index in 0..<lastIndex {
            do {
                let resolver = try resolverFactories[index]()
                return try await resolver.getIdentity(identityProperties: identityProperties)
            } catch {
                // Continue to the next resolver factory.
            }
        }

        // The error thrown from the last resolver is not caught and instead gets thrown to caller.
        return try await resolverFactories[lastIndex]().getIdentity(identityProperties: identityProperties)
    }
}

// swiftlint:enable type_name
