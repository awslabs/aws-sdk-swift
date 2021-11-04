//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import ClientRuntime

public struct DefaultRegionResolver: RegionResolver {
    public let providers: [RegionProvider]
    let logger: SwiftLogger

    public init(providers: [RegionProvider] = [BundleRegionProvider(), EnvironmentRegionProvider(), ProfileRegionProvider(), IMDSRegionProvider()]) {
        self.providers = providers
        self.logger = SwiftLogger(label: "DefaultRegionProvider")
    }
    
    public func resolveRegion() -> String? {
        for provider in providers {
            do {
                // TODO: Verify that this does not block calling thread. If it does, we need to solve this similar to the way we solve this for the credentials provider
                logger.debug("Attempting to resolve region with: \(String(describing: type(of: provider)))")
                if let region = try provider.resolveRegion().get() {
                    logger.debug("Resolved region with: \(String(describing: type(of: provider)))")
                    return region
                }
            } catch {
                return nil
            }
        }
        logger.debug("Unable to resolve region")
        return nil
    }
}
