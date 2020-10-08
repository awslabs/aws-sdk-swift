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

/// A general payload structure for Rest-JSON protocol errors
public struct RestJSONErrorPayload: Decodable {
    /// Payload Members which might hold Error name
    let code: String?
    let __type: String?
    
    /// Payload Members which might hold Error message
    let message: String?
    let Message: String?
    let errorMessage: String?
    
    // https://sapp.amazon.com/seps/accepted/shared/sdk-unmarshal-errors/#rest-json
    /// Resolve and return the error name
    public var resolvedErrorType: String? {
        if (code != nil) {
            return code
        } else {
            return __type
        }
    }
    
    /// Resolve and return the error message
    public var resolvedErrorMessage: String? {
        if (message != nil) {
            return message
        } else if (Message != nil) {
            return Message
        } else {
            return errorMessage
        }
    }
}
