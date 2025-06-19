//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Smithy.Attributes
import struct SmithyIdentity.StaticAWSCredentialIdentityResolver
import class Foundation.ProcessInfo
@_spi(FileBasedConfig) import AWSSDKCommon

/// A credential identity resolver that resolves credentials from a profile in `~/.aws/config` or the shared credentials file `~/.aws/credentials`.
/// The profile name and the  locations of these files are configurable via the initializer and environment variables
///
/// This resolver supports several credentials formats:
/// ### Credentials defined explicitly within the file
/// ```ini
/// [default]
/// aws_access_key_id = my-access-key
/// aws_secret_access_key = my-secret
/// ```
///
/// ### Assumed role credentials loaded from a credential source
/// ```ini
/// [default]
/// role_arn = arn:aws:iam:123456789:role/RoleA
/// credential_source = Environment
/// ```
///
/// ### Assumed role credentials from a source profile
/// ```ini
/// [default]
/// role_arn = arn:aws:iam:123456789:role/RoleA
/// source_profile = base
///
/// [profile base]
/// aws_access_key_id = my-access-key
/// aws_secret_access_key = my-secret
/// ```
///
/// For more complex configurations see [Configuration and credential file settings](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
public struct ProfileAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let profileName: String?
    private let configFilePath: String?
    private let credentialsFilePath: String?

    /// Creates a credential identity resolver that resolves credentials from a profile in `~/.aws/config` or the shared credentials file `~/.aws/credentials`.
    ///
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
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        let resolvedProfileName = profileName ?? ProcessInfo.processInfo.environment["AWS_PROFILE"] ?? "default"
        return try await resolve(
            identityProperties: identityProperties,
            fileBasedConfig: fileBasedConfig,
            currentProfileName: resolvedProfileName
        )
    }

    private func resolve(
        identityProperties: Attributes?,
        fileBasedConfig: CRTFileBasedConfiguration,
        currentProfileName: String,
        visitedProfiles: Set<String> = []
    ) async throws -> AWSCredentialIdentity {
        guard !visitedProfiles.contains(currentProfileName) else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ProfileAWSCredentialIdentityResolver: "
                + "Circular reference detected in profile chain: "
                + "\(visitedProfiles.joined(separator: "->")) -> \(currentProfileName)"
            )
        }

        guard let profile = fileBasedConfig.getSection(
            name: currentProfileName,
            sectionType: .profile
        ) else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ProfileAWSCredentialIdentityResolver: "
                + "Profile with name \(currentProfileName) doesn't exist."
            )
        }

        let newVisited = visitedProfiles.union([currentProfileName])

        // For the current profile section, attempt to resolve credentials in order.
        for resolver in credentialResolvers(
            profile: profile,
            fileBasedConfig: fileBasedConfig,
            visitedProfiles: newVisited
        ) {
            do {
                return try await resolver(identityProperties)
            } catch {}
        }

        // If credentials couldn't be resolved from current profile section from any
        //  of the sources, throw an error.
        throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
            "ProfileAWSCredentialIdentityResolver: "
            + "Failed to resolve credentials from profile: \(currentProfileName)."
            + "All known resolution methods failed."
        )
    }

    private func credentialResolvers(
        profile: CRTFileBasedConfigurationSection,
        fileBasedConfig: CRTFileBasedConfiguration,
        visitedProfiles: Set<String>
    ) -> [(Attributes?) async throws -> AWSCredentialIdentity] {
        var resolvers: [(Attributes?) async throws -> AWSCredentialIdentity] = []

        // 1. Static credentials in profile
        if profile.hasStaticCredentials() {
            resolvers.append { _ in
                let access = profile.string(for: .init(stringLiteral: "aws_access_key_id"))!
                let secret = profile.string(for: .init(stringLiteral: "aws_secret_access_key"))!
                return AWSCredentialIdentity(accessKey: access, secret: secret)
            }
        }

        // 2. Assume role with source_profile => recurse
        if profile.hasSourceProfile() {
            resolvers.append { identityProperties in
                let sourceProfile = profile.string(for: .init(stringLiteral: "source_profile"))!
                let sourceCreds = try await resolve(
                    identityProperties: identityProperties,
                    fileBasedConfig: fileBasedConfig,
                    currentProfileName: sourceProfile,
                    visitedProfiles: visitedProfiles
                )
                return try await STSAssumeRoleAWSCredentialIdentityResolver(
                    awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(sourceCreds),
                    roleArn: profile.string(for: .init(stringLiteral: "role_arn"))!,
                    sessionName: profile.string(for: .init(stringLiteral: "role_session_name"))
                ).getIdentity(identityProperties: identityProperties)
            }
        }

        // 3. Assume role with credential_source
        if profile.hasCredentialSource() {
            resolvers.append { identityProperties in
                let credSource = profile.string(for: .init(stringLiteral: "credential_source"))!
                let sourceCreds = try await resolveFromCredentialSource(
                    profileName: profile.name,
                    source: credSource,
                    identityProperties: identityProperties
                )
                return try await STSAssumeRoleAWSCredentialIdentityResolver(
                    awsCredentialIdentityResolver: StaticAWSCredentialIdentityResolver(sourceCreds),
                    roleArn: profile.string(for: .init(stringLiteral: "role_arn"))!,
                    sessionName: profile.string(for: .init(stringLiteral: "role_session_name"))
                ).getIdentity(identityProperties: identityProperties)
            }
        }

        // 4. Assume role with web identity
        if profile.hasWebIdentityToken() {
            resolvers.append { identityProperties in
                return try await STSWebIdentityAWSCredentialIdentityResolver(
                    profileName: profile.name
                ).getIdentity(identityProperties: identityProperties)
            }
        }

        // 5. SSO role credentials
        if profile.hasSSO() {
            resolvers.append { identityProperties in
                return try await SSOAWSCredentialIdentityResolver(
                    profileName: profile.name
                ).getIdentity(identityProperties: identityProperties)
            }
        }

        // 6. External process credentials
        if profile.hasExternalProcess() {
            resolvers.append { identityProperties in
                return try await ProcessAWSCredentialIdentityResolver(
                    profileName: profile.name
                ).getIdentity(identityProperties: identityProperties)
            }
        }

        return resolvers
    }

    private func resolveFromCredentialSource(
        profileName: String,
        source: String,
        identityProperties: Attributes?
    ) async throws -> AWSCredentialIdentity {
        switch source {
        case "Environment":
            return try await EnvironmentAWSCredentialIdentityResolver().getIdentity(
                identityProperties: identityProperties
            )
        case "Ec2InstanceMetadata":
            return try await IMDSAWSCredentialIdentityResolver(
                ec2InstanceProfileName: profileName
            ).getIdentity(
                identityProperties: identityProperties
            )
        case "EcsContainer":
            return try await ECSAWSCredentialIdentityResolver().getIdentity(
                identityProperties: identityProperties
            )
        default:
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ProfileAWSCredentialIdentityResolver: "
                + "Unsupported credential_source: \(source)."
            )
        }
    }
}

// Helper functions for determining where credentials should come from.
private extension CRTFileBasedConfigurationSection {
    func hasStaticCredentials() -> Bool {
        val(for: "aws_access_key_id") != nil && val(for: "aws_secret_access_key") != nil
    }

    func hasSourceProfile() -> Bool {
        val(for: "role_arn") != nil && val(for: "source_profile") != nil
    }

    func hasCredentialSource() -> Bool {
        val(for: "role_arn") != nil && val(for: "credential_source") != nil
    }

    func hasWebIdentityToken() -> Bool {
        val(for: "role_arn") != nil && val(for: "web_identity_token_file") != nil
    }

    func hasSSO() -> Bool {
        val(for: "sso_session") != nil &&
        val(for: "sso_account_id") != nil &&
        val(for: "sso_role_name") != nil
    }

    func hasExternalProcess() -> Bool {
        val(for: "credential_process") != nil
    }

    func val(for key: String) -> String? {
        self.string(for: .init(stringLiteral: key))
    }
}
