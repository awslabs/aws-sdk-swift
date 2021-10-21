//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public struct IMDSRegionProvider: RegionProvider {
    private let REGION_PATH = "/latest/meta-data/placement/region"
    let imdsClient: IMDSClient
    
    public init() {
        self.imdsClient = IMDSClient()
    }
    
    public func resolveRegion() -> Future<String?> {
        let future = Future<String?>()
        
        imdsClient.get(path: REGION_PATH, completion: { result in
            switch result {
            case .success(let region):
                future.fulfill(region)
            case .failure:
                future.fulfill(nil)
            }
        })
        return future
    }
}
