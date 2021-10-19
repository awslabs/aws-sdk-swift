//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

public struct AWSCredentialsProviderContainerConfig {
    public let shutDownCallback: ShutDownCallback?
    public let authToken: String?
    public let host: String?
    public let pathAndQuery: String?
    
    init(authToken: String? = nil,
         host: String? = nil,
         pathAndQuery: String? = nil,
         shutDownCallback: ShutDownCallback? = nil) {
        self.authToken = authToken
        self.host = host
        self.pathAndQuery = pathAndQuery
        self.shutDownCallback = shutDownCallback
    }
}


extension AWSCredentialsProviderContainerConfig {
    func toCRTType() -> CredentialsProviderContainerConfig {
        return CredentialsProviderContainerConfig(bootstrap: SDKDefaultIO.shared.clientBootstrap,
                                                  tlsContext: SDKDefaultIO.shared.tlsContext,
                                                  authToken: authToken,
                                                  pathAndQuery: pathAndQuery,
                                                  host: host,
                                                  shutDownOptions: shutDownCallback)
    }
}

struct CredentialsProviderContainerConfig: CRTCredentialsProviderContainerConfig {
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    var bootstrap: ClientBootstrap
    
    var tlsContext: TlsContext
    
    var authToken: String?
    
    var pathAndQuery: String?
    
    var host: String?
    
    init(bootstrap: ClientBootstrap,
         tlsContext: TlsContext,
         authToken: String? = nil,
         pathAndQuery: String? = nil,
         host: String? = nil,
         shutDownOptions: ShutDownCallback? = nil) {
        self.bootstrap = bootstrap
        self.tlsContext = tlsContext
        self.authToken = authToken
        self.pathAndQuery = pathAndQuery
        self.host = host
        if let shutDownOptions = shutDownOptions {
            self.shutDownOptions = CRTCredentialsProviderShutdownOptions(shutDownCallback: shutDownOptions)
        }
    }
}
