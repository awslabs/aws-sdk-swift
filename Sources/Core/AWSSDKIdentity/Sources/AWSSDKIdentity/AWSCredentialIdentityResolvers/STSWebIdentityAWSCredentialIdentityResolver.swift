//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class AwsCommonRuntimeKit.CredentialsProvider
import ClientRuntime
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Foundation.UUID
import struct Smithy.Attributes
@_spi(FileBasedConfig) import AWSSDKCommon
import class Foundation.ProcessInfo
import class Foundation.FileManager
import struct Foundation.URL

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

    public init(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil,
        source: STSWebIdentitySource
    ) {
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.source = source
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        let (region, roleARN, tokenFilePath, roleSessionName) = try resolveConfiguration()
        var token = try readToken(from: tokenFilePath)
        let sts = try STSClient(region: region)

        var input = AssumeRoleWithWebIdentityInput(
            roleArn: roleARN,
            roleSessionName: roleSessionName,
            webIdentityToken: token
        )

        var backoff = 0.1
        for _ in 0..<maxRetries {
            do {
                return try extractIdentity(from: try await sts.assumeRoleWithWebIdentity(input: input))
            } catch is ExpiredTokenException {
                try? await Task.sleep(nanoseconds: UInt64(backoff * 1_000_000_000))
                backoff *= 2
                token = try readToken(from: tokenFilePath) // Re-read token.
                input = AssumeRoleWithWebIdentityInput(
                    roleArn: roleARN,
                    roleSessionName: roleSessionName,
                    webIdentityToken: token
                )
            } catch is IDPCommunicationErrorException {
                try? await Task.sleep(nanoseconds: UInt64(backoff * 1_000_000_000))
                backoff *= 2
            } catch {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "STSWebIdentityAWSCredentialIdentityResolver: STS returned unretryable error - \(error)"
                )
            }
        }

        return try extractIdentity(from: try await sts.assumeRoleWithWebIdentity(input: input))
    }

    private func resolveConfiguration() throws -> (String, String, String, String) {
        switch source {
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
            let config = try CRTFileBasedConfiguration(
                configFilePath: configFilePath,
                credentialsFilePath: credentialsFilePath
            )
            let region = try resolveField("region", from: config)
            let roleARN = try resolveField("role_arn", from: config)
            let tokenFilePath = try resolveField("web_identity_token_file", from: config)
            let roleSessionName = resolveOptionalField("role_session_name", from: config) ?? UUID().uuidString
            return (region, roleARN, tokenFilePath, roleSessionName)
        }
    }

    private func resolveField(_ name: String, from config: CRTFileBasedConfiguration) throws -> String {
        guard let value = FieldResolver(
            configFieldName: name,
            fileBasedConfig: config,
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

    private func extractIdentity(from output: AssumeRoleWithWebIdentityOutput) throws -> AWSCredentialIdentity {
        guard let accessKey = output.credentials?.accessKeyId,
              let secretKey = output.credentials?.secretAccessKey else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "STSWebIdentityAWSCredentialIdentityResolver: STS response missing credentials."
            )
        }
        return AWSCredentialIdentity(
            accessKey: accessKey,
            secret: secretKey,
            expiration: output.credentials?.expiration,
            sessionToken: output.credentials?.sessionToken
        )
    }
}

// swiftlint:enable type_name

/// Enum used to determine whether `STSWebIdentityAWSCredentialIdentityResolver` looks at environment variables or the shared config profiles.
public enum STSWebIdentitySource: Sendable {
    case env
    case configFile
}
