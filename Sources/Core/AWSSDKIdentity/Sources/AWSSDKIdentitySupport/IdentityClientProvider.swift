//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol AWSSDKIdentity.IdentityClientProviding
import protocol AWSSDKIdentity.IdentityProvidingSSOClient
import protocol AWSSDKIdentity.IdentityProvidingSSOOIDCClient
import protocol AWSSDKIdentity.IdentityProvidingSTSClient
import struct InternalAWSSSO.IdentityProvidingSSOClient
import struct InternalAWSSSOOIDC.IdentityProvidingSSOOIDCClient
import struct InternalAWSSTS.IdentityProvidingSTSClient

public struct IdentityClientProvider: IdentityClientProviding {

    public init() {}

    public var ssoClient: any AWSSDKIdentity.IdentityProvidingSSOClient {
        InternalAWSSSO.IdentityProvidingSSOClient()
    }

    public var ssoOIDCClient: any AWSSDKIdentity.IdentityProvidingSSOOIDCClient {
        InternalAWSSSOOIDC.IdentityProvidingSSOOIDCClient()
    }

    public var stsClient: any AWSSDKIdentity.IdentityProvidingSTSClient {
        InternalAWSSTS.IdentityProvidingSTSClient()
    }
}
