//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct DefaultRegionResolver: RegionResolver {
    public var providers: [RegionProvider]
    
    public init() {
        //TODO: add more region resolvers i.e. Profile, etc
        self.providers = [EnvironmentRegionProvider()]
    }
    
    public func resolveRegionFromProviders() -> String? {
        for provider in providers {
            guard let region = provider.resolveRegion() else {
                return nil
            }
            
            return region
        }
        
        return nil
    }
}
