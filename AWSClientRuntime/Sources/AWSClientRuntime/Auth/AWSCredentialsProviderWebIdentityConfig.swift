//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
        
public struct AWSCredentialsProviderWebIdentityConfig {
    public let shutDownCallback: ShutDownCallback?
    private let sharedDefaultIO: SDKDefaultIO = SDKDefaultIO.shared
    
    public init(shutDownCallback: ShutDownCallback? = nil) {
        self.shutDownCallback = shutDownCallback
    }
}

extension AWSCredentialsProviderWebIdentityConfig {
    func toCRTType() -> CredentialsProviderWebIdentityConfig {
        return CredentialsProviderWebIdentityConfig(bootstrap: SDKDefaultIO.shared.clientBootstrap,
                                                    tlsContext: SDKDefaultIO.shared.tlsContext,
                                                    shutDownOptions: shutDownCallback)
    }
}

struct CredentialsProviderWebIdentityConfig: CRTCredentialsProviderWebIdentityConfig {
    var bootstrap: ClientBootstrap
    
    var tlsContext: TlsContext
    
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    init(bootstrap: ClientBootstrap,
         tlsContext: TlsContext,
         shutDownOptions: ShutDownCallback? = nil) {
        self.bootstrap = bootstrap
        self.tlsContext = tlsContext
        if let shutDownOptions = shutDownOptions {
            self.shutDownOptions = CRTCredentialsProviderShutdownOptions(shutDownCallback: shutDownOptions)
        }
    }
}
