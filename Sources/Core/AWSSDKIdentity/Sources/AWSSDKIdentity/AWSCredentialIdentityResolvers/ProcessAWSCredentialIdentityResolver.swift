//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
import class Foundation.ISO8601DateFormatter
import class Foundation.JSONDecoder
import class Foundation.Pipe
import class Foundation.Process
import class Foundation.ProcessInfo
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
import struct Smithy.Attributes

/// The process credential identity resolver resolves credentials from running a command or process.
/// The command to run is sourced from a profile in the AWS config file, using the standard
/// profile selection rules. The profile key the command is read from is `credential_process`.
/// E.g.:
///  [default]
///  credential_process=/opt/amazon/bin/my-credential-fetcher --argsA=abc
/// On successfully running the command, the output should be a json data with the following
/// format:
/// {
///     "Version": 1,
///     "AccessKeyId": "accesskey",
///     "SecretAccessKey": "secretAccessKey"
///     "SessionToken": "....",
///     "Expiration": "2019-05-29T00:21:43Z"
/// }
/// Version here identifies the command output format version.
public struct ProcessAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let configFilePath: String?
    private let credentialsFilePath: String?
    private let profileName: String?

    /// Creates a credentials provider that gets credentials from running a command or process.
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
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
        self.profileName = profileName
    }

    public func getIdentity(identityProperties: Smithy.Attributes? = nil) async throws -> AWSCredentialIdentity {
        let externalProcess = try fetchExternalProcessFromSharedConfig()
        let (process, pipe) = setupProcessAndOutputPipe(externalProcess: externalProcess)

        do {
            try process.run()
            process.waitUntilExit()
            guard process.terminationStatus == 0 else {
                throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                    "ProcessAWSCredentialsResolver: credential_process exited with status \(process.terminationStatus)."
                )
            }
            let jsonData = pipe.fileHandleForReading.readDataToEndOfFile()
            return try decodeCredentials(from: jsonData)
        } catch {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ProcessAWSCredentialsResolver: credential_process threw an error."
            )
        }
    }

    private func fetchExternalProcessFromSharedConfig() throws -> String {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        let resolvedProfileName = profileName ?? ProcessInfo.processInfo.environment["AWS_PROFILE"] ?? "default"

        guard let externalProcess = fileBasedConfig.section(
            for: resolvedProfileName,
            type: .profile
        )?.string(for: "credential_process") else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ProcessAWSCredentialsResolver: "
                + "credential_process not found in file based config."
            )
        }

        return externalProcess
    }

    private func setupProcessAndOutputPipe(externalProcess: String) -> (Process, Pipe) {
        let shell = ProcessInfo.processInfo.environment["SHELL"] ?? "/bin/sh"
        let process = Process()
        process.executableURL = URL(fileURLWithPath: shell)
        process.arguments = ["-c", externalProcess]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        return (process, pipe)
    }

    private func decodeCredentials(from jsonData: Data) throws -> AWSCredentialIdentity {
        do {
            let jsonCredentialResponse = try JSONDecoder().decode(ProcessJSONCredentialResponse.self, from: jsonData)
            return AWSCredentialIdentity(
                accessKey: jsonCredentialResponse.accessKeyID,
                secret: jsonCredentialResponse.secretAccessKey,
                accountID: jsonCredentialResponse.accountID,
                expiration: jsonCredentialResponse.expiration,
                sessionToken: jsonCredentialResponse.sessionToken
            )
        } catch {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "ProcessAWSCredentialsResolver: Failed to decode response from credential_process."
            )
        }
    }
}

// Serde utility for decoding JSON credential output from external process.
private struct ProcessJSONCredentialResponse: Codable {
    let version: Int
    let accessKeyID: String
    let secretAccessKey: String
    let sessionToken: String?
    let expiration: Date?
    let accountID: String?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case accessKeyID = "AccessKeyId"
        case secretAccessKey = "SecretAccessKey"
        case sessionToken = "SessionToken"
        case expiration = "Expiration"
        case accountID = "AccountId"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Required fields
        version = try container.decode(Int.self, forKey: .version)
        accessKeyID = try container.decode(String.self, forKey: .accessKeyID)
        secretAccessKey = try container.decode(String.self, forKey: .secretAccessKey)

        // Optional fields
        sessionToken = try container.decodeIfPresent(String.self, forKey: .sessionToken)
        accountID = try container.decodeIfPresent(String.self, forKey: .accountID)

        // Handle the Expiration field which is a string in ISO8601 format.
        if let expirationString = try container.decodeIfPresent(String.self, forKey: .expiration) {
            let formatter = ISO8601DateFormatter()
            expiration = formatter.date(from: expirationString)
        } else {
            expiration = nil
        }
    }
}
