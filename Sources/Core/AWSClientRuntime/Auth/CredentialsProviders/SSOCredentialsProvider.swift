//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// Creates a provider that that sources credentials using GetRoleCredentialsRequest to the AWS Single
/// Sign-On Service to maintain short-lived sessions.
/// [Details link](https://docs.aws.amazon.com/sdkref/latest/guide/feature-sso-credentials.html)
/// - Parameters:
///   - profileName: name of profile to use
///   - configFilePath: name of 
///   - credentialsFilePath:
///   - bootstrap: Connection bootstrap to use for any network connections made while sourcing credentials.
///   - tlsContext: Client TLS context to use when querying STS web identity provider.
///   - fileBasedConfiguration: The file based configuration to read the configuration from.
///   - profileFileNameOverride: (Optional) Override of what profile to use to source credentials from ('default' by default)
///   - shutdownCallback:  (Optional) shutdown callback
/// - Returns: `CredentialsProvider`
/// - Throws: CommonRuntimeError.crtError
///
public struct SSOCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider
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
