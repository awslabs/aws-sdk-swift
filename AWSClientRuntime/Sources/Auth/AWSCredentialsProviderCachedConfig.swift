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
        return CredentialsProviderCachedConfig(source: source, refreshTime: Int64(refreshTime), shutDownOptions: shutDownCallback)
    }
}

struct CredentialsProviderCachedConfig: CRTCredentialsProviderCachedConfig {
    var shutDownOptions: CRTCredentialsProviderShutdownOptions?
    
    var source: CRTAWSCredentialsProvider
    
    var refreshTime: Int64
    
    init(source: AWSCredentialsProvider,
         refreshTime: Int64,
         shutDownOptions: ShutDownCallback? = nil) {
        self.source = source.crtCredentialsProvider
        self.refreshTime = refreshTime
    }
}
