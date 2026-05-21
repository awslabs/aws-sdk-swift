//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSClientRuntime

class LongPollingOperationsTests: XCTestCase {

    func test_isLongPolling_SQS_receiveMessage() {
        XCTAssertTrue(LongPollingOperations.isLongPolling(serviceName: "SQS", operationName: "receiveMessage"))
    }

    func test_isLongPolling_SFN_getActivityTask() {
        XCTAssertTrue(LongPollingOperations.isLongPolling(serviceName: "SFN", operationName: "getActivityTask"))
    }

    func test_isLongPolling_SWF_pollForActivityTask() {
        XCTAssertTrue(LongPollingOperations.isLongPolling(serviceName: "SWF", operationName: "pollForActivityTask"))
    }

    func test_isLongPolling_SWF_pollForDecisionTask() {
        XCTAssertTrue(LongPollingOperations.isLongPolling(serviceName: "SWF", operationName: "pollForDecisionTask"))
    }

    func test_isLongPolling_nonLongPollingOperation_returnsFalse() {
        XCTAssertFalse(LongPollingOperations.isLongPolling(serviceName: "S3", operationName: "getObject"))
    }

    func test_isLongPolling_pascalCase_doesNotMatch() {
        XCTAssertFalse(LongPollingOperations.isLongPolling(serviceName: "SQS", operationName: "ReceiveMessage"))
    }
}
