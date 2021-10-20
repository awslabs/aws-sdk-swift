//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public struct ProfileRegionProvider: RegionProvider {
    let profileCollection: ProfileCollection
    let profileName: String
    
    init(profileCollection: ProfileCollection, profileName: String) {
        self.profileCollection = profileCollection
        self.profileName = profileName
    }
    
    //TODO: expose these config fields up to the sdk so customer can override path and profile name
    public init(path: String = "~/.aws/config", profileName: String = "default") {
        let profileCollection = CRTAWSProfileCollection(fromFile: path, source: .config)
        
        self.init(profileCollection: profileCollection, profileName: profileName)
    }
    
    public func resolveRegion() -> Future<String?> {
        let future = Future<String?>()
        guard let profile = profileCollection.profile(for: profileName) else {
            future.fulfill(nil)
            return future
        }
        future.fulfill(profile.getProperty(name: "region"))
        return future
    }
}
