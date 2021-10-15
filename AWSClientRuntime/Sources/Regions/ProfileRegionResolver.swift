//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public struct ProfileRegionProvider: RegionProvider {
    let profileCollection: CRTAWSProfileCollection
    let profileName: String
    
    //TODO: expose these config fields up to the sdk so customer can override path and profile name
    public init(profile: Profile = DefaultProfile()) {
        self.profileCollection = CRTAWSProfileCollection(fromFile: profile.path, source: .config)
        self.profileName = profile.profileName
    }
    
    public func resolveRegion() -> String? {
        guard let profile = profileCollection.getProfile(name: profileName) else {
            return nil
        }
        return profile.getProperty(name: "region")?.value
    }
}

public struct DefaultProfile: Profile {
    public var path: String = "~/.aws/config"
    
    public var profileName: String = "default"
    
    public init() {}
}
