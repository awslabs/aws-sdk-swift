//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

public struct AWSCredentialsProviderStaticConfig {
    public let shutDownCallback: ShutDownCallback?

    public let accessKey: String

    public let secret: String

    public let sessionToken: String?

    public init(
        accessKey: String,
        secret: String,
        sessionToken: String? = nil,
        shutDownCallback: ShutDownCallback? = nil
    ) {
        self.accessKey = accessKey
        self.secret = secret
        self.sessionToken = sessionToken
        self.shutDownCallback = shutDownCallback
    }
}
