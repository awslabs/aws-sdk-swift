//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public struct AWSCredentialsProviderCachedConfig {
    public let shutDownCallback: ShutDownCallback?
    public let source: AWSCredentialsProvider
    public let refreshTime: Int
}

extension AWSCredentialsProviderCachedConfig {
    func toCRTType() -> CRTCredentialsProviderCachedConfig {
        return CredentialsProviderCachedConfig(shutDownOptions: shutDownCallback, source: source, refreshTime: Int64(refreshTime))
    }
}

struct CredentialsProviderCachedConfig: CRTCredentialsProviderCachedConfig {
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    var source: CRTAWSCredentialsProvider
    
    var refreshTime: Int64
    
    init(shutDownOptions: ShutDownCallback? = nil,
         source: AWSCredentialsProvider,
         refreshTime: Int64) {
        if let shutDownOptions = shutDownOptions {
            self.shutDownOptions = CRTCredentialsProviderShutdownOptions(shutDownCallback: shutDownOptions)
        }
        self.source = source.crtCredentialsProvider
        self.refreshTime = refreshTime
    }
}
