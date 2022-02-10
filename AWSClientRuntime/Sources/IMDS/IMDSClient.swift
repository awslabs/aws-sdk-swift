//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

/// IMDSv2 Client
///
/// This client supports fetching tokens, retrying failures, and token caching according to the specified TTL.
/// NOTE: This client ONLY supports IMDSv2. It will not fallback to IMDSv1.
/// See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html#instance-metadata-transition-to-version-2 for more information.
public class IMDSClient {
    let crtIMDSClient: CRTIMDSClient
    private let sharedDefaultIO: SDKDefaultIO = SDKDefaultIO.shared
    
    public init(config: IMDSConfig = IMDSConfig()) {
        let crtConfig = config.toCRTConfig()
        self.crtIMDSClient = CRTIMDSClient(options: crtConfig)
    }
    
    public func get(path: String) async throws -> String? {
        return try await crtIMDSClient.getResource(resourcePath: path)
    }
}
