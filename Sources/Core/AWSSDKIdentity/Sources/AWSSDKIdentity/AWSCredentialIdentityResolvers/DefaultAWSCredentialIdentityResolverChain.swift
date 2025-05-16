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
public actor DefaultAWSCredentialIdentityResolverChain: AWSCredentialIdentityResolver {
    /// Creates a credential identity resolver that uses the default AWS credential identity resolver chain used by most AWS SDKs.
    typealias ResolverFactory = @Sendable () throws -> (any AWSCredentialIdentityResolver)

    private let resolverFactories: [ResolverFactory]
    private var cachedCredentials: AWSCredentialIdentity?

    public init() {
        resolverFactories = [
            { return (try EnvironmentAWSCredentialIdentityResolver()) },
            { return (try ProfileAWSCredentialIdentityResolver()) },
            { return (try STSWebIdentityAWSCredentialIdentityResolver()) },
            { return (try ECSAWSCredentialIdentityResolver()) },
            { return (try IMDSAWSCredentialIdentityResolver()) }
        ]
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        if let cached = cachedCredentials, !shouldRefreshCredentials(expiration: cached.expiration) {
            return cached
        }

        let lastIndex = resolverFactories.count - 1
        for index in 0..<lastIndex {
            do {
                let resolver = try resolverFactories[index]()
                let credentials = try await resolver.getIdentity(identityProperties: identityProperties)
                cachedCredentials = credentials
                return credentials
            } catch {
                // Continue to the next resolver factory.
            }
        }

        // The error thrown from the last resolver is not caught and instead gets thrown to caller.
        let lastResolver = try resolverFactories[lastIndex]()
        let credentials = try await lastResolver.getIdentity(identityProperties: identityProperties)
        cachedCredentials = credentials
        return credentials
    }

    private func shouldRefreshCredentials(expiration: Date?) -> Bool {
        guard let expiration else {
            return false // No expiration provided, assume no refresh is needed
        }

        let now = Date()
        let fiveMinutesBeforeExpiration = expiration.addingTimeInterval(-300)

        // Return true if now is after (expiration - 5 minutes).
        return now >= fiveMinutesBeforeExpiration
    }
}

// swiftlint:enable type_name
