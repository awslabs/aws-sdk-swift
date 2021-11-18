//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public protocol BundleProtocol {
    func object(forInfoDictionaryKey key: String) -> Any?
}

#if os(iOS) || os(watchOS) || os(tvOS)
import Foundation.NSBundle

public typealias Bundle = Foundation.Bundle

extension Bundle: BundleProtocol {
    // No implementation needed
}
#else
public struct Bundle {
    public static var main: BundleProtocol = NoopBundle()
}

public struct NoopBundle: BundleProtocol {
    public func object(forInfoDictionaryKey key: String) -> Any? {
        return nil
    }
}
#endif
