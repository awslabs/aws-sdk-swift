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

    public init(providers: [RegionProvider]? = nil) throws {
        #if os(iOS) || os(watchOS) || os(tvOS)
        self.providers = providers ?? [BundleRegionProvider(), EnvironmentRegionProvider()]
        #else
        self.providers = try providers ?? [
            BundleRegionProvider(),
            EnvironmentRegionProvider(),
            ProfileRegionProvider(),
            IMDSRegionProvider()
        ]
        #endif
        self.logger = SwiftLogger(label: "DefaultRegionProvider")
    }
    
    public func resolveRegion() async -> String? {
        for provider in providers {
            logger.debug("Attempting to resolve region with: \(String(describing: type(of: provider)))")
            do {
                if let region = try await provider.resolveRegion() {
                    logger.debug("Resolved region with: \(String(describing: type(of: provider)))")
                    return region
                }
            } catch {
                let logMessage = [
                    "Failed to resolve region with: \(String(describing: type(of: provider)))",
                    "Error: \(error.localizedDescription)"
                ].joined(separator: "\n")
                logger.debug(logMessage)
            }
        }
        logger.debug("Unable to resolve region")
        return nil
    }
}
