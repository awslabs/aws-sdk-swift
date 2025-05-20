//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class AwsCommonRuntimeKit.CredentialsProvider
import class Foundation.ISO8601DateFormatter
import class Foundation.JSONDecoder
import protocol SmithyIdentity.AWSCredentialIdentityResolver
@_spi(FileBasedConfig) import struct AWSSDKCommon.FieldResolver
import struct Foundation.Date
import struct Foundation.URL
import struct Smithy.Attributes
import typealias AWSSDKCommon.CRTFileBasedConfiguration

// Temporary enum used until IMDS moves fully to IMDSv2.1.
private enum IMDSAPIVersion {
    case unknown
    case legacy // IMDSv2, w/o accountID
    case extended // IMDSv2.1, w/ AccountID
}

/// A credentials provider that uses IMDSv2 to fetch credentials within an EC2 instance.
public actor IMDSAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    /// The IMDS client used to fetch IMDS metadata.
    private let imdsClient: EC2InstanceMetadataProvider
    /// The manual config for the name of the EC2 instance profile from which temporary IMDS credentials get sourced.
    private let ec2InstanceProfileName: String?

    private var apiVersion: IMDSAPIVersion = .unknown
    private var credentialURLBase: String = ""
    // The name of the instance profile resolved by querying IMDS.
    private var resolvedProfile: String?

    /// Creates a credentials provider that sources credentials from ec2 instance metadata.
    /// It will use IMDSv2 to fetch the credentials.
    ///
    /// - Parameters:
    ///    - ec2InstanceProfileName: The name of the EC2 instance profile from which temporary IMDS credentials get sourced. Can be configured via providing the value to the initializer in-code, or via the environment variable `AWS_EC2_INSTANCE_PROFILE_NAME`, or 
    ///    - retries: The max number of retries for fetching credentials from IMDS.
    ///    - endpointMode: Configure this to use default IPv4 or default IPv6 IMDS endpoint.
    ///    - endpoint: The IMDS endpoint to send requests to.
    ///    - port: The IMDS endpoint port to send requests to.
    ///    - tokenTTL: The IMDS session token duration to request a new token with.
    public init(
        ec2InstanceProfileName: String? = nil,
        retries: Int? = nil,
        endpointMode: IMDSEndpointMode? = nil,
        endpoint: URL? = nil,
        port: Int? = nil,
        tokenTTL: Int? = nil
    ) throws {
        self.imdsClient = try IMDSClient(
            retries: retries,
            endpointMode: endpointMode,
            endpoint: endpoint,
            port: port,
            tokenTTL: tokenTTL
        )
        let fileBasedConfig = try CRTFileBasedConfiguration()
        let resolvedEC2InstanceProfileName = FieldResolver(
            configValue: ec2InstanceProfileName,
            envVarName: "AWS_EC2_INSTANCE_PROFILE_NAME",
            configFieldName: "ec2_instance_profile_name",
            fileBasedConfig: fileBasedConfig,
            profileName: nil,
            converter: { String($0) }
        ).value
        if let resolvedEC2InstanceProfileName,
           resolvedEC2InstanceProfileName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw IMDSError.invalidProfileName
        }
        self.ec2InstanceProfileName = resolvedEC2InstanceProfileName
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        try throwIfIMDSDisabled()
        credentialURLBase = resolveCredentialURLBase()

        // Resolve profile name to use.
        var profileName = ec2InstanceProfileName ?? resolvedProfile ?? ""
        if profileName.isEmpty {
            do {
                let profileFromIMDS = try await imdsClient.get(path: credentialURLBase)
                resolvedProfile = profileFromIMDS
                profileName = profileFromIMDS
                if apiVersion == .unknown {
                    apiVersion = .extended
                }
            } catch IMDSError.metadata(.nonRetryable(let message)) {
                if message.contains("404") {
                    // Change version to .legacy and recurse.
                    apiVersion = .legacy
                    return try await getIdentity(identityProperties: identityProperties)
                }
            } catch {
                throw error
            }
        }

        // Fetch JSON credential response from IMDS.
        var jsonCredentialString = ""
        do {
            let path = credentialURLBase + profileName
            jsonCredentialString = try await imdsClient.get(path: path)
            if apiVersion == .unknown {
                apiVersion = .extended
            }
        } catch IMDSError.metadata(.nonRetryable(let message)) {
            if message.contains("404") {
                if apiVersion == .unknown {
                    // Fallback to .legacy and recurse.
                    apiVersion = .legacy
                    return try await getIdentity(identityProperties: identityProperties)
                } else if ec2InstanceProfileName == nil {
                    // Remove profile name previously resolved from IMDS and recurse.
                    resolvedProfile = nil
                    return try await getIdentity(identityProperties: identityProperties)
                } else {
                    throw IMDSError.invalidProfileName
                }
            }
        } catch {
            throw IMDSError.invalidProfileName
        }

        return try parseJSONCredentials(jsonCredentialString: jsonCredentialString)
    }

    private func throwIfIMDSDisabled() throws {
        let fileBasedConfig = try CRTFileBasedConfiguration()
        let imdsDisabled = FieldResolver(
            configValue: nil,
            envVarName: "AWS_EC2_METADATA_DISABLED",
            configFieldName: "disable_ec2_metadata",
            fileBasedConfig: fileBasedConfig,
            profileName: nil,
            converter: { Bool($0.lowercased()) }
        ).value ?? false
        guard !imdsDisabled else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "IMDSAWSCredentialIdentityResolver: "
                + "IMDS is disabled via env var or shared config file."
            )
        }
    }

    private func resolveCredentialURLBase() -> String {
        return apiVersion == .legacy
        ? "/latest/meta-data/iam/security-credentials/"
        : "/latest/meta-data/iam/security-credentials-extended/"
    }

    private func parseJSONCredentials(
        jsonCredentialString: String
    ) throws -> AWSCredentialIdentity {
        guard let jsonCredentialData = jsonCredentialString.data(using: .utf8) else {
            throw IMDSError.deserializationError(
                "IMDSAWSCredentialIdentityResolver: "
                + "Failed to decode JSON credential response from IMDS."
            )
        }
        let jsonCredentials = try JSONDecoder().decode(
            JSONCredentialResponse.self,
            from: jsonCredentialData
        )
        return AWSCredentialIdentity(
            accessKey: jsonCredentials.accessKeyID,
            secret: jsonCredentials.secretAccessKey,
            accountID: jsonCredentials.accountID,
            expiration: jsonCredentials.expiration,
            sessionToken: jsonCredentials.token
        )
    }
}

private struct JSONCredentialResponse: Codable {
    let code: String
    let lastUpdated: Date
    let type: String
    let accessKeyID: String
    let secretAccessKey: String
    let token: String
    let expiration: Date
    let accountID: String?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case lastUpdated = "LastUpdated"
        case type = "Type"
        case accessKeyID = "AccessKeyId"
        case secretAccessKey = "SecretAccessKey"
        case token = "Token"
        case expiration = "Expiration"
        case accountID = "AccountId"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let formatter = ISO8601DateFormatter()

        code = try container.decode(String.self, forKey: .code)
        lastUpdated = formatter.date(from: try container.decode(String.self, forKey: .lastUpdated))!
        type = try container.decode(String.self, forKey: .type)
        accessKeyID = try container.decode(String.self, forKey: .accessKeyID)
        secretAccessKey = try container.decode(String.self, forKey: .secretAccessKey)
        token = try container.decode(String.self, forKey: .token)
        expiration = formatter.date(from: try container.decode(String.self, forKey: .expiration))!
        accountID = try container.decodeIfPresent(String.self, forKey: .accountID)
    }
}
