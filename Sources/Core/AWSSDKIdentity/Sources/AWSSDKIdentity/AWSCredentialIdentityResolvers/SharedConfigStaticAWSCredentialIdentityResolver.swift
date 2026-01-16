//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
import struct Foundation.Date
import class Foundation.ProcessInfo
import struct Smithy.Attributes
import protocol SmithyIdentity.AWSCredentialIdentityResolver

// swiftlint:disable type_name
/// A credential identity resolver that resolves credentials from the following shared config file properties:
///  - `aws_access_key_id`
///  - `aws_secret_access_key`
///  - `aws_session_token` (optional)
///  The profile used is either the value of environment variable `AWS_PROFILE` or `"default"` if `AWS_PROFILE` is not set.
public struct SharedConfigStaticAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let configFilePath: String?
    private let credentialsFilePath: String?
    private let profileName: String?

    /// Creates a credentials provider that gets static credentials from the shared AWS config files.
    ///
    /// - Parameters:
    ///   - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
    ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) {
        self.profileName = profileName
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
    }

    public func getIdentity(identityProperties: Smithy.Attributes?) async throws -> AWSCredentialIdentity {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )

        let resolvedProfileName = profileName ?? ProcessInfo.processInfo.environment["AWS_PROFILE"] ?? "default"

        guard let profileSection = fileBasedConfig.section(for: resolvedProfileName, type: .profile) else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "SharedConfigStaticAWSCredentialsResolver: Profile \"\(resolvedProfileName)\" not found."
            )
        }

        guard let accessKey = profileSection.string(for: "aws_access_key_id") else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "SharedConfigStaticAWSCredentialsResolver: No aws_access_key_id in profile \"\(resolvedProfileName)\"."
            )
        }

        guard let secretKey = profileSection.string(for: "aws_secret_access_key") else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "SharedConfigStaticAWSCredentialsResolver: "
                + "No aws_secret_access_key in profile \"\(resolvedProfileName)\"."
            )
        }

        // Take session token if available.
        let sessionToken = profileSection.string(for: "aws_session_token")
        // Take account ID if available.
        let accountID = profileSection.string(for: "aws_account_id")

        var properties = Attributes()
        properties.set(
            key: AWSIdentityPropertyKeys.credentialFeatureIDs,
            value: [CredentialFeatureID.CREDENTIALS_PROFILE.rawValue]
        )
        return AWSCredentialIdentity(
            accessKey: accessKey,
            secret: secretKey,
            accountID: accountID,
            sessionToken: sessionToken,
            properties: properties
        )
    }
}
// swiftlint:enable type_name
