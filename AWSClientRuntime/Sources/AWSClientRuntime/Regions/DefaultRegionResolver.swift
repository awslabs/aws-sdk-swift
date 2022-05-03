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

    public init(providers: [RegionProvider]? = nil) {
        #if os(iOS) || os(watchOS) || os(tvOS)
        self.providers = providers ?? [BundleRegionProvider(), EnvironmentRegionProvider()]
        #else
        self.providers = providers ?? [BundleRegionProvider(), EnvironmentRegionProvider(), ProfileRegionProvider(), IMDSRegionProvider()]
        #endif
        self.logger = SwiftLogger(label: "DefaultRegionProvider")
    }
    
    public func resolveRegion() async -> String? {
        for provider in providers {
            do {
                logger.debug("Attempting to resolve region with: \(String(describing: type(of: provider)))")
                if let region = try await provider.resolveRegion() {
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
