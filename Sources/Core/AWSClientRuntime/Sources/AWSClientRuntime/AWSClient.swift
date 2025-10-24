//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.Client
import let AWSSDKDynamic.packageVersion

public protocol AWSClient: ClientRuntime.Client {}

public extension AWSClient {

    static var version: String {
        AWSSDKDynamic.packageVersion
    }
}
