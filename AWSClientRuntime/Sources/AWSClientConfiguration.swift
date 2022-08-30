/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public protocol AWSRuntimeConfiguration {
    var credentialsProvider: CredentialsProvider { get set }
    var region: String? { get set }
    var signingRegion: String? {get set}
    var regionResolver: RegionResolver? {get set}
    var frameworkMetadata: FrameworkMetadata? {get set}
    var useFips: Bool? {get set}
    var useDualStack: Bool? {get set}
}

public typealias AWSClientConfiguration = SDKRuntimeConfiguration & AWSRuntimeConfiguration
