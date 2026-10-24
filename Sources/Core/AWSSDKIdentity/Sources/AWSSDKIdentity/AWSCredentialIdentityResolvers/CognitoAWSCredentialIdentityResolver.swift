//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class AwsCommonRuntimeKit.CredentialsProvider
import class Foundation.NSLock
import class Foundation.ProcessInfo
import struct Smithy.Attributes
import enum Smithy.ClientError
import protocol SmithyIdentity.AWSCredentialIdentityResolver

@_spi(FileBasedConfig) import AWSSDKCommon
import struct Foundation.Date

/// A credential identity resolver that resolves credentials using AWS Cognito Identity.
public actor CognitoAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let config: CognitoCredentialsConfiguration
    private var logins: [String: String]?
    private var cache = CognitoCredentialsCache()
    private nonisolated let client: CognitoIdentityClientProtocol

    /// loginsChanged notifies the caches holding this resolver's credentials when `updateLogins` changes the logins.
    nonisolated let loginsChanged = LoginsChangedHandlers()

    public init(
        identityPoolId: String? = nil,
        identityId: String? = nil,
        accountId: String? = nil,
        logins: [String: String]? = nil,
        customRoleArn: String? = nil,
        identityPoolRegion: String? = nil
    ) throws {
        self.config = try CognitoCredentialsConfiguration(
            identityPoolId: identityPoolId,
            identityId: identityId,
            accountId: accountId,
            customRoleArn: customRoleArn,
            identityPoolRegion: identityPoolRegion
        )
        self.client = IdentityProvidingCognitoIdentityClient()
        self.logins = logins
        self.cache.logins = logins
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        try await fetchCredentials()
    }

    public func updateLogins(_ newLogins: [String: String]?) async {
        guard logins != newLogins else { return }

        logins = newLogins
        cache.invalidate()
        await loginsChanged.notify()
    }

    private func fetchCredentials() async throws -> AWSCredentialIdentity {
        let identityId = try await resolveIdentityId()

        return try await client.getCredentialsForIdentity(
            identityId: identityId,
            logins: logins,
            region: config.identityPoolRegion
        )
    }

    private func resolveIdentityId() async throws -> String {
        // Use configured identity ID if available
        if let identityId = config.identityId {
            return identityId
        }

        // Use cached identity ID if logins haven't changed
        if cache.hasValidIdentityId(for: logins),
           let cachedId = cache.identityId {
            return cachedId
        }

        // Fetch new identity ID
        guard let poolId = config.identityPoolId else {
            throw ClientError.dataNotFound("Identity pool ID required for identity resolution")
        }

        let identityId = try await client.getId(
            identityPoolId: poolId,
            logins: logins,
            region: config.identityPoolRegion
        )

        // Update cache
        cache.identityId = identityId
        cache.logins = logins

        return identityId
    }

    private struct CognitoCredentialsConfiguration {
        let identityPoolId: String?
        let identityId: String?
        let accountId: String?
        let customRoleArn: String?
        let identityPoolRegion: String

        init(
            identityPoolId: String?,
            identityId: String?,
            accountId: String?,
            customRoleArn: String?,
            identityPoolRegion: String?
        ) throws {
            let fileConfig = try CRTFileBasedConfiguration()
            let resolver = ConfigurationResolver(fileConfig: fileConfig)

            // Resolve all configuration values
            self.identityPoolId = resolver.resolveOptional(
                identityPoolId,
                env: "AWS_COGNITO_IDENTITY_POOL_ID",
                config: "cognito_identity_pool_id"
            )

            self.identityId = resolver.resolveOptional(
                identityId,
                env: "AWS_COGNITO_IDENTITY_ID",
                config: "cognito_identity_id"
            )

            self.accountId = resolver.resolveOptional(
                accountId,
                env: "AWS_ACCOUNT_ID",
                config: "account_id"
            )

            self.customRoleArn = resolver.resolveOptional(
                customRoleArn,
                env: "AWS_COGNITO_CUSTOM_ROLE_ARN",
                config: "cognito_custom_role_arn"
            )

            // Resolve region with fallback
            guard let region = resolver.resolveRegion(identityPoolRegion) else {
                throw ClientError.dataNotFound("AWS region not configured")
            }
            self.identityPoolRegion = region

            // Ensure only one of identityPoolId and identityId are provided
            try validateIdentityConfiguration()
        }

        private func validateIdentityConfiguration() throws {
            switch (identityPoolId, identityId) {
            case (nil, nil):
                throw ClientError.invalidValue("Either identityPoolId or identityId must be provided")
            case (.some, .some):
                throw ClientError.invalidValue("Only one of identityPoolId or identityId must be provided")
            default:
                break // Valid configuration
            }
        }
    }

    private struct CognitoCredentialsCache {
        var identityId: String?
        var logins: [String: String]?

        mutating func invalidate() {
            identityId = nil
            logins = nil
        }

        func hasValidIdentityId(for currentLogins: [String: String]?) -> Bool {
            return identityId != nil && logins == currentLogins
        }
    }

    private struct ConfigurationResolver {
        let fileConfig: CRTFileBasedConfiguration

        func resolveOptional(
            _ value: String?,
            env: String,
            config: String
        ) -> String? {
            FieldResolver(
                configValue: value,
                envVarName: env,
                configFieldName: config,
                fileBasedConfig: fileConfig,
                converter: { String($0) }
            ).value
        }

        func resolveRegion(_ identityPoolRegion: String?) -> String? {
            if let region = resolveOptional(
                identityPoolRegion,
                env: "AWS_COGNITO_IDENTITY_POOL_REGION",
                config: "cognito_identity_pool_region"
            ) {
                return region
            }

            // Fall back
            return resolveOptional(
                nil,
                env: "AWS_REGION",
                config: "region"
            )
        }
    }

    // testing-only initializer
    internal init(
        identityPoolId: String? = nil,
        identityId: String? = nil,
        accountId: String? = nil,
        logins: [String: String]? = nil,
        customRoleArn: String? = nil,
        identityPoolRegion: String? = nil,
        cognitoClient: CognitoIdentityClientProtocol
    ) throws {
        self.config = try CognitoCredentialsConfiguration(
            identityPoolId: identityPoolId,
            identityId: identityId,
            accountId: accountId,
            customRoleArn: customRoleArn,
            identityPoolRegion: identityPoolRegion
        )
        self.client = cognitoClient
        self.logins = logins
        self.cache.logins = logins
    }
}

/// LoginsChangedHandlers holds the caches to reset when the logins change; caches that are gone are dropped on each add.
final class LoginsChangedHandlers: @unchecked Sendable {
    private struct WeakCache {
        weak var cache: CredentialsCache?
    }

    private let lock = NSLock()
    private var caches: [WeakCache] = []

    func add(_ cache: CredentialsCache) {
        lock.lock()
        defer { lock.unlock() }
        caches.removeAll { $0.cache == nil }
        caches.append(WeakCache(cache: cache))
    }

    func notify() async {
        for cache in liveCaches() { await cache.reset() }
    }

    private func liveCaches() -> [CredentialsCache] {
        lock.lock()
        defer { lock.unlock() }
        return caches.compactMap(\.cache)
    }
}
