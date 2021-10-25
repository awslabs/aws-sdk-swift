//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import ClientRuntime

public struct ProfileRegionProvider: RegionProvider {
    let profileCollection: ProfileCollection?
    let profileName: String?
    let logger: SwiftLogger
    
    init(profileCollection: ProfileCollection?, profileName: String?) {
        self.profileCollection = profileCollection
        self.profileName = profileName
        self.logger = SwiftLogger(label: "ProfileRegionResolver")
    }
    
    // TODO: expose these config fields up to the sdk so customer can override path and profile name
    public init(path: String = "~/.aws/config", profileName: String = "default") {
        let profileCollection = CRTAWSProfileCollection(fromFile: path, source: .config)
        
        self.init(profileCollection: profileCollection, profileName: profileName)
    }
    
    public func resolveRegion() -> Future<String?> {
        let future = Future<String?>()
        guard let profileCollection = profileCollection,
              let profileName = profileName else {
            logger.info("No default profile collection was found at the default path of ~/.aws/config")
            future.fulfill(nil)
            return future
        }
        
        guard let profile = profileCollection.profile(for: profileName) else {
            future.fulfill(nil)
            return future
        }
        guard let region = profile.getProperty(name: "region") else {
            logger.info("Attempting to use \(profileName), but no region was found")
            future.fulfill(nil)
            return future
        }
        future.fulfill(region)
        return future
    }
}
