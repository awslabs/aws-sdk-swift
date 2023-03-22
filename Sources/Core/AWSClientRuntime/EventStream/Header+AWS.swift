//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import Foundation
import ClientRuntime

extension EventStream.Header {

    /// Converts ClientRuntime EventStream.Header to CRT EventStreamHeader
    func toCRTHeader() -> EventStreamHeader {
        EventStreamHeader(name: name, value: value.toCRTHeaderValue())
    }
}

extension EventStream.HeaderValue {

    /// Converts ClientRuntime EventStream.HeaderValue to CRT EventStreamHeaderValue
    func toCRTHeaderValue() -> EventStreamHeaderValue {
        switch self {
        case .bool(let value):
            return .bool(value: value)
        case .byte(let value):
            return .byte(value: value)
        case .int16(let value):
            return .int16(value: value)
        case .int32(let value):
            return .int32(value: Int32(value))
        case .int64(let value):
            return .int64(value: Int64(value))
        case .byteArray(let value):
            return .byteBuf(value: value)
        case .string(let value):
            return .string(value: value)
        case .timestamp(let value):
            return .timestamp(value: value)
        case .uuid(let value):
            return .uuid(value: value)
        }
    }
}

extension EventStreamHeader {

    /// Converts CRT EventStreamHeader to ClientRuntime EventStream.Header
    func toHeader() -> EventStream.Header {
        switch self.value {
        case .bool(value: let value):
            return .init(name: name, value: .bool(value))
        case .byte(value: let value):
            return .init(name: name, value: .byte(value))
        case .int16(value: let value):
            return .init(name: name, value: .int16(value))
        case .int32(value: let value):
            return .init(name: name, value: .int32(value))
        case .int64(value: let value):
            return .init(name: name, value: .int64(value))
        case .byteBuf(value: let value):
            return .init(name: name, value: .byteArray(value))
        case .string(value: let value):
            return .init(name: name, value: .string(value))
        case .timestamp(value: let value):
            return .init(name: name, value: .timestamp(value))
        case .uuid(value: let value):
            return .init(name: name, value: .uuid(value))
        }
    }
}

extension Array where Element == EventStreamHeader {

    /// Converts CRT EventStreamHeader array to ClientRuntime EventStream.Header array
    func toHeaders() -> [EventStream.Header] {
        self.map {
            $0.toHeader()
        }
    }
}
