//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// Creates a credential provider that exchanges a Web Identity Token for credentials from the AWS Security Token Service (STS).
///
/// It depends on the following values sourced from either environment variables or the configuration file"
/// - region: `AWS_DEFAULT_REGION` environment variable or `region`  in a configuration file
/// - role arn: `AWS_ROLE_ARN` environment variable or `role_arn`  in  a configuration file
/// - role session name: `AWS_ROLE_SESSION_NAME` environment variable or `role_session_name` in a configuration file
/// - token file path: `AWS_WEB_IDENTITY_TOKEN_FILE` environment variable or `web_identity_token_file` in a configuration file
///
/// For more information see [AssumeRoleWithWebIdentity](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html)
public struct STSWebIdentityCredentialsProvider: CredentialsSourcedByCRT {
    public typealias T = Credentials
    
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credential provider that exchanges a Web Identity Token for credentials from the AWS Security Token Service (STS).
    ///
    /// - Parameters:
    ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
    public init(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) throws {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .stsWebIdentity(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            tlsContext: SDKDefaultIO.shared.tlsContext,
            fileBasedConfiguration: fileBasedConfig,
            shutdownCallback: nil
        ))
    }
    
    /// Returns AWS Credentials.
    ///
    /// - Parameters:
    ///   - identityProperties: Heterogeneous bag of properties that contain additional data required to resolve identity, if any.
    public func getIdentity(identityProperties: ClientRuntime.Attributes? = nil) async throws -> Credentials {
        return try await Credentials(crtCredentials: crtCredentialsProvider.getCredentials())
    }
}
