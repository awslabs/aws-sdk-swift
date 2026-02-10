//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.AttributeKey
import class Smithy.Context
import class Smithy.ContextBuilder

public extension Context {
    /// Controls whether aws-chunked encoding should be enabled for S3 operations.
    ///
    /// - `nil`: Auto-detect based on stream eligibility (default behavior)
    /// - `true`: Force enable aws-chunked encoding (requires streaming body)
    /// - `false`: Force disable aws-chunked encoding
    var enableAWSChunked: Bool? {
        get { get(key: enableAWSChunkedKey) }
        set { set(key: enableAWSChunkedKey, value: newValue) }
    }
}

public extension ContextBuilder {
    /// Sets the enableAWSChunked configuration value in the context.
    ///
    /// - Parameter value: The enableAWSChunked configuration value
    /// - Returns: Self for method chaining
    @discardableResult
    func withEnableAWSChunked(value: Bool?) -> Self {
        attributes.set(key: enableAWSChunkedKey, value: value)
        return self
    }
}

private let enableAWSChunkedKey = AttributeKey<Bool>(name: "EnableAWSChunked")
