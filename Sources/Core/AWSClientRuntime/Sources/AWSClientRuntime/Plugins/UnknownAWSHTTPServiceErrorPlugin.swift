//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.ClientConfiguration
import protocol ClientRuntime.DefaultClientConfiguration
import protocol ClientRuntime.Interceptor
import protocol ClientRuntime.InterceptorProvider
import protocol ClientRuntime.MutableOutputFinalization
import protocol ClientRuntime.Plugin
import struct ClientRuntime.UnknownHTTPServiceError
import protocol Smithy.RequestMessage
import protocol Smithy.ResponseMessage

public struct UnknownAWSHTTPServiceErrorPlugin: Plugin {

    public init() {}

    public func configureClient<Config: ClientConfiguration>(clientConfiguration: inout Config) async throws {
        guard var defaultClientConfiguration = clientConfiguration as? DefaultClientConfiguration else { return }
        defaultClientConfiguration.addInterceptorProvider(ErrorInterceptorProvider())
    }
}

private struct ErrorInterceptorProvider: InterceptorProvider {

    func create<InputType, OutputType, RequestType: RequestMessage, ResponseType: ResponseMessage>(
    ) -> any Interceptor<InputType, OutputType, RequestType, ResponseType> {
        ErrorInterceptor()
    }
}

private struct ErrorInterceptor<InputType, OutputType, RequestType: RequestMessage, ResponseType: ResponseMessage>: Interceptor {

    func modifyBeforeCompletion(
        context: some MutableOutputFinalization<InputType, OutputType, RequestType, ResponseType>
    ) async throws {
        do {
            _ = try context.getOutput()
        } catch let smithyUnknownError as UnknownHTTPServiceError {
            let awsUnknownError = UnknownAWSHTTPServiceError(
                httpResponse: smithyUnknownError.httpResponse,
                message: smithyUnknownError.message,
                requestID: smithyUnknownError.httpResponse.requestID,
                requestID2: smithyUnknownError.httpResponse.requestID2,
                typeName: smithyUnknownError.typeName
            )
            context.updateError(updated: awsUnknownError)
        }
    }
}
