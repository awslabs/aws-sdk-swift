//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public struct Profile {
    public let name: String?
    public let propertyCount: Int
    let crtProfile: CRTAWSProfile?
    let properties: [String: String]?
    
    init(crtProfile: CRTAWSProfile) {
        self.name = crtProfile.name
        self.propertyCount = crtProfile.propertyCount
        self.crtProfile = crtProfile
        self.properties = nil
    }
    
    public init(name: String, properties: [String: String]) {
        self.name = name
        self.properties = properties
        self.crtProfile = nil
        self.propertyCount = properties.count
    }
    
    func getProperty(name: String) -> String? {
        if let crtProfile = crtProfile {
            let crtProperty = crtProfile.getProperty(name: name)
            return crtProperty?.value
        }
        return properties?[name]
    }
}
