//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import let AWSSDKDynamic.packageVersion
import protocol ClientRuntime.Client

public protocol AWSServiceClient: ClientRuntime.Client {}

public extension AWSServiceClient {

    /// The version identifier (i.e. `1.2.3`) for this AWS service client.
    static var version: String {
        AWSSDKDynamic.packageVersion
    }
}
