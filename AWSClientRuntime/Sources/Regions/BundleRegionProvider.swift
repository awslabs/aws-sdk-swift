//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import ClientRuntime

public struct BundleRegionProvider: RegionProvider {
    private let logger: SwiftLogger
    private let bundle: Bundle
    private let regionKey: String
    private let maxSizeRegion = 38

    public init(bundle: Bundle = Bundle.main, regionKey: String = "AWS_REGION") {
        self.logger = SwiftLogger(label: "BundleRegionProvider")
        self.bundle = bundle
        self.regionKey = regionKey
    }
    
    public func resolveRegion() -> Future<String?> {
        let future = Future<String?>()

        #if os(iOS) || os(watchOS) || os(tvOS)
        guard let region = region() else {
            future.fulfill(nil)
            return future
        }

        if region.count > maxSizeRegion {
            future.fulfill(String(region.prefix(maxSizeRegion)))
        } else {
            future.fulfill(region)
        }
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
