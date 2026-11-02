//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
import struct Smithy.Attributes
import struct Smithy.SwiftLogger
@_spi(SmithyIdentity) import protocol SmithyIdentity.AWSCredentialIdentityResolvedByCRT
import protocol SmithyIdentity.AWSCredentialIdentityResolver

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
/// The credentials retrieved from the chain are cached and refreshed before they expire.
public actor DefaultAWSCredentialIdentityResolverChain: AWSCredentialIdentityResolver, IdentityInvalidator {

    /// cache holds the credentials the chain resolves and refreshes them before they expire.
    private let cache: CredentialsCache

    /// Creates a credential identity resolver that uses the default AWS credential identity resolver chain used by most AWS SDKs.
    public init() {
        self.cache = CredentialsCache(source: DefaultAWSCredentialIdentityResolverChainSource())
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        try await cache.getIdentity(identityProperties: identityProperties)
    }

    func invalidate(_ identity: AWSCredentialIdentity) async {
        await cache.invalidate(identity)
    }
}

/// DefaultAWSCredentialIdentityResolverChainSource tries each resolver in order and returns the first credentials found, without caching.
struct DefaultAWSCredentialIdentityResolverChainSource: AWSCredentialIdentityResolver {

    typealias ResolverFactory = @Sendable () throws -> (any AWSCredentialIdentityResolver)

    private let resolverFactories: [ResolverFactory]

    private let logger: SwiftLogger = SwiftLogger(label: "DefaultAWSCredentialIdentityResolverChain")

    init() {
        resolverFactories = [
            { return ( EnvironmentAWSCredentialIdentityResolver()) },
            { return ( try STSWebIdentityAWSCredentialIdentityResolver(source: .env)) },
            { return ( ProfileAWSCredentialIdentityResolver()) },
            { return ( ECSAWSCredentialIdentityResolver()) },
            { return ( try IMDSAWSCredentialIdentityResolver()) }
        ]
    }

    func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        // nonRecoverableError is thrown only if no later resolver succeeds.
        var nonRecoverableError: NonRecoverableCredentialError?

        for index in 0..<resolverFactories.count {
            do {
                let resolver = try resolverFactories[index]()
                return try await resolver.getIdentity(identityProperties: identityProperties)
            } catch let error as NonRecoverableCredentialError {
                nonRecoverableError = nonRecoverableError ?? error
                logger.debug("\(error)")
            } catch {
                // Log error & continue to the next resolver factory.
                logger.debug(error.localizedDescription)
            }
        }

        if let nonRecoverableError { throw nonRecoverableError }

        // None of the resolvers successfully resolved credentials.
        // Throw a descriptive error.
        throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
            "DefaultAWSCredentialIdentityResolverChain: "
            + "Failed to resolve credentials."
        )
    }
}

// swiftlint:enable type_name
