//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.BearerTokenIdentityResolver
import struct SmithyIdentity.BearerTokenIdentity
import class Foundation.FileManager
import class Foundation.ISO8601DateFormatter
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.TimeInterval
import class Foundation.JSONDecoder
import class Foundation.JSONEncoder
import struct Smithy.Attributes
import AwsCommonRuntimeKit
import enum Smithy.ClientError
import func Foundation.NSHomeDirectory
@_spi(FileBasedConfig) import AWSSDKCommon
import struct Smithy.SwiftLogger

/// The bearer token identity resolver that resolves token identity using the config file & the cached SSO token.
/// This resolver does not handle creation of the SSO token; it must be created by the user beforehand (e.g., using AWS CLI, etc.).
public struct SSOBearerTokenIdentityResolver: BearerTokenIdentityResolver {
    private let profileName: String?
    private let configFilePath: String?
    private let logger: SwiftLogger = SwiftLogger(label: "SSOBearerTokenIdentityResolver")
    private let credentialFeatureIDs: [String]
    private let identityClientProvider: any IdentityClientProviding

    /// - Parameters:
    ///    - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
    ///    - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        identityClientProvider: any IdentityClientProviding
    ) {
        self.init(
            profileName: profileName,
            configFilePath: configFilePath,
            credentialFeatureIDs: [],
            identityClientProvider: identityClientProvider
        )
    }

    // Initializer used by SSOAWSCredentialIdentityResolver.
    internal init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialFeatureIDs: [String],
        identityClientProvider: any IdentityClientProviding
    ) {
        self.profileName = profileName
        self.configFilePath = configFilePath
        self.credentialFeatureIDs = credentialFeatureIDs
        self.identityClientProvider = identityClientProvider
    }

    public func getIdentity(
        identityProperties: Smithy.Attributes?
    ) async throws -> SmithyIdentity.BearerTokenIdentity {
        let fileBasedConfig = try CRTFileBasedConfiguration(configFilePath: configFilePath)
        let resolvedSSOToken = try await resolveSSOAccessToken(
            fileBasedConfig: fileBasedConfig,
            ssoOIDCClient: identityClientProvider.ssoOIDCClient
        )
        return BearerTokenIdentity(token: resolvedSSOToken)
    }

    private func resolveSSOAccessToken(
        fileBasedConfig: CRTFileBasedConfiguration,
        ssoOIDCClient: IdentityProvidingSSOOIDCClient
    ) async throws -> String {
        let (ssoSessionName, cachedToken) = try loadCachedSSOToken(fileBasedConfig: fileBasedConfig)

        if !cachedToken.needsRefresh() {
            return cachedToken.accessToken
        }
        if cachedToken.canRefresh() {
            return try await refreshAndCacheToken(
                token: cachedToken,
                fileBasedConfig: fileBasedConfig,
                ssoSessionName: ssoSessionName,
                ssoOIDCClient: ssoOIDCClient
            ).accessToken
        }
        if cachedToken.tokenIsExpired() {
            throw ClientError.dataNotFound("Cached SSO token is expired and cannot be refreshed.")
        }
        return cachedToken.accessToken
    }

    private func loadCachedSSOToken(
        fileBasedConfig: CRTFileBasedConfiguration
    ) throws -> (ssoSessionName: String, SSOToken) {
        // Get sso session name connected to given profile name; or to default profile name, if no profile name was given.
        let ssoSessionName = fileBasedConfig.getSection(
            name: profileName ?? FileBasedConfiguration.defaultProfileName, sectionType: .profile
        )?.getProperty(name: "sso_session")?.value

        // Get SHA1 hash of the name
        guard let ssoSessionName else {
            throw ClientError.dataNotFound("Failed to retrieve name of sso-session name in the config file.")
        }

        // Get the access token file URL
        let tokenFileURL = try getSSOTokenFileURL(ssoSessionName: ssoSessionName)

        // Load SSO token.
        let cachedToken = try loadToken(fileURL: tokenFileURL)
        return (ssoSessionName, cachedToken)
    }

    private func getSSOTokenFileURL(
        ssoSessionName: String
    ) throws -> URL {
        let tokenFileName = try ssoSessionName.data(using: .utf8)!.computeSHA1().encodeToHexString() + ".json"

        // Get the access token file URL
        #if os(macOS) || os(Linux)
        // On macOS, use homeDirectoryForCurrentUser
        let homeDir = FileManager.default.homeDirectoryForCurrentUser
        #else
        // On iOS, tvOS, and watchOS, use NSHomeDirectory()
        let homeDir = URL(fileURLWithPath: NSHomeDirectory(), isDirectory: true)
        #endif
        let relativePath = ".aws/sso/cache/\(tokenFileName)"
        return homeDir.appendingPathComponent(relativePath)
    }

    internal func loadToken(fileURL: URL) throws -> SSOToken {
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let token = try decoder.decode(SSOToken.self, from: data)
            return token
        } catch {
            throw ClientError.dataNotFound("Failed to load SSO token.")
        }
    }

    private func refreshAndCacheToken(
        token: SSOToken,
        fileBasedConfig: CRTFileBasedConfiguration,
        ssoSessionName: String,
        ssoOIDCClient: IdentityProvidingSSOOIDCClient
    ) async throws -> SSOToken {
        let ssoRegion = fileBasedConfig.getSection(
            name: ssoSessionName, sectionType: .ssoSession
        )?.getProperty(name: "sso_region")?.value

        guard let ssoRegion else {
            throw ClientError.dataNotFound("The sso-sesion section must contain sso_region property.")
        }

        let (newRefreshToken, newAccessToken) = try await ssoOIDCClient.createToken(
            region: ssoRegion,
            // 3 fields below are guaranteed to be non-nil for execution flow to reach here.
            clientID: token.clientId!,
            clientSecret: token.clientSecret!,
            refreshToken: token.refreshToken!,
            credentialFeatureIDs: credentialFeatureIDs
        )

        guard !newAccessToken.token.isEmpty else {
            if token.tokenIsExpired() {
                throw ClientError.dataNotFound("Expired SSO token failed to refresh.")
            } else {
                logger.debug("SSOBearerTokenIdentityResolver: Failed to refresh token.")
                // Just return original token.
                return token
            }
        }

        let refreshedToken = SSOToken(
            accessToken: newAccessToken.token,
            clientId: token.clientId,
            clientSecret: token.clientSecret,
            expiresAt: newAccessToken.expiration!,
            refreshToken: newRefreshToken,
            region: token.region,
            registrationExpiresAt: token.registrationExpiresAt,
            startUrl: token.startUrl
        )

        try refreshedToken.save(to: try getSSOTokenFileURL(ssoSessionName: ssoSessionName))
        return refreshedToken
    }
}

struct SSOToken: Codable {
    let accessToken: String
    let clientId: String?
    let clientSecret: String?
    let expiresAt: Date
    let refreshToken: String?
    let region: String?
    let registrationExpiresAt: Date?
    let startUrl: String?

    // If within 5 minutes of expiration, refresh the SSO token.
    private let REFRESH_BUFFER: TimeInterval = 60*5

    enum CodingKeys: String, CodingKey {
        case accessToken
        case clientId
        case clientSecret
        case expiresAt
        case refreshToken
        case region
        case registrationExpiresAt
        case startUrl
    }

    init(
        accessToken: String,
        clientId: String? = nil,
        clientSecret: String? = nil,
        expiresAt: Date,
        refreshToken: String? = nil,
        region: String? = nil,
        registrationExpiresAt: Date? = nil,
        startUrl: String? = nil
    ) {
        self.accessToken = accessToken
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.expiresAt = expiresAt
        self.refreshToken = refreshToken
        self.region = region
        self.registrationExpiresAt = registrationExpiresAt
        self.startUrl = startUrl
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Required fields.

        accessToken = try container.decode(String.self, forKey: .accessToken)
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime]
        let expiresAtString = try container.decode(String.self, forKey: .expiresAt)
        guard let expiresAtDate = dateFormatter.date(from: expiresAtString) else {
            throw DecodingError.dataCorruptedError(
                forKey: .expiresAt,
                in: container,
                debugDescription: "Invalid RFC3339 date string"
            )
        }
        expiresAt = expiresAtDate

        // Optional fields.

        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
        region = try container.decodeIfPresent(String.self, forKey: .region)

        if let registrationExpiresAtString = try container.decodeIfPresent(
            String.self,
            forKey: .registrationExpiresAt
        ) {
            registrationExpiresAt = dateFormatter.date(from: registrationExpiresAtString)
        } else {
            registrationExpiresAt = nil
        }

        startUrl = try container.decodeIfPresent(String.self, forKey: .startUrl)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime]

        try container.encode(accessToken, forKey: .accessToken)
        try container.encode(dateFormatter.string(from: expiresAt), forKey: .expiresAt)

        try container.encodeIfPresent(clientId, forKey: .clientId)
        try container.encodeIfPresent(clientSecret, forKey: .clientSecret)
        try container.encodeIfPresent(refreshToken, forKey: .refreshToken)
        try container.encodeIfPresent(region, forKey: .region)
        if let registrationExpiresAt = registrationExpiresAt {
            try container.encode(dateFormatter.string(from: registrationExpiresAt), forKey: .registrationExpiresAt)
        }
        try container.encodeIfPresent(startUrl, forKey: .startUrl)
    }

    // Returns true if token is expired or will expire within 5 minutes.
    func needsRefresh() -> Bool {
        let fiveMinutesFromNow = Date().addingTimeInterval(REFRESH_BUFFER)
        return expiresAt <= fiveMinutesFromNow
    }

    // All 3 fields must be present to refresh SSO token.
    func canRefresh() -> Bool {
        return clientId != nil && clientSecret != nil && refreshToken != nil
    }

    func tokenIsExpired() -> Bool {
        return Date() > expiresAt
    }

    func save(to fileURL: URL) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(self)
        try data.write(to: fileURL, options: [.atomic])
    }
}
