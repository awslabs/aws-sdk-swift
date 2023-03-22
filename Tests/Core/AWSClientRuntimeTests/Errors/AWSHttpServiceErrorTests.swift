//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import ClientRuntime
import AWSClientRuntime

class AWSHttpServiceErrorTests: XCTestCase {

    func test_unknownAWSHttpServiceError_returnsErrorTypeAsErrorCode() async throws {
        let errorType = "def456"
        let error = UnknownAWSHttpServiceError(httpResponse: httpResponse, errorType: errorType)
        XCTAssertEqual(error._errorCode, errorType)
    }

    func test_AWSHttpServiceError_returnsModelNameAsErrorCode() async throws {
        let error: AWSHttpServiceError = try ComplexXMLError(httpResponse: httpResponse)
        XCTAssertEqual(error._errorCode, ComplexXMLError._modelName)
    }

    private var httpResponse: HttpResponse { HttpResponse(body: HttpBody.none, statusCode: .ok) }
}
