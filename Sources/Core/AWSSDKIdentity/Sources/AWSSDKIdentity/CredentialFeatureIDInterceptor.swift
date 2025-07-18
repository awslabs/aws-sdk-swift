//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.Interceptor
import protocol ClientRuntime.MutableRequest
import protocol ClientRuntime.HttpInterceptorProvider
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse

private class CredentialFeatureIDInterceptor<InputType, OutputType>: Interceptor {
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    private let featureIDsToAdd: [String]

    public init(featureIDsToAdd: [String]) {
        self.featureIDsToAdd = featureIDsToAdd
    }

    public func modifyBeforeSigning(context: some MutableRequest<InputType, RequestType>) async throws {
        context.getAttributes().set(
            key: AWSIdentityPropertyKeys.manuallyConfiguredCredentialFeatureIDs,
            value: featureIDsToAdd
        )
    }
}

public class CredentialFeatureIDInterceptorProvider: HttpInterceptorProvider {
    private let featureIDsToAdd: [String]

    public init(featureIDsToAdd: [String]) {
        self.featureIDsToAdd = featureIDsToAdd
    }

    public func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return CredentialFeatureIDInterceptor(featureIDsToAdd: featureIDsToAdd)
    }
}
