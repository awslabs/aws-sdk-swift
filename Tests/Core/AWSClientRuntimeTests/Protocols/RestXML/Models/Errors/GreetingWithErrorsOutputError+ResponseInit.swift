//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSClientRuntime
import ClientRuntime

extension GreetingWithErrorsOutputError: HttpResponseErrorBinding {
    public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder?) async throws -> ServiceError {
        let errorDetails = try await RestXMLError(httpResponse: httpResponse)
        switch errorDetails.errorCode {
        case "ComplexXMLError": return try await ComplexXMLError(httpResponse: httpResponse, decoder: decoder, message: errorDetails.message, requestID: errorDetails.requestId)
        case "InvalidGreeting": return try await InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: errorDetails.message, requestID: errorDetails.requestId)
        default: return UnknownAWSHttpServiceError(httpResponse: httpResponse, message: errorDetails.message, requestID: errorDetails.requestId)
        }
    }
}

