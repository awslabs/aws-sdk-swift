//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import Smithy
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
import protocol SmithySerialization.DeserializableStruct
import protocol SmithySerialization.SerializableStruct

public struct Plugin: ClientRuntime.Plugin {

    public init() {}

    public func configureClient<Config: ClientConfiguration>(clientConfiguration: inout Config) async throws {
        guard var defaultConfig = clientConfiguration as? DefaultHttpClientConfiguration else { return }
        defaultConfig.addInterceptorProvider(URLPathInterceptorProvider())
        guard let modifiedConfig = defaultConfig as? Config else { return }
        clientConfiguration = modifiedConfig
    }
}

struct URLPathInterceptorProvider: HttpInterceptorProvider {

    func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        ClientRuntime.URLPathMiddleware<InputType, OutputType>() { _ in "/" }
    }
}
