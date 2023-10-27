//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0.

import AwsCommonRuntimeKit

/// Wrapper for CRTAWSEndpointsRequestContext
public class AWSEndpointsRequestContext {

    let crtContext: AwsCommonRuntimeKit.EndpointsRequestContext

    public init() throws {
        self.crtContext = try AwsCommonRuntimeKit.EndpointsRequestContext()
    }

    public func add(name: String, value: String?) throws {
        try crtContext.add(name: name, value: value)
    }

    public func add(name: String, value: Bool?) throws {
        try crtContext.add(name: name, value: value)
    }

    public func toCRT() -> AwsCommonRuntimeKit.EndpointsRequestContext {
        crtContext
    }
}
