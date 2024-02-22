//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public protocol AWSDefaultClientConfiguration {
    /// The credentials provider to be used for AWS credentials.
    ///
    /// If no credentials provider is supplied, the SDK will look for credentials in the environment, then in the `~/.aws/credentials` file.
    var credentialsProvider: CredentialsProviding { get set }

    /// Specifies whether FIPS endpoints should be used.
    var useFIPS: Bool? { get set }

    /// Specifies whether dual-stack endpoints should be used.
    var useDualStack: Bool? { get set }

    /// An identifying string for the application being used with this SDK.
    ///
    /// This value is set after resolving app ID from the standard progression of potential sources.
    ///
    /// The application ID is submitted as part of the `user-agent` and allows for better tracking and troubleshooting.
    /// The application ID may also be retrieved from the environment variable `AWS_SDK_UA_APP_ID` or from the
    /// configuration file field `sdk_ua_app_id` if it is not set here.
    var appID: String? { get set }

    /// The AWS retry mode to be used.
    ///
    /// This value is set after resolving retry mode from the standard progression of potential sources.
    ///
    /// May be one of `legacy`, `standard`, or `adaptive`.  `standard` and `adaptive` retry strategies are as defined in
    /// Smithy Reference Architecture.  For the Swift SDK, `legacy` is the same behavior as `standard`.
    var awsRetryMode: AWSRetryMode { get set }
}
