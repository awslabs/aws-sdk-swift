//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

public struct AWSCredentials {
    let accessKey: String
    let secret: String
    let expirationTimeout: UInt64
    let sessionToken: String?
    
    public init(accessKey: String, secret: String, expirationTimeout: UInt64, sessionToken: String? = nil) {
        self.accessKey = accessKey
        self.secret = secret
        self.expirationTimeout = expirationTimeout
        self.sessionToken = sessionToken
    }
}

extension AWSCredentials {
    func toCRTType() -> CRTCredentials {
        return CRTCredentials(accessKey: accessKey,
                              secret: secret,
                              sessionToken: sessionToken,
                              expirationTimeout: expirationTimeout)
    }
}
