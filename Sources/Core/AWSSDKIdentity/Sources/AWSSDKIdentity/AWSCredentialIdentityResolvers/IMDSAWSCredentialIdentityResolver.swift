//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import typealias AWSSDKCommon.CRTFileBasedConfiguration
@_spi(FileBasedConfig) import struct AWSSDKCommon.FieldResolver
import struct Foundation.Date
import class Foundation.ISO8601DateFormatter
import class Foundation.JSONDecoder
import struct Foundation.URL
import struct Smithy.Attributes
import protocol SmithyIdentity.AWSCredentialIdentityResolver

/// A credentials provider that uses IMDSv2 to fetch credentials within an EC2 instance.
public actor IMDSAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    /// The IMDS client used to fetch IMDS metadata.
    private let imdsClient: EC2InstanceMetadataProvider
    /// The manual config for the name of the EC2 instance profile from which temporary IMDS credentials get sourced.
    private let ec2InstanceProfileName: String?
    /// The IMDS metadata category used to fetch EC2 instance role name if needed. Adding <role-name> to this string fetches temporary credentials for the role.
    private let credentialURLBase: String = "/latest/meta-data/iam/security-credentials/"

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

        // Resolve profile name to use. Use either customer provided one, or fetch from IMDS.
        var resolvedProfile = ec2InstanceProfileName ?? ""
        if resolvedProfile.isEmpty {
            let profileFromIMDS = try await imdsClient.get(path: credentialURLBase)
            resolvedProfile = profileFromIMDS
        }

        guard !resolvedProfile.isEmpty else {
            throw IMDSError.failedToResolveProfileName
        }

        // Fetch JSON credential response from IMDS.
        do {
            let path = credentialURLBase + resolvedProfile
            let jsonCredentialString = try await imdsClient.get(path: path)
            return try parseJSONCredentials(jsonCredentialString: jsonCredentialString)
        } catch IMDSError.metadata(.nonRetryable(let message)) where message.contains("404") {
            throw IMDSError.invalidProfileName
        }
    }

    private func throwIfIMDSDisabled() throws {
        let fileBasedConfig = try CRTFileBasedConfiguration()
        let imdsDisabled = FieldResolver(
            configValue: nil,
            envVarName: "AWS_EC2_METADATA_DISABLED",
            configFieldName: "disable_ec2_metadata",
            fileBasedConfig: fileBasedConfig,
            converter: { Bool($0.lowercased()) }
        ).value ?? false
        guard !imdsDisabled else {
            throw AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "IMDSAWSCredentialIdentityResolver: "
                + "IMDS is disabled via env var or shared config file."
            )
        }
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
        var properties = Attributes()
        properties.set(
            key: AWSIdentityPropertyKeys.credentialFeatureIDs,
            value: [CredentialFeatureID.CREDENTIALS_IMDS.rawValue]
        )
        return AWSCredentialIdentity(
            accessKey: jsonCredentials.accessKeyID,
            secret: jsonCredentials.secretAccessKey,
            accountID: jsonCredentials.accountID,
            expiration: jsonCredentials.expiration,
            sessionToken: jsonCredentials.token,
            properties: properties
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

        let lastUpdatedString = try container.decode(String.self, forKey: .lastUpdated)
        guard let lastUpdatedDate = formatter.date(from: lastUpdatedString) else {
            throw DecodingError.dataCorruptedError(forKey: .lastUpdated,
                in: container,
                debugDescription: "Invalid ISO8601 date string: \(lastUpdatedString)")
        }
        lastUpdated = lastUpdatedDate

        type = try container.decode(String.self, forKey: .type)
        accessKeyID = try container.decode(String.self, forKey: .accessKeyID)
        secretAccessKey = try container.decode(String.self, forKey: .secretAccessKey)
        token = try container.decode(String.self, forKey: .token)

        let expirationString = try container.decode(String.self, forKey: .expiration)
        guard let expirationDate = formatter.date(from: expirationString) else {
            throw DecodingError.dataCorruptedError(forKey: .expiration,
                in: container,
                debugDescription: "Invalid ISO8601 date string: \(expirationString)")
        }
        expiration = expirationDate

        accountID = try container.decodeIfPresent(String.self, forKey: .accountID)
    }
}
