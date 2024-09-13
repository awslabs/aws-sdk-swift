//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyIdentity
import SmithyIdentityAPI

public protocol AWSDefaultClientConfiguration {
    /// The AWS credential identity resolver to be used for AWS credentials.
    ///
    /// If no resolver is supplied, the SDK will look for credentials in the environment, then in the `~/.aws/credentials` file.
    var awsCredentialIdentityResolver: any AWSCredentialIdentityResolver { get set }

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
    /// May be one of `legacy`, `standard`, or `adaptive`.
    /// For the Swift SDK, `legacy` is the same behavior as `standard`.
    /// `standard` and `adaptive` retry strategies are as documented in `AWSClientRuntime.AWSRetryMode`.
    ///
    /// This value is set after resolving retry mode from the standard progression of potential sources.
    /// Default mode is `legacy`.
    var awsRetryMode: AWSRetryMode { get set }

    /// The max number of times to attempt the request until success.
    ///
    /// This number includes the initial request, and the number of subsequent retries.
    /// For example, value of 3 for this config variable would mean maximum of 2 retries.
    ///
    /// If set, this value gets used when resolving max attempts value from the standard progression of potential sources. If no value could be resolved, the SDK uses max attempts value of 3 by default.
    var maxAttempts: Int? { get set }
}
