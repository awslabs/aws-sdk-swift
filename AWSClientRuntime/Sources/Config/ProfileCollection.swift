//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
        
public protocol ProfileCollection {
    func profile(for name: String) -> Profile?
}

extension CRTAWSProfileCollection: ProfileCollection {
    public func profile(for name: String) -> Profile? {
        guard let crtProfile = getProfile(name: name) else {
            return nil
        }
        return Profile(crtProfile: crtProfile)
    }
}
