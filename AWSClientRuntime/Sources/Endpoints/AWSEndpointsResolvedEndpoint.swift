//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0.

import AwsCommonRuntimeKit

/// Wrapper for CRTAWSEndpointResolvedEndpoint
public class AWSEndpointsResolvedEndpoint {
    
    let crtResolvedEndpoint: CRTAWSEndpointResolvedEndpoint
    
    init(crtResolvedEndpoint: CRTAWSEndpointResolvedEndpoint) {
        self.crtResolvedEndpoint = crtResolvedEndpoint
    }
    
    public func getType() -> AWSEndpointsResolvedEndpointType {
        AWSEndpointsResolvedEndpointType(crtType: crtResolvedEndpoint.getType())
    }
    
    public func getError() throws -> String? {
        try crtResolvedEndpoint.getError()
    }
    
    public func getURL() throws -> String? {
        try crtResolvedEndpoint.getURL()
    }
    
    public func getProperties() throws -> [String: AnyHashable]? {
        try crtResolvedEndpoint.getProperties()
    }
    
    public func getHeaders() throws -> [String: [String]]? {
        try crtResolvedEndpoint.getHeaders()
    }
}
