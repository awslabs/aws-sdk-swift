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
        guard var defaultConfig = clientConfiguration as? DefaultClientConfiguration else { return }
        defaultConfig.addInterceptorProvider(ErrorInterceptorProvider())
        guard let modifiedConfig = defaultConfig as? Config else { return }
        clientConfiguration = modifiedConfig
    }
}

private struct ErrorInterceptorProvider: InterceptorProvider {

    func create<InputType, OutputType, RequestType: RequestMessage, ResponseType: ResponseMessage>(
    ) -> any Interceptor<InputType, OutputType, RequestType, ResponseType> {
        ErrorInterceptor()
    }
}

private struct ErrorInterceptor<
    InputType, OutputType, RequestType: RequestMessage, ResponseType: ResponseMessage
>: Interceptor {

    func modifyBeforeCompletion(
        context: some MutableOutputFinalization<InputType, OutputType, RequestType, ResponseType>
    ) async throws {

        // If the response is an error AND the error type is UnknownHTTPServiceError,
        // then create an UnknownAWSHTTPServiceError and replace the error with that
        // If the response is success or is any other type of error, leave it unmodified.
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
