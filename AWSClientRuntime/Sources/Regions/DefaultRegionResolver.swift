//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit

public struct DefaultRegionResolver: RegionResolver {
    public let providers: [RegionProvider]
    
    public init(providers: [RegionProvider] = [EnvironmentRegionProvider(), ProfileRegionProvider(), IMDSRegionProvider()]) {
        // TODO: add more region resolvers i.e. System Properties, etc
        self.providers = providers
    }
    
    public func resolveRegion() -> String? {
        for provider in providers {
            do {
                if let region = try provider.resolveRegion().get() {
                    return region
                }
            } catch {
                return nil
            }
        }
        return nil
    }
}
