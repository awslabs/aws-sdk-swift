//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public protocol IdentityClientProviding: Sendable {
    var ssoClient: any IdentityProvidingSSOClient { get }
    var ssoOIDCClient: any IdentityProvidingSSOOIDCClient { get }
    var stsClient: any IdentityProvidingSTSClient { get }
}
