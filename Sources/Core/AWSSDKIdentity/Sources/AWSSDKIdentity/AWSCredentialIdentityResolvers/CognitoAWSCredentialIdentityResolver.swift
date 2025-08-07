//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.AWSCredentialIdentityResolver
import class AwsCommonRuntimeKit.CredentialsProvider
import struct Smithy.Attributes
import class Foundation.ProcessInfo
import enum Smithy.ClientError

import struct Foundation.Date
@_spi(FileBasedConfig) import AWSSDKCommon

protocol CognitoIdentityClientProtocol: Sendable {
    func getId(
        identityPoolId: String,
        logins: [String: String]?,
        region: String
    ) async throws -> String

    func getCredentialsForIdentity(
        identityId: String,
        logins: [String: String]?,
        region: String
    ) async throws -> AWSCredentialIdentity
}

extension IdentityProvidingCognitoIdentityClient: CognitoIdentityClientProtocol {}

/// A credential identity resolver that resolves credentials using AWS Cognito Identity.
public actor CognitoAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let config: CognitoCredentialsConfiguration
    private var logins: [String: String]?
    private var cache = CognitoCredentialsCache()
    private nonisolated let client: CognitoIdentityClientProtocol

    public init(
        identityPoolId: String? = nil,
        identityId: String? = nil,
        accountId: String? = nil,
        logins: [String: String]? = nil,
        customRoleArn: String? = nil,
        cognitoPoolRegion: String? = nil
    ) throws {
        self.config = try CognitoCredentialsConfiguration(
            identityPoolId: identityPoolId,
            identityId: identityId,
            accountId: accountId,
            customRoleArn: customRoleArn,
            cognitoPoolRegion: cognitoPoolRegion
        )
        self.client = IdentityProvidingCognitoIdentityClient()
        self.logins = logins
        self.cache.logins = logins
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        // Return cached credentials if still valid
        if cache.isValid(for: logins) {
            return cache.credentials!
        }

        // Fetch fresh credentials
        let credentials = try await fetchCredentials()

        // Update cache
        cache.credentials = credentials
        cache.logins = logins

        return credentials
    }

    public func updateLogins(_ newLogins: [String: String]?) {
        guard logins != newLogins else { return }

        logins = newLogins
        cache.invalidate()
    }

    private func fetchCredentials() async throws -> AWSCredentialIdentity {
        let identityId = try await resolveIdentityId()

        return try await client.getCredentialsForIdentity(
            identityId: identityId,
            logins: logins,
            region: config.cognitoPoolRegion
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
            region: config.cognitoPoolRegion
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
        let cognitoPoolRegion: String

        init(
            identityPoolId: String?,
            identityId: String?,
            accountId: String?,
            customRoleArn: String?,
            cognitoPoolRegion: String?
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
            guard let region = resolver.resolveRegion(cognitoPoolRegion) else {
                throw ClientError.dataNotFound("AWS region not configured")
            }
            self.cognitoPoolRegion = region

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
        var credentials: AWSCredentialIdentity?
        var logins: [String: String]?

        mutating func invalidate() {
            identityId = nil
            credentials = nil
            logins = nil
        }

        func isValid(for currentLogins: [String: String]?) -> Bool {
            guard let creds = credentials,
                  let expiration = creds.expiration,
                  expiration > Date(),
                  logins == currentLogins else {
                return false
            }
            return true
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

        func resolveRegion(_ cognitoPoolRegion: String?) -> String? {
            if let region = resolveOptional(
                cognitoPoolRegion,
                env: "AWS_COGNITO_POOL_REGION",
                config: "cognito_pool_region"
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
        cognitoPoolRegion: String? = nil,
        cognitoClient: CognitoIdentityClientProtocol
    ) throws {
        self.config = try CognitoCredentialsConfiguration(
            identityPoolId: identityPoolId,
            identityId: identityId,
            accountId: accountId,
            customRoleArn: customRoleArn,
            cognitoPoolRegion: cognitoPoolRegion
        )
        self.client = cognitoClient
        self.logins = logins
        self.cache.logins = logins
    }
}
