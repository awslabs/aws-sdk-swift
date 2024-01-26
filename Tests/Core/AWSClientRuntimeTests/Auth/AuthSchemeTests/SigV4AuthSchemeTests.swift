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

class SigV4AuthSchemeTests: XCTestCase {
    private var contextBuilder: HttpContextBuilder!
    private var sigV4AuthScheme: SigV4AuthScheme!

    override func setUp() async throws {
        try await super.setUp()
        contextBuilder = HttpContextBuilder()
            .withSigningName(value: "TestSigningName")
            .withSigningRegion(value: "TestSigningRegion")
        sigV4AuthScheme = SigV4AuthScheme()
    }

    // AttributeKeys.bidirectionalStreaming flag

    func testBidirectionalStreamingIsTrueWhenTrueInContext() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: true)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.bidirectionalStreaming))
    }

    func testBidirectionalStreamingIsFalseWhenFalseInContext() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.bidirectionalStreaming))
    }

    // AttributeKeys.signingName flag

    func testSigningNameIsCopiedCorrectly() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual("TestSigningName", updatedProperties.get(key: AttributeKeys.signingName))
    }

    // AttributeKeys.signingRegion flag

    func testSigningRegionIsCopiedCorrectly() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual("TestSigningRegion", updatedProperties.get(key: AttributeKeys.signingRegion))
    }

    // AttributeKeys.expiration flag

    func testExpirationValueIsZeroWhenNotSetInContext() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(0, updatedProperties.get(key: AttributeKeys.expiration))
    }

    func testExpirationValueIsCopiedCorrectlyFromContext() throws {
        let context = contextBuilder
            .withExpiration(value: 12345)
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(12345, updatedProperties.get(key: AttributeKeys.expiration))
    }

    // AttributeKeys.signatureType flag

    func testSignatureTypeForPresignURLFlowIsRequestQueryParams() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .PRESIGN_URL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(AWSSignatureType.requestQueryParams, updatedProperties.get(key: AttributeKeys.signatureType))
    }

    func testSignatureTypeForNormalFlowIsRequestHeaders() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(AWSSignatureType.requestHeaders, updatedProperties.get(key: AttributeKeys.signatureType))
    }

    func testSignatureTypeForPresignRequestFlowIsRequestHeaders() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .PRESIGN_REQUEST)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(AWSSignatureType.requestHeaders, updatedProperties.get(key: AttributeKeys.signatureType))
    }

    // AttributeKeys.unsignedBody flag

    func testUnsignedBodyIsFalseWhenUnsignedPayloadTraitFlagAndForceUnsignedBodyFlagAreBothFalse() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.unsignedBody))
    }

    func testUnsignedBodyIsTrueWhenUnsignedPayloadTraitFlagIsFalseAndShouldForceUnsignedBodyIsTrue() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: true)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.unsignedBody))
    }

    func testUnsignedBodyIsTrueWhenUnsignedPayloadTraitFlagIsTrueAndShouldForceUnsignedBodyIsFalse() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .PRESIGN_URL)
            .withOperation(value: "getObject")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.unsignedBody))
    }

    // AttributeKeys.signedBodyHeader flag

    func testUseSignedBodyHeaderWhenServiceIsS3AndUseUnsignedBodyIsFalse() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(AWSSignedBodyHeader.contentSha256, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
    }

    func testUseSignedBodyHeaderWhenServiceIsGlacierAndUseUnsignedBodyIsFalse() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "Glacier")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(AWSSignedBodyHeader.contentSha256, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
    }

    func testUseSignedBodyHeaderWhenServiceIsS3ControlAndUseUnsignedBodyIsFalse() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3 Control")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(AWSSignedBodyHeader.contentSha256, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
    }

    func testDontUseSignedBodyHeaderWhenUseUnsignedBodyIsTrue() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: true)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(AWSSignedBodyHeader.none, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
    }

    // S3-specific customizations

    // AttributeKeys.useDoubleURIEncode flag

    func testUseDoubleURIEncodeIsFalseWhenServiceIsS3() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.useDoubleURIEncode))
    }

    func testUseDoubleURIEncodeIsTrueWhenServiceIsntS3() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "NonS3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.useDoubleURIEncode))
    }

    // AttributeKeys.shouldNormalizeURIPath flag

    func testShouldNormalizeURIPathIsFalseWhenServiceIsS3() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.shouldNormalizeURIPath))
    }

    func testShouldNormalizeURIPathIsTrueWhenServiceIsntS3() throws {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "NonS3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.shouldNormalizeURIPath))
    }
}
