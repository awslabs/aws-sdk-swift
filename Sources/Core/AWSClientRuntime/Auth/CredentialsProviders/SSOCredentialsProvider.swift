//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

/// A credentials provider that sources credentials using GetRoleCredentialsRequest to the AWS Single Sign-On Service to maintain short-lived sessions.
/// [Details link](https://docs.aws.amazon.com/sdkref/latest/guide/feature-sso-credentials.html)
public struct SSOCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider

    /// - Parameters:
    ///   - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
    ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
    ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
    public init(
        profileName: String? = nil,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) throws {
        let fileBasedConfig = try CRTFileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        )
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .sso(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            tlsContext: SDKDefaultIO.shared.tlsContext,
            fileBasedConfiguration: fileBasedConfig,
            profileFileNameOverride: profileName
        ))
    }
}
