//
// Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

import ClientRuntime

/// AWS specific Service Error structure used when exact error could not be deduced from the `HttpResponse`
public struct UnknownAWSHttpServiceError: AWSHttpServiceError {
    public var _statusCode: HttpStatusCode?
    
    public var _headers: HttpHeaders?
    
    public var _message: String?
    
    public var _requestID: String?
    
    public var _retryable: Bool? = false
    
    public var _type: ErrorType = .unknown
}

extension UnknownAWSHttpServiceError {
    public init(httpResponse: HttpResponse, message: String? = nil) {
        self._statusCode = httpResponse.statusCode
        self._headers = httpResponse.headers
        self._requestID = httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)
        self._message = message
    }
}
