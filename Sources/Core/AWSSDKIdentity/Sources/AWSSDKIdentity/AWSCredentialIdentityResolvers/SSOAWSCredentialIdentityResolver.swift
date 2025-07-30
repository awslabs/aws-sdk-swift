//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Smithy.Attributes
import ClientRuntime
import class Foundation.ProcessInfo
import enum Smithy.ClientError
import struct SmithyIdentity.BearerTokenIdentity
import class Foundation.FileManager
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
import class Foundation.JSONDecoder
import func Foundation.NSHomeDirectory
@_spi(FileBasedConfig) import AWSSDKCommon

/// A credential identity resolver that resolves credentials using GetRoleCredentialsRequest to the AWS Single Sign-On Service to maintain short-lived sessions.
/// [Details link](https://docs.aws.amazon.com/sdkref/latest/guide/feature-sso-credentials.html)
public struct SSOAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let configFilePath: String?
    private let credentialsFilePath: String?
    private let profileName: String?
    private let credentialFeatureIDs: [String]
    private let identityClientProvider: any IdentityClientProviding

    /// - Parameters:
    ///   - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
    ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        identityClientProvider: any IdentityClientProviding
    ) throws {
        try self.init(
            profileName: profileName,
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath,
            credentialFeatureIDs: [],
            identityClientProvider: identityClientProvider
        )
    }

    // Initializer used by profile chain reoslver.
    internal init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        credentialFeatureIDs: [String],
        identityClientProvider: IdentityClientProviding
    ) throws {
        self.profileName = profileName
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.credentialFeatureIDs = credentialFeatureIDs
        self.identityClientProvider = identityClientProvider
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        let resolvedProfileName = self.profileName ?? ProcessInfo.processInfo.environment["AWS_PROFIE"] ?? "default"
        let (accountID, roleName, ssoSessionName) = try fetchSSOConfigFromSharedConfigFile(
            profileName: resolvedProfileName,
            fileBasedConfig: fileBasedConfig
        )

        var ssoToken: BearerTokenIdentity!
        var region: String!
        var tokenFeatureIDs: [String]!
        if let ssoSessionName {
            region = try getProperty(ssoSessionName, .ssoSession, "sso_region", fileBasedConfig)
            tokenFeatureIDs = [CredentialFeatureID.CREDENTIALS_PROFILE_SSO.rawValue]
            ssoToken = try await SSOBearerTokenIdentityResolver(
                profileName: resolvedProfileName,
                configFilePath: configFilePath,
                credentialFeatureIDs: credentialFeatureIDs + tokenFeatureIDs,
                identityClientProvider: identityClientProvider
            ).getIdentity(identityProperties: identityProperties)
        } else { // Handle Legacy token flow.
            region = try getProperty(resolvedProfileName, .profile, "sso_region", fileBasedConfig)
            tokenFeatureIDs = [CredentialFeatureID.CREDENTIALS_PROFILE_SSO_LEGACY.rawValue]
            ssoToken = try await SSOBearerTokenLegacyResolver().getSSOTokenWithLegacyFlow(
                profileName: resolvedProfileName,
                fileBasedConfig: fileBasedConfig
            )
        }

        return try await identityClientProvider.ssoClient.getCredentialsWithSSOToken(
            region: region,
            accessToken: ssoToken.token,
            accountID: accountID,
            roleName: roleName,
            credentialFeatureIDs: credentialFeatureIDs + tokenFeatureIDs
        )
    }

    private func fetchSSOConfigFromSharedConfigFile(
        profileName: String,
        fileBasedConfig: CRTFileBasedConfiguration
    ) throws -> (accountID: String, roleName: String, ssoSessionName: String?) {
        // Get `sso_account_id` and `sso_role_name` properties.
        let ssoAccountID = try getProperty(profileName, .profile, "sso_account_id", fileBasedConfig)
        let ssoRoleName = try getProperty(profileName, .profile, "sso_role_name", fileBasedConfig)

        // Get sso-session name referenced by the profile section. Nil if not present.
        let ssoSessionName = fileBasedConfig
            .getSection(name: profileName, sectionType: .profile)?
            .getProperty(name: "sso_session")?
            .value

        return (ssoAccountID, ssoRoleName, ssoSessionName)
    }

    private func getProperty(
        _ sectionName: String,
        _ sectionType: CRTFileBasedConfiguration.SectionType,
        _ propertyName: String,
        _ fileBasedConfig: CRTFileBasedConfiguration
    ) throws -> String {
        guard let value = fileBasedConfig
            .getSection(name: sectionName, sectionType: sectionType)?
            .getProperty(name: propertyName)?
            .value
        else {
            throw ClientError.dataNotFound(
                "SSOAWSCredentialIdentityResolver: "
                + "Failed to retrieve \(propertyName) from \(sectionName) \(sectionType) section."
            )
        }
        return value
    }
}

// Legacy SSO token retrieval flow.
// Legacy flow:
//   - Token file is located in ~/.aws/sso/cache/<SHA-1-hash-of-sso_start_url>.json
//   - Has no token refreshing logic.
// sso-sesion flow (in SSOBearerTokenIdentityResolver):
//   - Token file is located in ~/.aws/sso/cache/<SHA-1-hash-of-sso-session-name>.json
//   - Refreshes SSO token if it's about to expire / has expired.
private struct SSOBearerTokenLegacyResolver {
    func getSSOTokenWithLegacyFlow(
        profileName: String,
        fileBasedConfig: CRTFileBasedConfiguration
    ) async throws -> BearerTokenIdentity {
        let ssoStartURL = fileBasedConfig.getSection(
            name: profileName, sectionType: .profile
        )?.getProperty(name: "sso_start_url")?.value

        guard let ssoStartURL else {
            throw ClientError.dataNotFound(
                "SSOAWSCredentialIdentityResolver: "
                + "Failed to retrieve sso_start_url in profile \(profileName)."
            )
        }

        let tokenURL = try getSSOTokenFileURL(ssoStartURL: ssoStartURL)
        let token = try loadToken(fileURL: tokenURL)

        guard Date() < token.expiresAt else {
            throw ClientError.invalidValue(
                "SSOAWSCredentialIdentityResolver: "
                + "SSO token retrieved with legacy flow has expired."
            )
        }

        return BearerTokenIdentity(token: token.accessToken, expiration: token.expiresAt)
    }

    private func getSSOTokenFileURL(
        ssoStartURL: String
    ) throws -> URL {
        let tokenFileName = try ssoStartURL.data(using: .utf8)!.computeSHA1().encodeToHexString() + ".json"

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

    private func loadToken(fileURL: URL) throws -> SSOToken {
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let token = try decoder.decode(SSOToken.self, from: data)
            return token
        } catch {
            throw ClientError.dataNotFound(
                "SSOAWSCredentialIdentityResolver: "
                + "Failed to load SSO token with legacy flow."
            )
        }
    }
}
