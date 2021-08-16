/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public protocol AWSRuntimeConfiguration {
    var credentialsProvider: AWSCredentialsProvider { get set }
    var region: String? { get set }
    var signingRegion: String? {get set}
    var endpointResolver: EndpointResolver {get set}
    var regionResolver: RegionResolver {get set}
}

public typealias AWSClientConfiguration = SDKRuntimeConfiguration & AWSRuntimeConfiguration
