//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0.

import AwsCommonRuntimeKit

/// Wrapper for CRTAWSEndpointResolvedEndpoint
public class AWSEndpointsResolvedEndpoint {

    let crtResolvedEndpoint: AwsCommonRuntimeKit.ResolvedEndpoint

    init(crtResolvedEndpoint: AwsCommonRuntimeKit.ResolvedEndpoint) {
        self.crtResolvedEndpoint = crtResolvedEndpoint
    }

    public func getType() -> AWSEndpointsResolvedEndpointType {
        AWSEndpointsResolvedEndpointType(crtType: crtResolvedEndpoint)
    }

    public func getError() -> String? {
        switch crtResolvedEndpoint {
        case .endpoint:
            return nil
        case let .error(message):
            return message
        }
    }

    public func getURL() -> String? {
        switch crtResolvedEndpoint {
        case let .endpoint(url, _, _):
            return url
        case .error:
            return nil
        }
    }

    public func getProperties() -> [String: AnyHashable]? {
        switch crtResolvedEndpoint {
        case let .endpoint(_, _, properties):
            return properties
        case .error:
            return nil
        }
    }

    public func getHeaders() -> [String: [String]]? {
        switch crtResolvedEndpoint {
        case let .endpoint(_, headers, _):
            return headers
        case .error:
            return nil
        }
    }
}
