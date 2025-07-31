//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol AWSSDKIdentityAPI.S3ExpressIdentityResolver

// This type was moved from this module to AWSSDKIdentityAPI in order to separate this
// protocol from the concrete credential resolver implementations in this module.
//
// This typealias makes the type available in its original location to prevent breaking
// customers who expect it to be here.
public typealias S3ExpressIdentityResolver = AWSSDKIdentityAPI.S3ExpressIdentityResolver
