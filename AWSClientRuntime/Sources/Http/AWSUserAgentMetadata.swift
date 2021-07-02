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
        //TODO: add feat-metadata, config-metadata, framework-metadata (Amplify?) and appId
        guard let executionEnvMetadata = executionEnvMetadata else {
            return "\(sdkMetadata) \(apiMetadata) \(osMetadata) \(languageMetadata)"
        }
        return "\(sdkMetadata) \(apiMetadata) \(osMetadata) \(languageMetadata) \(String(describing: executionEnvMetadata))"
    }
    
    /// Legacy user agent header value for `UserAgent`
    var userAgent: String {
        return "\(sdkMetadata)"
    }
    
    public init(sdkMetadata: SDKMetadata,
                apiMetadata: APIMetadata,
                osMetadata: OSMetadata,
                languageMetadata: LanguageMetadata,
                executionEnvMetadata: ExecutionEnvMetadata? = nil) {
        self.sdkMetadata = sdkMetadata
        self.apiMetadata = apiMetadata
        self.osMetadata = osMetadata
        self.languageMetadata = languageMetadata
        self.executionEnvMetadata = executionEnvMetadata
    }
    
    public static func fromEnv(apiMetadata: APIMetadata) -> AWSUserAgentMetadata {
        let sdkMetadata = SDKMetadata(name: "swift", version: apiMetadata.version)
        //TODO: figure out a better way to get both current OS and version of that OS
        let osMetadata = OSMetadata(family: currentOS, version: nil)
        let langMetadata = LanguageMetadata(version: swiftVersion)
        return AWSUserAgentMetadata(sdkMetadata: sdkMetadata,
                                    apiMetadata: apiMetadata,
                                    osMetadata: osMetadata,
                                    languageMetadata: langMetadata,
                                    executionEnvMetadata: ExecutionEnvMetadata.detectExecEnv())
    }
}
