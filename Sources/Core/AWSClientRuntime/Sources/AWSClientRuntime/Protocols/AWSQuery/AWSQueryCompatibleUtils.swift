//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class SmithyHTTPAPI.HTTPResponse
@_spi(SmithyReadWrite) import class SmithyJSON.Reader

@_spi(SmithyReadWrite)
public enum AWSQueryCompatibleUtils {

    // awsJson1_0
    public static func makeQueryCompatibleError(
        httpResponse: HTTPResponse,
        responseReader: SmithyJSON.Reader,
        noErrorWrapping: Bool,
        errorDetails: String?
    ) throws -> AWSJSONError {
        let errorCode = try AwsQueryCompatibleErrorDetails.parse(errorDetails)?.code
        return try AWSJSONError(
            httpResponse: httpResponse,
            responseReader: responseReader,
            noErrorWrapping: noErrorWrapping,
            code: errorCode
        )
    }
}
