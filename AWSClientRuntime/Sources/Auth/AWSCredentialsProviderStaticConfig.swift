//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import AwsCommonRuntimeKit

public struct AWSCredentialsProviderStaticConfig {
    public let shutDownCallback: ShutDownCallback?
    
    public let accessKey: String
    
    public let secret: String
    
    public let sessionToken: String?
    
    public init(accessKey: String,
                secret: String,
                sessionToken: String? = nil,
                shutDownCallback: ShutDownCallback? = nil) {
        self.accessKey = accessKey
        self.secret = secret
        self.sessionToken = sessionToken
        self.shutDownCallback = shutDownCallback
    }
}

extension AWSCredentialsProviderStaticConfig {
    func toCRTType() -> CredentialsProviderStaticConfig {
        return CredentialsProviderStaticConfig(accessKey: accessKey,
                                               secret: secret,
                                               sessionToken: sessionToken,
                                               shutDownOptions: shutDownCallback)
    }
}

struct CredentialsProviderStaticConfig: CRTCredentialsProviderStaticConfigOptions {
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    var accessKey: String
    
    var secret: String
    
    var sessionToken: String?
    
    init(accessKey: String,
         secret: String,
         sessionToken: String? = nil,
         shutDownOptions: ShutDownCallback? = nil) {
        self.accessKey = accessKey
        self.secret = secret
        self.sessionToken = sessionToken
        if let shutDownOptions = shutDownOptions {
            self.shutDownOptions = CRTCredentialsProviderShutdownOptions(shutDownCallback: shutDownOptions)
        }
    }
}
