//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

public struct AWSCredentialsProviderWebIdentityConfig {
    public let shutDownCallback: ShutDownCallback?

    public init(shutDownCallback: ShutDownCallback? = nil) throws {
        self.shutDownCallback = shutDownCallback
    }
}
