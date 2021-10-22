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
    
    init(crtProfile: CRTAWSProfile) {
        self.name = crtProfile.name
        self.propertyCount = crtProfile.propertyCount
        self.crtProfile = crtProfile
    }
    
    func getProperty(name: String) -> String? {
        guard let crtProfile = crtProfile else {
            return nil
        }
        let crtProperty = crtProfile.getProperty(name: name)
        return crtProperty?.value
    }
}
