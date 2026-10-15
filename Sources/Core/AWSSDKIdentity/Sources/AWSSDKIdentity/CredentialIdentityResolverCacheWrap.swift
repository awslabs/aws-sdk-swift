//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentity.AWSCredentialIdentityResolver

/// wrapCredentialIdentityResolver returns the resolver wrapped in a CachedAWSCredentialIdentityResolver if it's in scope and not already wrapped; nil gives the default chain.
@_spi(ClientConfigDefaultIdentityResolver)
public func wrapCredentialIdentityResolver(
    _ resolver: (any AWSCredentialIdentityResolver)?
) -> any AWSCredentialIdentityResolver {
    guard let resolver else { return DefaultAWSCredentialIdentityResolverChain() }

    // Already caches. A second cache would read the inner cache's credentials as a failed refresh.
    if resolver is DefaultAWSCredentialIdentityResolverChain { return resolver }
    if resolver is CachedAWSCredentialIdentityResolver { return resolver }

    // Customer resolvers are used as given, without static stability.
    guard resolver is RefreshLifecycleEligible else { return resolver }

    return CachedAWSCredentialIdentityResolver(source: resolver)
}

/// RefreshLifecycleEligible marks the SDK resolvers that get the refresh lifecycle.
/// `wrapCredentialIdentityResolver(_:)` wraps only these, so customer resolvers are never wrapped.
protocol RefreshLifecycleEligible {}

extension STSAssumeRoleAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension STSWebIdentityAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension SSOAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension LoginAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension ECSAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension IMDSAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
extension CognitoAWSCredentialIdentityResolver: RefreshLifecycleEligible {}
