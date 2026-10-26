//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.AWSCredentialIdentityResolver

/// wrapCredentialIdentityResolver returns the resolver wrapped in a CredentialsCache if it's an SDK resolver the refresh lifecycle covers.
@_spi(ClientConfigDefaultIdentityResolver)
public func wrapCredentialIdentityResolver(
    _ resolver: any AWSCredentialIdentityResolver
) -> any AWSCredentialIdentityResolver {
    guard resolver is RefreshLifecycleEligible else { return resolver }
    return CredentialsCache(source: resolver)
}

/// RefreshLifecycleEligible marks the SDK resolvers that get the refresh lifecycle.
protocol RefreshLifecycleEligible {}

extension STSAssumeRoleAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension STSWebIdentityAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension SSOAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension LoginAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension ECSAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension IMDSAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension ProfileAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
