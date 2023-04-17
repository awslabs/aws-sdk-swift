//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// A credential provider that uses another provider to assume a role from the AWS Security Token Service (STS).
///
/// When asked to provide credentials, this provider will first invoke the inner credentials provider to get AWS credentials for STS.
/// Then, it will call STS to get assumed credentials for the desired role.
///
/// For more information see [Assume role credential provider](https://docs.aws.amazon.com/sdkref/latest/guide/feature-assume-role-credentials.html)
public struct STSAssumeRoleCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credential provider that uses another provider to assume a role from the AWS Security Token Service (STS).
    ///
    /// - Parameters:
    ///   - credentialsProvider: The underlying credentials provider to be used to sign the requests made to STS
    ///   - roleArn: The ARN of the target role to assume, e.g. `arn:aws:iam:123456789:role/example`
    ///   - sessionName: The name to associate with the session. This is used to uniquely identify a session when the same role is assumed by different principals or for different reasons. In cross-account scenarios, the session name is visible to, and can be logged by the account that owns the role. The role session name is also in the ARN of the assumed role principal.
    ///   - durationSeconds: The expiry duration of the STS credentials. Defaults to 15 minutes if not set.
    public init(
        credentialsProvider: CredentialsProviding,
        roleArn: String,
        sessionName: String,
        durationSeconds: TimeInterval = .minutes(15)
    ) throws {
        self.crtCredentialsProvider = try CRTCredentialsProvider(source: .sts(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            tlsContext: SDKDefaultIO.shared.tlsContext,
            credentialsProvider: try credentialsProvider.getCRTCredentialsProvider(),
            roleArn: roleArn,
            sessionName: sessionName,
            duration: durationSeconds
        ))
    }
}
