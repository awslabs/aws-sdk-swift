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
    
    public init(shutDownCallback: ShutDownCallback? = nil) {
        self.shutDownCallback = shutDownCallback
    }
}

