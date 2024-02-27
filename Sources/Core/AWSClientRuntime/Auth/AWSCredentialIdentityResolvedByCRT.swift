//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// The protocol that concrete implementations of AWS credential identity resolvers 
/// in the SDK must implement in order to use CRT's AWS credentials provider implementation.
protocol AWSCredentialIdentityResolvedByCRT: AWSCredentialIdentityResolver {
    var crtAWSCredentialIdentityResolver: AwsCommonRuntimeKit.CredentialsProvider { get }
}
