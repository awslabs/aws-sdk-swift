//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import enum AWSSDKChecksums.AWSChecksumCalculationMode
import ClientRuntime
import class Smithy.Context
import struct SmithyHTTPAPI.Headers

public struct AWSUserAgentMetadata {
    let sdkMetadata: SDKMetadata
    let internalMetadata: InternalMetadata?
    let userAgentMetadata = UserAgentMetadata()
    let apiMetadata: APIMetadata
    let osMetadata: OSMetadata
    let languageMetadata: LanguageMetadata
    let executionEnvMetadata: ExecutionEnvMetadata?
    let businessMetrics: BusinessMetrics?
    let appIDMetadata: AppIDMetadata?
    let frameworkMetadata: [FrameworkMetadata]

    ///  ABNF for the user agent:
    ///  ua-string =                             sdk-metadata RWS
    ///                       [internal-metadata RWS]
    ///                       ua-metadata
    ///                       [api-metadata RWS]
    ///                       os-metadata RWS
    ///                       language-metadata RWS
    ///                       [env-metadata RWS]
    ///                              ; ordering is not strictly required in the following section
    ///                       [business-metrics]
    ///                       [appId]
    ///                       *(framework-metadata RWS)
    var userAgent: String {
        return [
            [sdkMetadata.description],
            [internalMetadata?.description],
            [userAgentMetadata.description],
            [apiMetadata.description],
            [osMetadata.description],
            [languageMetadata.description],
            [executionEnvMetadata?.description],
            [businessMetrics?.description],
            [appIDMetadata?.description],
            frameworkMetadata.map(\.description) as [String?]
        ].flatMap { $0 }.compactMap { $0 }.joined(separator: " ")
    }

    init(
        sdkMetadata: SDKMetadata,
        internalMetadata: InternalMetadata? = nil,
        apiMetadata: APIMetadata,
        osMetadata: OSMetadata,
        languageMetadata: LanguageMetadata,
        executionEnvMetadata: ExecutionEnvMetadata? = nil,
        businessMetrics: BusinessMetrics? = nil,
        appIDMetadata: AppIDMetadata? = nil,
        frameworkMetadata: [FrameworkMetadata] = []
    ) {
        self.sdkMetadata = sdkMetadata
        self.internalMetadata = internalMetadata
        self.apiMetadata = apiMetadata
        self.osMetadata = osMetadata
        self.languageMetadata = languageMetadata
        self.executionEnvMetadata = executionEnvMetadata
        self.businessMetrics = businessMetrics
        self.appIDMetadata = appIDMetadata
        self.frameworkMetadata = frameworkMetadata
    }

    public static func fromConfigAndContext(
        serviceID: String,
        version: String,
        config: UserAgentValuesFromConfig,
        context: Context,
        headers: Headers
    ) -> AWSUserAgentMetadata {
        let apiMetadata = APIMetadata(serviceID: serviceID, version: version)
        let sdkMetadata = SDKMetadata(version: apiMetadata.version)
        // `InternalMetadata` will need to be supplied once the SDK is distributed internally
        let internalMetadata: InternalMetadata? = nil
        let osVersion = PlatformOperationSystemVersion.operatingSystemVersion()
        let osMetadata = OSMetadata(family: currentOS, version: osVersion)
        let languageMetadata = LanguageMetadata(version: swiftVersion)
        let businessMetrics = BusinessMetrics(config: config, context: context, headers: headers)
        let appIDMetadata = AppIDMetadata(name: config.appID)
        let frameworkMetadata = [FrameworkMetadata]()
        return AWSUserAgentMetadata(
            sdkMetadata: sdkMetadata,
            internalMetadata: internalMetadata,
            apiMetadata: apiMetadata,
            osMetadata: osMetadata,
            languageMetadata: languageMetadata,
            executionEnvMetadata: ExecutionEnvMetadata.detectExecEnv(),
            businessMetrics: businessMetrics,
            appIDMetadata: appIDMetadata,
            frameworkMetadata: frameworkMetadata
        )
    }
}

public class UserAgentValuesFromConfig {
    var appID: String?
    var endpoint: String?
    var awsRetryMode: AWSRetryMode
    var requestChecksumCalculation: AWSChecksumCalculationMode
    var responseChecksumValidation: AWSChecksumCalculationMode

    public init(
        appID: String?,
        endpoint: String?,
        awsRetryMode: AWSRetryMode,
        requestChecksumCalculation: AWSChecksumCalculationMode,
        responseChecksumValidation: AWSChecksumCalculationMode
    ) {
        self.endpoint = endpoint
        self.awsRetryMode = awsRetryMode
        self.appID = appID
        self.requestChecksumCalculation = requestChecksumCalculation
        self.responseChecksumValidation = responseChecksumValidation
    }

    public init(config: DefaultClientConfiguration & AWSDefaultClientConfiguration) {
        self.appID = config.appID
        self.endpoint = config.endpoint
        self.awsRetryMode = config.awsRetryMode
        self.requestChecksumCalculation = config.requestChecksumCalculation
        self.responseChecksumValidation = config.responseChecksumValidation
    }
}
