//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#if os(iOS) || os(watchOS) || os(tvOS)
import Foundation.NSBundle
public typealias Bundle = Foundation.Bundle
#else
// swiftlint:disable discouraged_direct_init
public struct Bundle {
    func object(forInfoDictionaryKey key: String) -> Any? {
        return nil
    }
    public static var main: Bundle = Bundle()
}
#endif
// swiftlint:enable discouraged_direct_init
