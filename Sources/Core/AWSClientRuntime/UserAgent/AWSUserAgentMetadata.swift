//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct AWSUserAgentMetadata {
    let sdkMetadata: SDKMetadata
    let internalMetadata: InternalMetadata?
    let userAgentMetadata = UserAgentMetadata()
    let apiMetadata: APIMetadata
    let osMetadata: OSMetadata
    let languageMetadata: LanguageMetadata
    let executionEnvMetadata: ExecutionEnvMetadata?
    let configMetadata: [ConfigMetadata]
    let appIDMetadata: AppIDMetadata?
    let featureMetadata: [FeatureMetadata]
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
    ///                       *(config-metadata RWS)
    ///                       [appId]
    ///                       *(feat-metadata RWS)
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
            configMetadata.map(\.description) as [String?],
            [appIDMetadata?.description],
            featureMetadata.map(\.description) as [String?],
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
        configMetadata: [ConfigMetadata] = [],
        appIDMetadata: AppIDMetadata? = nil,
        featureMetadata: [FeatureMetadata] = [],
        frameworkMetadata: [FrameworkMetadata] = []
    ) {
        self.sdkMetadata = sdkMetadata
        self.internalMetadata = internalMetadata
        self.apiMetadata = apiMetadata
        self.osMetadata = osMetadata
        self.languageMetadata = languageMetadata
        self.executionEnvMetadata = executionEnvMetadata
        self.configMetadata = configMetadata
        self.appIDMetadata = appIDMetadata
        self.featureMetadata = featureMetadata
        self.frameworkMetadata = frameworkMetadata
    }

    public static func fromConfig<ServiceSpecificConfiguration>(
        serviceID: String,
        version: String,
        config: AWSClientConfiguration<ServiceSpecificConfiguration>
    ) -> AWSUserAgentMetadata {
        let apiMetadata = APIMetadata(serviceID: serviceID, version: version)
        let sdkMetadata = SDKMetadata(version: apiMetadata.version)
        // `InternalMetadata` will need to be supplied once the SDK is distributed internally
        let internalMetadata: InternalMetadata? = nil
        let osVersion = PlatformOperationSystemVersion.operatingSystemVersion()
        let osMetadata = OSMetadata(family: currentOS, version: osVersion)
        let languageMetadata = LanguageMetadata(version: swiftVersion)
        let configMetadata = [ConfigMetadata(type: .retry(config.awsRetryMode))]
        let appIDMetadata = AppIDMetadata(name: config.appID)
        let frameworkMetadata = [FrameworkMetadata]()
        return AWSUserAgentMetadata(
            sdkMetadata: sdkMetadata,
            internalMetadata: internalMetadata,
            apiMetadata: apiMetadata,
            osMetadata: osMetadata,
            languageMetadata: languageMetadata,
            executionEnvMetadata: ExecutionEnvMetadata.detectExecEnv(),
            configMetadata: configMetadata,
            appIDMetadata: appIDMetadata,
            featureMetadata: [],  // Feature metadata will be supplied when features are implemented
            frameworkMetadata: frameworkMetadata
        )
    }
}
