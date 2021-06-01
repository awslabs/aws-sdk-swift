//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import ClientRuntime

public struct AWSCredentialsProviderChainDefaultConfig {
    let shutDownCallback: ShutDownCallback?
    let client: CRTClientEngine
}

extension AWSCredentialsProviderChainDefaultConfig {
    func toCRTType() -> CRTCredentialsProviderChainDefaultConfig {
        return CredentialsProviderChainDefaultConfig(bootstrap: client.bootstrap, shutDownOptions: shutDownCallback)
    }
}

struct CredentialsProviderChainDefaultConfig: CRTCredentialsProviderChainDefaultConfig {
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    var bootstrap: ClientBootstrap
    
    init(bootstrap: ClientBootstrap, shutDownOptions: ShutDownCallback? = nil) {
        self.bootstrap = bootstrap
        if let shutDownOptions = shutDownOptions {
            self.shutDownOptions = CRTCredentialsProviderShutdownOptions(shutDownCallback: shutDownOptions)
        }
    }
}
