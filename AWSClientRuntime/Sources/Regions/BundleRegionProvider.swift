//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import ClientRuntime
import Foundation.NSBundle

public struct BundleRegionProvider: RegionProvider {
    private let logger: SwiftLogger
    private let bundle: Foundation.Bundle
    private let regionKey: String
    private let maxSizeRegion = 20

    public init(bundle: Foundation.Bundle = Bundle.main, regionKey: String = "AWS_REGION") {
        self.logger = SwiftLogger(label: "BundleRegionProvider")
        self.bundle = bundle
        self.regionKey = regionKey
    }
    
    public func resolveRegion() -> Future<String?> {
        let future = Future<String?>()
        #if os(iOS) || os(watchOS) || os(tvOS)
        guard let region = region() else {
            future.fulfill(nil)
        }
        return region.count > maxSizeRegion
            ? future.fulfill(region.prefix(maxSizeRegion))
            : future.fulfill(region)
        #else
        future.fulfill(nil)
        #endif
        return future
    }

    func region() -> String? {
        do {
            return try BundleConfiguration.value(bundle: self.bundle, for: regionKey)
        } catch {
            logger.debug("\(error)")
        }
        return nil
    }
}
