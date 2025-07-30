//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct IdentityClientProvider: Sendable {

    public init() {}

    var ssoClient: IdentityProvidingSSOClient {
        IdentityProvidingSSOClient()
    }

    var ssoOIDCClient: IdentityProvidingSSOOIDCClient {
        IdentityProvidingSSOOIDCClient()
    }

    var stsClient: IdentityProvidingSTSClient {
        IdentityProvidingSTSClient()
    }
}
