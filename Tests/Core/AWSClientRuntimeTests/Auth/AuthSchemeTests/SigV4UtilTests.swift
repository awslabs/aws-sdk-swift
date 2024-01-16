//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import SmithyTestUtil
import ClientRuntime
@testable import AWSClientRuntime

class SigV4UtilTests: XCTestCase {
    // Test shouldForceUnsignedBody returning true
    func testShouldForceUnsignedBodyIsTrueWhenServiceIsS3AndFlowTypeIsPresignURLAndOperationIsGetObject() {
        XCTAssertTrue(SigV4Util.shouldForceUnsignedBody(flow: .PRESIGN_URL, serviceName: "S3", opName: "getObject"))
    }

    func testShouldForceUnsignedBodyIsTrueWhenServiceIsS3AndFlowTypeIsPresignURLAndOperationIsPutObject() {
        XCTAssertTrue(SigV4Util.shouldForceUnsignedBody(flow: .PRESIGN_URL, serviceName: "S3", opName: "putObject"))
    }

    // Test shouldForceUnsignedBody returning false due to one failing condition
    func testShouldForceUnsignedBodyIsFalseWhenServiceIsntS3() {
        XCTAssertFalse(SigV4Util.shouldForceUnsignedBody(flow: .PRESIGN_URL, serviceName: "NonS3", opName: "getObject"))
    }

    func testShouldForceUnsignedBodyIsFalseWhenFlowIsntPresignURL() {
        XCTAssertFalse(SigV4Util.shouldForceUnsignedBody(flow: .PRESIGN_REQUEST, serviceName: "S3", opName: "getObject"))
    }

    func testShouldForceUnsignedBodyIsFalseWhenOperationIsntGetObjectOrPutObject() {
        XCTAssertFalse(SigV4Util.shouldForceUnsignedBody(flow: .PRESIGN_URL, serviceName: "S3", opName: "noOp"))
    }

    // Test useSignedBodyHeader returning true
    func testUseSignedBodyHeaderIsTrueWhenServiceIsS3() {
        XCTAssertTrue(SigV4Util.serviceUsesSignedBodyHeader(serviceName: "S3"))
    }

    func testUseSignedBodyHeaderIsTrueWhenServiceIsS3Control() {
        XCTAssertTrue(SigV4Util.serviceUsesSignedBodyHeader(serviceName: "S3 Control"))
    }

    func testUseSignedBodyHeaderIsTrueWhenServiceIsGlacier() {
        XCTAssertTrue(SigV4Util.serviceUsesSignedBodyHeader(serviceName: "Glacier"))
    }

    // Test useSignedBodyHeader returning false
    func testUseSignedBodyHeaderIsTrueWhenServiceIsNotApplicable() {
        XCTAssertFalse(SigV4Util.serviceUsesSignedBodyHeader(serviceName: "RandomService"))
    }
}
