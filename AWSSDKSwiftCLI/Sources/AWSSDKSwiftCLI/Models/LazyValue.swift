//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// A class that enables lazy loading a value.
/// This is useful when you want to lazy load a value within a local scope.
public class LazyValue<T> {
    public lazy var value: T = valueProducer()
    private let valueProducer: () -> T
    public init(_ valueProducer: @escaping @autoclosure () -> T) {
        self.valueProducer = valueProducer
    }
}
