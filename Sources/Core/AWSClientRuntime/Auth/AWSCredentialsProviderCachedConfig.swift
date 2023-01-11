//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import Foundation

public struct AWSCredentialsProviderCachedConfig {
    public let shutDownCallback: ShutDownCallback?
    public let source: AWSCredentialsProvider
    public let refreshTime: TimeInterval
}
