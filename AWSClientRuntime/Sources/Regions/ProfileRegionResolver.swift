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
    let profileName: String
    let path: String
    let logger: SwiftLogger
    
    init(profileCollection: ProfileCollection?, profileName: String, path: String) {
        self.profileCollection = profileCollection
        self.profileName = profileName
        self.logger = SwiftLogger(label: "ProfileRegionResolver")
        self.path = path
    }
    
    // TODO: expose these config fields up to the sdk so customer can override path and profile name
    public init(path: String = "~/.aws/config", profileName: String = "default") {
        self.init(profileCollection: nil, profileName: profileName, path: path)
    }
    
    public func resolveRegion() async throws -> String? {

        let profileCollection = profileCollection ?? CRTAWSProfileCollection(fromFile: path, source: .config)
        guard let profileCollection = profileCollection else {
            logger.debug("No default profile collection was found at the path of \(path)")
            return nil
        }
        
        guard let profile = profileCollection.profile(for: profileName) else {
            logger.debug("Unable to find profile: \(profileName) in \(path)")
            return nil
        }
        guard let region = profile.getProperty(name: "region") else {
            logger.debug("Attempting to use \(profileName), but no region was found")
            return nil
        }
        return region
    }
}
