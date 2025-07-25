//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import protocol ClientRuntime.AfterSerialization
import protocol ClientRuntime.HttpInterceptorProvider
import protocol ClientRuntime.Interceptor
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse

/// Causes an XCTest assertion failure if the request is not signed with a bearer token.
public struct BearerTokenWasUsedInterceptorProvider: HttpInterceptorProvider {

    public init() {}

    public func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return BearerTokenWasUsedInterceptor()
    }
}

public struct BearerTokenWasUsedInterceptor<InputType, OutputType>: Interceptor {
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    public func readAfterSigning(context: some AfterSerialization<InputType, HTTPRequest>) async throws {
        let request = context.getRequest()
        guard let authHeader = request.headers.value(for: "Authorization") else {
            XCTFail("Authorization header was not present in signed response")
            return
        }
        guard authHeader.hasPrefix("Bearer ") else {
            XCTFail("Authorization header was not a bearer token.  Token contents: \"\(authHeader)\"")
            return
        }
    }
}
