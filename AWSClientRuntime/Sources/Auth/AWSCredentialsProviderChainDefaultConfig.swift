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
        return CredentialsProviderChainDefaultConfig(shutDownOptions: shutDownCallback, bootstrap: client.bootstrap)
    }
}

struct CredentialsProviderChainDefaultConfig: CRTCredentialsProviderChainDefaultConfig {
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    var bootstrap: ClientBootstrap
    
    init(shutDownOptions: ShutDownCallback? = nil,
         bootstrap: ClientBootstrap) {
        if let shutDownOptions = shutDownOptions {
            self.shutDownOptions = CRTCredentialsProviderShutdownOptions(shutDownCallback: shutDownOptions)
        }
        self.bootstrap = bootstrap
    }
}
