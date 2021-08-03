/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import AwsCommonRuntimeKit

public protocol AWSRuntimeConfiguration {
    var credentialsProvider: AWSCredentialsProvider { get set }
    var region: String { get set }
    var signingRegion: String {get set}
    var endpointResolver: EndpointResolver {get set}
}

public extension AWSRuntimeConfiguration {
    func initialize() {
        AwsCommonRuntimeKit.initialize()
    }
}

public typealias AWSClientConfiguration = SDKRuntimeConfiguration & AWSRuntimeConfiguration
