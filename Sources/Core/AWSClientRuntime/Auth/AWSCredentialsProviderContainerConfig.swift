//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

public struct AWSCredentialsProviderContainerConfig {
    public let authToken: String
    public let host: String
    public let pathAndQuery: String
    public let shutDownCallback: ShutDownCallback?
    
    init(
        authToken: String,
        host: String,
        pathAndQuery: String,
        shutDownCallback: ShutDownCallback? = nil
    ) throws {
        self.authToken = authToken
        self.host = host
        self.pathAndQuery = pathAndQuery
        self.shutDownCallback = shutDownCallback
    }
}
