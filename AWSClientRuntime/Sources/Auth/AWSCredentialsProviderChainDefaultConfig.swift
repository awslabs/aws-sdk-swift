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
    private let sharedDefaultIO: SDKDefaultIO = SDKDefaultIO.shared
    
    public init(shutDownCallback: ShutDownCallback? = nil) {
        self.shutDownCallback = shutDownCallback
    }
}

extension AWSCredentialsProviderChainDefaultConfig {
    func toCRTType() -> CRTCredentialsProviderChainDefaultConfig {
        return CredentialsProviderChainDefaultConfig(bootstrap: SDKDefaultIO.shared.clientBootstrap, shutDownOptions: shutDownCallback)
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
