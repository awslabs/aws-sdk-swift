//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Date
import class AwsCommonRuntimeKit.CredentialsProvider
import ClientRuntime
import protocol SmithyIdentity.AWSCredentialIdentityResolvedByCRT
@_spi(FileBasedConfig) import AWSSDKCommon
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Smithy.Attributes
import struct Smithy.SwiftLogger

// swiftlint:disable type_name
// ^ Required to mute swiftlint warning about type name being too long.

/// A credential identity resolver that uses the default AWS credential identity resolver chain used by most AWS SDKs.
/// This is the default resolver when no credential identity resolver is provided by the user.
///
/// The chain resolves the credential identity in the following order:
/// 1. Environment - static credentials
/// 2. Environment - STS web identity
/// 3. Profile chain
///     i. Static credentials
///     ii. Assume role with source profile
///     iii. Assume role with credential source
///     iv. STS web identity
///     v. SSO
///     vi. External process
/// 4. ECS (IAM roles for tasks)
/// 5. EC2 Instance Metadata (IMDSv2)
///
/// The credentials retrieved from the chain are cached for 15 minutes.
public actor DefaultAWSCredentialIdentityResolverChain: AWSCredentialIdentityResolver {
    /// Creates a credential identity resolver that uses the default AWS credential identity resolver chain used by most AWS SDKs.
    typealias ResolverFactory = @Sendable () throws -> (any AWSCredentialIdentityResolver)

    private let resolverFactories: [ResolverFactory]
    private var cachedCredentials: AWSCredentialIdentity?

    private let logger: SwiftLogger = SwiftLogger(label: "DefaultAWSCredentialIdentityResolverChain")

    public init(
        identityClientProvider: IdentityClientProvider
    ) {
        resolverFactories = [
            { return ( EnvironmentAWSCredentialIdentityResolver()) },
            { return ( try STSWebIdentityAWSCredentialIdentityResolver(
                    source: .env,
                    identityClientProvider: identityClientProvider
                ))
            },
            { return ( ProfileAWSCredentialIdentityResolver(identityClientProvider: identityClientProvider)) },
            { return ( ECSAWSCredentialIdentityResolver()) },
            { return ( try IMDSAWSCredentialIdentityResolver()) }
        ]
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        if let cached = cachedCredentials, !shouldRefreshCredentials(expiration: cached.expiration) {
            return cached
        }

        for index in 0..<resolverFactories.count {
            do {
                let resolver = try resolverFactories[index]()
                let credentials = try await resolver.getIdentity(identityProperties: identityProperties)
                cachedCredentials = credentials
                return credentials
            } catch {
                // Log error & continue to the next resolver factory.
                logger.debug(error.localizedDescription)
            }
        }

        // None of the resolvers successfully resolved credentials.
        // Throw a descriptive error.
        throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
            "DefaultAWSCredentialIdentityRsolverChain: "
            + "Failed to resolve credentials."
        )
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
