//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct DefaultRegionResolver {
    public static func resolveDefaultRegion() -> String? {
        //TODO: add more region resolvers i.e. Profile, etc
        let resolvers = [EnvironmentRegionResolver()]
        for resolver in resolvers {
            guard let region = resolver.resolveRegion() else {
                return nil
            }
            
            return region
        }
        
        return nil
    }
}
