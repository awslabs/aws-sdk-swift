//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime
        
public struct AWSUserAgentMetadata {
    let sdkMetadata: SDKMetadata
    let apiMetadata: APIMetadata
    let osMetadata: OSMetadata
    let languageMetadata: LanguageMetadata
    let executionEnvMetadata: ExecutionEnvMetadata?
    let frameworkMetadata: FrameworkMetadata?
    
    ///  ABNF for the user agent:
    ///  ua-string =
    ///     sdk-metadata RWS
    ///     [api-metadata RWS]
    ///     os-metadata RWS
    ///     language-metadata RWS
    ///     [env-metadata RWS]
    ///     (feat-metadata RWS)
    ///     (config-metadata RWS)
    ///     (framework-metadata RWS)
    ///     [appId]
    var xAmzUserAgent: String {
        // TODO: add feat-metadata, config-metadata, and appId
        var components = [sdkMetadata.description,
                          apiMetadata.description,
                          osMetadata.description,
                          languageMetadata.description]
        if let executionEnvMetadata = executionEnvMetadata {
            components.append(executionEnvMetadata.description)
        }
        if let frameworkMetadata = frameworkMetadata {
            components.append(frameworkMetadata.description)
        }
        return components.joined(separator: " ")
    }
    
    /// Legacy user agent header value for `UserAgent`
    var userAgent: String {
        return "\(sdkMetadata)"
    }
    
    public init(sdkMetadata: SDKMetadata,
                apiMetadata: APIMetadata,
                osMetadata: OSMetadata,
                languageMetadata: LanguageMetadata,
                executionEnvMetadata: ExecutionEnvMetadata? = nil,
                frameworkMetadata: FrameworkMetadata? = nil) {
        self.sdkMetadata = sdkMetadata
        self.apiMetadata = apiMetadata
        self.osMetadata = osMetadata
        self.languageMetadata = languageMetadata
        self.executionEnvMetadata = executionEnvMetadata
        self.frameworkMetadata = frameworkMetadata
    }
    
    public static func fromEnv(apiMetadata: APIMetadata, frameworkMetadata: FrameworkMetadata? = nil) -> AWSUserAgentMetadata {
        let sdkMetadata = SDKMetadata(name: "swift", version: apiMetadata.version)
        let osVersion = PlatformOperationSystemVersion.operatingSystemVersion()
        let osMetadata = OSMetadata(family: currentOS, version: osVersion)
        let langMetadata = LanguageMetadata(version: swiftVersion)
        return AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                    apiMetadata: apiMetadata,
                                    osMetadata: osMetadata,
                                    languageMetadata: langMetadata,
                                    executionEnvMetadata: ExecutionEnvMetadata.detectExecEnv(),
                                    frameworkMetadata: frameworkMetadata)
    }
}
