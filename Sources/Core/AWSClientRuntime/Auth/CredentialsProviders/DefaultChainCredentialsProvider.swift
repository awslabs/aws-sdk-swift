//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// A credential provider that uses the default AWS credential provider chain used by most AWS SDKs.
/// This is provider is by default when no credential provider is provided when creating a service client.
///
/// The chain resolves in the following order:
/// 1. Environment
/// 2. Profile
/// 3. Web Identity Tokens (STS Web Identity)
/// 4. ECS (IAM roles for tasks)
/// 5. EC2 Instance Metadata (IMDSv2)
///
/// The credentials retrieved from the chain are cached for 15 minutes.
public struct DefaultChainCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credential provider that uses the default AWS credential provider chain used by most AWS SDKs.
    public init() throws {
        let fileBasedConfig = try CRTFileBasedConfiguration()
        try self.init(fileBasedConfig: fileBasedConfig)
    }

    @_spi(FileBasedConfig)
    public init(fileBasedConfig: CRTFileBasedConfiguration) throws {
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .defaultChain(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            fileBasedConfiguration: fileBasedConfig
        ))
    }
}
