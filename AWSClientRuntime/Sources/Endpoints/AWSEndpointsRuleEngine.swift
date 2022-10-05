//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0.

import AwsCommonRuntimeKit

/// Wrapper for CRTAWSEndpointsRuleEngine
public class AWSEndpointsRuleEngine {

    let crtEngine: CRTAWSEndpointsRuleEngine
    
    public init(ruleSetString: String) throws {
        crtEngine = try CRTAWSEndpointsRuleEngine(ruleSetString: ruleSetString)
    }
    
    public func resolve(context: AWSEndpointsRequestContext) throws -> AWSEndpointsResolvedEndpoint? {
        guard let crtResolvedEndpoint = try crtEngine.resolve(context: context.toCRT()) else {
            return nil
        }
        
        return AWSEndpointsResolvedEndpoint(crtResolvedEndpoint: crtResolvedEndpoint)
    }
}
