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
import struct Smithy.Attributes
import AwsCommonRuntimeKit
import enum Smithy.ClientError
import func Foundation.NSHomeDirectory
@_spi(FileBasedConfig) import AWSSDKCommon

/// The bearer token identity resolver that resolves token identity using the config file & the cached SSO token.
/// This resolver does not handle creation of the SSO token; it must be created by the user beforehand (e.g., using AWS CLI, etc.).
public struct SSOBearerTokenIdentityResolver: BearerTokenIdentityResolver {
    private let profileName: String?
    private let configFilePath: String?

    /// - Parameters:
    ///    - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
    ///    - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil
    ) throws {
        self.profileName = profileName
        self.configFilePath = configFilePath
    }

    public func getIdentity(
        identityProperties: Smithy.Attributes?
    ) async throws -> SmithyIdentity.BearerTokenIdentity {
        let fileBasedConfig = try CRTFileBasedConfiguration(configFilePath: configFilePath)
        let resolvedSSOToken = try await resolveSSOAccessToken(fileBasedConfig: fileBasedConfig)
        return BearerTokenIdentity(token: resolvedSSOToken)
    }

    private func resolveSSOAccessToken(fileBasedConfig: CRTFileBasedConfiguration) async throws -> String {
        let cachedToken = try loadCachedSSOToken(fileBasedConfig: fileBasedConfig)

        if !cachedToken.needsRefresh() {
            return cachedToken.accessToken
        }
        if cachedToken.canRefresh() {
            return try await refreshAndCacheToken(token: cachedToken).accessToken
        }
        if cachedToken.tokenIsExpired() {
            throw ClientError.dataNotFound("Cached SSO token is expired and cannot be refreshed.")
        }
        return cachedToken.accessToken
    }

    private func loadCachedSSOToken(
        fileBasedConfig: CRTFileBasedConfiguration
    ) throws -> SSOToken {
        // Get sso session name connected to given profile name; or to default profile name, if no profile name was given.
        let ssoSessionName = fileBasedConfig.getSection(
            name: profileName ?? FileBasedConfiguration.defaultProfileName, sectionType: .profile
        )?.getProperty(name: "sso_session")?.value

        // Get SHA1 hash of the name
        guard let ssoSessionName else {
            throw ClientError.dataNotFound("Failed to retrieve name of sso-session name in the config file.")
        }
        let tokenFileName = try ssoSessionName.data(using: .utf8)!.computeSHA1().encodeToHexString() + ".json"

        // Get the access token file URL
        let homeDir = getHomeDirectoryURL()
        let relativePath = ".aws/sso/cache/\(tokenFileName)"
        let tokenFileURL = homeDir.appendingPathComponent(relativePath)

        // Load SSO token.
        return try loadToken(fileURL: tokenFileURL)
    }

    private func getHomeDirectoryURL() -> URL {
        #if os(macOS) || os(Linux)
        // On macOS, use homeDirectoryForCurrentUser
        return FileManager.default.homeDirectoryForCurrentUser
        #else
        // On iOS, tvOS, and watchOS, use NSHomeDirectory()
        return URL(fileURLWithPath: NSHomeDirectory(), isDirectory: true)
        #endif
    }

    private func refreshAndCacheToken(token: SSOToken) async throws -> SSOToken {
        let refreshedToken = SSOToken(
            accessToken: "",
            clientId: token.clientId,
            clientSecret: token.clientId,
            expiresAt: Date(),
            refreshToken: "",
            region: "",
            registrationExpiresAt: token.registrationExpiresAt,
            startUrl: ""
        )
        return refreshedToken
    }
}

struct SSOToken: Decodable {
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
            throw DecodingError.dataCorruptedError(forKey: .expiresAt, in: container, debugDescription: "Invalid RFC3339 date string")
        }
        expiresAt = expiresAtDate

        // Optional fields.

        clientId = try container.decodeIfPresent(String.self, forKey: .clientId)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
        region = try container.decodeIfPresent(String.self, forKey: .region)

        if let registrationExpiresAtString = try container.decodeIfPresent(String.self, forKey: .registrationExpiresAt) {
            registrationExpiresAt = dateFormatter.date(from: registrationExpiresAtString)
        } else {
            registrationExpiresAt = nil
        }

        startUrl = try container.decodeIfPresent(String.self, forKey: .startUrl)
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
}

func loadToken(fileURL: URL) throws -> SSOToken {
    do {
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let token = try decoder.decode(SSOToken.self, from: data)
        return token
    } catch {
        throw ClientError.dataNotFound("Failed to load SSO token.")
    }
}
