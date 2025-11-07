//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
import class Foundation.FileManager
import class Foundation.ProcessInfo
import struct Foundation.URL
import struct Foundation.UUID
import struct Smithy.Attributes
import protocol SmithyIdentity.AWSCredentialIdentityResolver

// swiftlint:disable type_name
// ^ Required to mute swiftlint warning about type name being too long.

/// A credential identity resolver that exchanges a Web Identity Token for credentials from the AWS Security Token Service (STS).
///
/// For more information see [AssumeRoleWithWebIdentity](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html)
public actor STSWebIdentityAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let configFilePath: String?
    private let credentialsFilePath: String?
    private let source: STSWebIdentitySource
    private let maxRetries = 3
    private var profileName: String?
    private let credentialFeatureIDs: [String]

    public init(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        source: STSWebIdentitySource
    ) throws {
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.source = source
        self.credentialFeatureIDs = []
        guard source != .mixed else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver: "
                + "STSWebIdentitySource must be .env or .configFile for this initializer."
            )
        }
    }

    private var inlineRegion: String?
    private var inlineRoleARN: String?
    private var inlineRoleSessionName: String?
    private var inlineTokenFilePath: String?

    public init(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        region: String? = nil,
        roleArn: String? = nil,
        roleSessionName: String? = nil,
        tokenFilePath: String? = nil
    ) throws {
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.inlineRegion = region
        self.inlineRoleARN = roleArn
        self.inlineRoleSessionName = roleSessionName
        self.inlineTokenFilePath = tokenFilePath
        self.source = .mixed
        self.credentialFeatureIDs = []
    }

    public init(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        profileName: String
    ) {
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.profileName = profileName
        self.source = .configFile
        self.credentialFeatureIDs = []
    }

    // Initializer used by profile chain resolver.
    internal init(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        profileName: String,
        credentialFeatureIDs: [String]
    ) {
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.profileName = profileName
        self.source = .configFile
        self.credentialFeatureIDs = credentialFeatureIDs
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        let (region, roleARN, tokenFilePath, roleSessionName) = try resolveConfiguration()
        var token = try readToken(from: tokenFilePath)
        let tokenFeatureIDs = resolveTokenFeatureID()
        let stsClient = IdentityProvidingSTSClient()

        var backoff = 0.1
        for _ in 0..<maxRetries {
            do {
                return try await stsClient.getCredentialsWithWebIdentity(
                    region: region,
                    roleARN: roleARN,
                    roleSessionName: roleSessionName,
                    webIdentityToken: token,
                    credentialFeatureIDs: credentialFeatureIDs + tokenFeatureIDs
                )
            } catch IdentityProvidingSTSClientError.expiredTokenException {
                try? await Task.sleep(nanoseconds: UInt64(backoff * 1_000_000_000))
                backoff *= 2
                token = try readToken(from: tokenFilePath) // Re-read token.
            } catch IdentityProvidingSTSClientError.idpCommunicationErrorException {
                try? await Task.sleep(nanoseconds: UInt64(backoff * 1_000_000_000))
                backoff *= 2
            } catch {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "STSWebIdentityAWSCredentialIdentityResolver: STS returned unretryable error - \(error)"
                )
            }
        }

        return try await stsClient.getCredentialsWithWebIdentity(
            region: region,
            roleARN: roleARN,
            roleSessionName: roleSessionName,
            webIdentityToken: token,
            credentialFeatureIDs: credentialFeatureIDs + tokenFeatureIDs
        )
    }

    private func resolveConfiguration() throws -> (String, String, String, String) {
        let config = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        switch source {
        case .mixed:
            let region = try resolveField("region", inlineRegion, "AWS_REGION", "region", config)
            let roleARN = try resolveField("role ARN", inlineRoleARN, "AWS_ROLE_ARN", "role_arn", config)
            let tokenFilePath = try resolveField(
                "token file path",
                inlineTokenFilePath,
                "AWS_WEB_IDENTITY_TOKEN_FILE",
                "web_identity_token_file",
                config
            )
            let roleSessionName = try resolveOptionalField(
                "role session name",
                inlineRoleSessionName,
                "AWS_ROLE_SESSION_NAME",
                "role_session_name",
                config
            ) ?? UUID().uuidString
            return (region, roleARN, tokenFilePath, roleSessionName)
        case .env:
            let env = ProcessInfo.processInfo.environment
            guard let region = env["AWS_REGION"],
                  let roleARN = env["AWS_ROLE_ARN"],
                  let tokenFilePath = env["AWS_WEB_IDENTITY_TOKEN_FILE"] else {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "STSWebIdentityAWSCredentialIdentityResolver: Missing required environment variables."
                )
            }
            let roleSessionName = env["AWS_ROLE_SESSION_NAME"] ?? UUID().uuidString
            return (region, roleARN, tokenFilePath, roleSessionName)
        case .configFile:
            let region = try resolveField("region", from: config)
            let roleARN = try resolveField("role_arn", from: config)
            let tokenFilePath = try resolveField("web_identity_token_file", from: config)
            let roleSessionName = resolveOptionalField("role_session_name", from: config) ?? UUID().uuidString
            return (region, roleARN, tokenFilePath, roleSessionName)
        }
    }

    private func resolveField(
        _ configName: String,
        _ configValue: String?,
        _ envVarName: String,
        _ configFieldName: String,
        _ config: CRTFileBasedConfiguration,
        _ profileName: String? = nil
    ) throws -> String {
        guard let value = FieldResolver(
            configValue: configValue,
            envVarName: envVarName,
            configFieldName: configFieldName,
            fileBasedConfig: config,
            profileName: profileName,
            converter: { String($0) }
        ).value else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver: Could not resolve \(configName)."
            )
        }
        return value
    }

    private func resolveOptionalField(
        _ configName: String,
        _ configValue: String?,
        _ envVarName: String,
        _ configFieldName: String,
        _ config: CRTFileBasedConfiguration,
        _ profileName: String? = nil
    ) throws -> String? {
        FieldResolver(
            configValue: configValue,
            envVarName: envVarName,
            configFieldName: configFieldName,
            fileBasedConfig: config,
            profileName: profileName,
            converter: { String($0) }
        ).value
    }

    private func resolveField(_ name: String, from config: CRTFileBasedConfiguration) throws -> String {
        guard let value = FieldResolver(
            configFieldName: name,
            fileBasedConfig: config,
            profileName: profileName,
            converter: { String($0) }
        ).value else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver: Missing \(name) in config."
            )
        }
        return value
    }

    private func resolveOptionalField(_ name: String, from config: CRTFileBasedConfiguration) -> String? {
        FieldResolver(
            configFieldName: name,
            fileBasedConfig: config,
            profileName: profileName,
            converter: { String($0) }
        ).value
    }

    private func readToken(from path: String) throws -> String {
        let resolvedPath: String
        if path.hasPrefix("/") {
            resolvedPath = path
        } else {
            let currentDirectory = FileManager.default.currentDirectoryPath
            resolvedPath = URL(fileURLWithPath: currentDirectory)
                .appendingPathComponent(path).path
        }
        return try String(contentsOfFile: resolvedPath, encoding: .utf8)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func resolveTokenFeatureID() -> [String] {
        switch source {
        case .env:
            return [CredentialFeatureID.CREDENTIALS_ENV_VARS_STS_WEB_ID_TOKEN.rawValue]
        case .configFile:
            return [CredentialFeatureID.CREDENTIALS_PROFILE_STS_WEB_ID_TOKEN.rawValue]
        case .mixed:
            return [
                CredentialFeatureID.CREDENTIALS_ENV_VARS_STS_WEB_ID_TOKEN.rawValue,
                CredentialFeatureID.CREDENTIALS_PROFILE_STS_WEB_ID_TOKEN.rawValue
            ]
        }
    }
}

// swiftlint:enable type_name

/// Enum used to determine whether `STSWebIdentityAWSCredentialIdentityResolver` looks at environment variables or the shared config profiles.
public enum STSWebIdentitySource: Sendable {
    case env
    case configFile
    case mixed
}
