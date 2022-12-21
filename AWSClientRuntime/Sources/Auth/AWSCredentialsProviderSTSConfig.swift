//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import AwsCommonRuntimeKit
import ClientRuntime
import Foundation
        
public struct AWSCredentialsProviderSTSConfig {
    public let credentialsProvider: AWSCredentialsProvider
    public let roleArn: String
    public let sessionName: String
    public let durationSeconds: TimeInterval
    public let shutDownCallback: ShutDownCallback?
    
    public init(
        credentialsProvider: AWSCredentialsProvider,
        roleArn: String,
        sessionName: String,
        durationSeconds: TimeInterval,
        shutDownCallback: ShutDownCallback? = nil
    ) throws {
        self.credentialsProvider = credentialsProvider
        self.roleArn = roleArn
        self.sessionName = sessionName
        self.durationSeconds = durationSeconds
        self.shutDownCallback = shutDownCallback
    }
}
