//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct SmithyHTTPAPI.Headers
import protocol SmithyHTTPAPI.HTTPClient
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse

/// An HTTP client that returns a canned response supplied by the caller, instead of
/// performing a network request.
public final class MockHTTPClient: HTTPClient {
    private let handler: @Sendable (HTTPRequest) async -> HTTPResponse

    /// - Parameter handler: Returns the response to be used for a request.
    public init(handler: @escaping @Sendable (HTTPRequest) async -> HTTPResponse) {
        self.handler = handler
    }

    public func send(request: HTTPRequest) async throws -> HTTPResponse {
        await handler(request)
    }

    public func close() async throws {
        // No-op for mock
    }
}

/// Records the headers of the request seen by a mock HTTP client.
///
/// `MockHTTPClient`'s handler is `@Sendable`, so the captured headers cannot be stored in a
/// local `var`.  An actor gives the handler something safe to capture.
public actor HeadersRecorder {
    public private(set) var headers: Headers?

    public init() {}

    public func record(_ headers: Headers) {
        self.headers = headers
    }
}
