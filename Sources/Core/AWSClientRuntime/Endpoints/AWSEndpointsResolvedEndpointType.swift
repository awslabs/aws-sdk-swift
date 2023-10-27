//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.

import AwsCommonRuntimeKit

/// Wrapper for CRTAWSEndpointsResolvedEndpointType
public enum AWSEndpointsResolvedEndpointType {
    case error
    case endpoint

    init(crtType: AwsCommonRuntimeKit.ResolvedEndpoint) {
        switch crtType {
        case .error:
            self = .error
        case .endpoint:
            self = .endpoint
        }
    }
}
