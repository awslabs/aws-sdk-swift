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
@_spi(FileBasedConfig) import AWSSDKCommon

/// A credential identity resolver that resolves credentials using GetRoleCredentialsRequest to the AWS Single Sign-On Service to maintain short-lived sessions.
/// [Details link](https://docs.aws.amazon.com/sdkref/latest/guide/feature-sso-credentials.html)
public struct SSOAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let configFilePath: String?
    private let credentialsFilePath: String?
    private let profileName: String?

    /// - Parameters:
    ///   - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
    ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) throws {
        self.profileName = profileName
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        guard let identityProperties, let internalSSOClient = identityProperties.get(
            key: InternalClientKeys.internalSSOClientKey
        ) else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "SSOAWSCredentialIdentityResolver: "
                + "Missing IdentityProvidingSSOClient in identity properties."
            )
        }

        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        let resolvedProfileName = self.profileName ?? ProcessInfo.processInfo.environment["AWS_PROFIE"] ?? "default"
        let (accountID, roleName, region) = try fetchSSOConfigFromSharedConfigFile(
            profileName: resolvedProfileName,
            fileBasedConfig: fileBasedConfig
        )

        let ssoToken = try await SSOBearerTokenIdentityResolver(
            profileName: resolvedProfileName,
            configFilePath: configFilePath
        ).getIdentity(identityProperties: identityProperties)

        return try await internalSSOClient.getCredentialsWithSSOToken(
            region: region,
            accessToken: ssoToken.token,
            accountID: accountID,
            roleName: roleName
        )
    }

    private func fetchSSOConfigFromSharedConfigFile(
        profileName: String,
        fileBasedConfig: CRTFileBasedConfiguration
    ) throws -> (accountID: String, roleName: String, region: String) {
        // Get `sso_account_id` and `sso_role_name` properties.
        let ssoAccountID = try getProperty(profileName, .profile, "sso_account_id", fileBasedConfig)
        let ssoRoleName = try getProperty(profileName, .profile, "sso_role_name", fileBasedConfig)

        // Get `sso_region` property from sso-session section referenced by the profile section..
        let ssoSessionName = try getProperty(profileName, .profile, "sso_session", fileBasedConfig)
        let ssoRegion = try getProperty(ssoSessionName, .ssoSession, "sso_region", fileBasedConfig)

        return (ssoAccountID, ssoRoleName, ssoRegion)
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
                "Failed to retrieve \(propertyName) from \(sectionName) \(sectionType) section."
            )
        }
        return value
    }
}
