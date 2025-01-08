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
    /// If no resolver is supplied, `AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain` gets used by default.
    var awsCredentialIdentityResolver: any AWSCredentialIdentityResolver { get set }

    /// Specifies whether FIPS endpoints should be used.
    var useFIPS: Bool? { get set }

    /// Specifies whether dual-stack endpoints should be used.
    var useDualStack: Bool? { get set }

    /// An identifying string for the application using the SDK.
    ///
    /// The application ID is submitted as part of the `user-agent` request header that allows analyzing SDK usage and troubleshooting.
    ///
    /// The application ID may be retrieved from the environment variable `AWS_SDK_UA_APP_ID` or from the
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

    /// Specifies whether the endpoint configured via environment variables or shared config file should be used by the service client.
    ///
    /// If `false`, the endpoint for the service client is resolved in the following order:
    ///     1. The `endpoint` value provided at service client initialization via the config.
    ///     2. The value of `AWS_ENDPOINT_URL_<SERVICE>` environment variable. `<SERVICE>` is the transformed value of the given service client's `serviceName` property, where spaces are replaced with underscores and letters are uppercased. E.g., `"API Gateway"` => `"API_GATEWAY"`.
    ///     3. The value of `AWS_ENDPOINT_URL` environment variable; this is used to configure the endpoint for all services.
    ///     4. In the shared config file, the `endpoint_url` property under selected profile's `services` section's `<SERVICE> =` subsection. `<SERVICE>` is the transformed value of the given service client's `serviceName` property, where spaces are replaced with underscores and letters are lowercased. E.g., `"API Gateway` => `"api_gateway`.
    ///     5. In the shared config file, the `endpoint_url` property under the selected profile; this is used to configure the endpoint for all services.
    ///     6. If the endpoint wasn't configured anywhere, then AWS Swift SDK determines the endpoint to use for each operation call by using the built-in endpoint resolver for the service.
    /// Note: For the profile name used in resolution steps 4 & 5, the value of `AWS_PROFILE` environment variable is used if set. Otherwise, `default` is used.
    ///
    /// If `true`, the endpoint for the service client is resolved in the following order:
    ///     1. The `endpoint` value provided at service client initialization via the config.
    ///     2. If `endpoint` wasn't configured by the user via service client config, AWS Swift SDK determines the endpoint to use for each operation call by using the built-in endpoint resolver for the service.
    ///
    /// If this flag isn't set, AWS Swift SDK looks at the relevant environment variable and shared config file property when `endpoint` service client config is resolved. The flag value gets dermined by looking at the possible sources in the following order:
    ///     1. The value of `ignoreConfiguredEndpointURLs` in the client config.
    ///     2. The value of `AWS_IGNORE_CONFIGURED_ENDPOINT_URLS` environment variable.
    ///     3. In the shared config file, the value of `ignore_configured_endpoint_urls` property under the selected profile.
    ///     4. If this flag was not set anywhere, the AWS Swift SDK defaults to the `false` case.
    /// Note: For the profile name used in resolution step 3, the value of`AWS_PROFILE` environment variable is used if set. Otherwise, `default` is used.
    ///
    /// For more information on endpoint configuration via environment varirables and the shared config file, see the [official AWS documentation](https://docs.aws.amazon.com/sdkref/latest/guide/feature-ss-endpoints.html).
    ///
    /// For the list of valid `<SERVICE>` values for the services, refer to [the official list](https://docs.aws.amazon.com/sdkref/latest/guide/ss-endpoints-table.html).
    var ignoreConfiguredEndpointURLs: Bool? { get set }
}
