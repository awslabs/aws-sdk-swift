//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Protocol for AWS region client configuration.
///
/// Note: This protocol will inherit `Sendable` after the deprecation period of class-based configurations.
/// The struct-based configuration already conforms to `Sendable` via `@unchecked Sendable`.
public protocol AWSRegionClientConfiguration {

    /// The AWS region to use, i.e. `us-east-1` or `us-west-2`, etc.
    ///
    /// If no region is specified here, one must be specified in the `~/.aws/configuration` file.
    var region: String? { get set }

    /// The signing region to be used for signing AWS requests.
    ///
    /// If none is specified, it is supplied by the SDK.
    var signingRegion: String? { get set }
}
