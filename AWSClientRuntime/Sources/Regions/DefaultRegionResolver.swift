//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct DefaultRegionResolver: RegionResolver {
    public let providers: [RegionProvider]
    
    public init(providers: [RegionProvider] = [EnvironmentRegionProvider()]) {
        //TODO: add more region resolvers i.e. Profile, etc
        self.providers = providers
    }
    
    public func resolveRegion() -> String? {
        for provider in providers {
            if let region = provider.resolveRegion() {
                return region
            }
        }
        return nil
    }
}
