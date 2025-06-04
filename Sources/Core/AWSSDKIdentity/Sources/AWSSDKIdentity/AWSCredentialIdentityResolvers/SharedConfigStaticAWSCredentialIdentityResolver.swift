//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
import class Foundation.ProcessInfo
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import struct Foundation.Date
import struct Smithy.Attributes

public struct SharedConfigStaticAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    private let configFilePath: String?
    private let credentialsFilePath: String?

    public init(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) {
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
    }

    public func getIdentity(identityProperties: Smithy.Attributes?) async throws -> AWSCredentialIdentity {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )

        let resolvedProfileName = ProcessInfo.processInfo.environment["AWS_PROFILE"] ?? "default"

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
                "SharedConfigStaticAWSCredentialsResolver: No aws_secret_access_key in profile \"\(resolvedProfileName)\"."
            )
        }

        // Take session token if available.
        let sessionToken = profileSection.string(for: "aws_session_token")

        return AWSCredentialIdentity(
            accessKey: accessKey,
            secret: secretKey,
            sessionToken: sessionToken
        )
    }
}
