//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

public struct AWSCredentials {
    let accessKey: String?
    let secret: String?
    let sessionToken: String?
    let expirationTimeout: UInt64
}

extension AWSCredentials {
    func toCRTType() -> CRTCredentials? {
        guard let accessKey = accessKey,
              let secret = secret else {
            return nil
        }
        return CRTCredentials(accessKey: accessKey,
                              secret: secret,
                              sessionToken: sessionToken,
                              expirationTimeout: expirationTimeout)
    }
}
