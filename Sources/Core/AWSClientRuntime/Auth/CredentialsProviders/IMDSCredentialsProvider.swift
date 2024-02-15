//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// A credentials provider that uses IMDSv2 to fetch credentials within an EC2 instance.
public struct IMDSCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider
    /// Creates a credentials provider that sources credentials from ec2 instance metadata.
    /// It will use IMDSv2 to fetch the credentials.
    public init() throws {
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .imds(
            bootstrap: SDKDefaultIO.shared.clientBootstrap
        ))
    }
}
