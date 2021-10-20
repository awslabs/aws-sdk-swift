//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
        
public struct IMDSRegionProvider: RegionProvider {
    private let REGION_PATH = "/latest/meta-data/placement/region"
    let imdsClient: IMDSClient?
    
    public init() {
        do {
            self.imdsClient = try IMDSClient()
        } catch {
            self.imdsClient = nil
        }
    }
    
    public func resolveRegion() -> Future<String?> {
        let future = Future<String?>()
        guard let imdsClient = imdsClient else {
            future.fulfill(nil)
            return future
        }

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
