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

    func testBidirectionalStreamingIsTrueWhenTrueInContext() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: true)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.bidirectionalStreaming))
        } catch {
            XCTFail()
        }
    }

    func testBidirectionalStreamingIsFalseWhenFalseInContext() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.bidirectionalStreaming))
        } catch {
            XCTFail()
        }
    }

    // AttributeKeys.signingName flag

    func testSigningNameIsCopiedCorrectly() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual("TestSigningName", updatedProperties.get(key: AttributeKeys.signingName))
        } catch {
            XCTFail()
        }
    }

    // AttributeKeys.signingRegion flag

    func testSigningRegionIsCopiedCorrectly() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual("TestSigningRegion", updatedProperties.get(key: AttributeKeys.signingRegion))
        } catch {
            XCTFail()
        }
    }

    // AttributeKeys.expiration flag

    func testExpirationValueIsZeroWhenNotSetInContext() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(0, updatedProperties.get(key: AttributeKeys.expiration))
        } catch {
            XCTFail()
        }
    }

    func testExpirationValueIsCopiedCorrectlyFromContext() {
        let context = contextBuilder
            .withExpiration(value: 12345)
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(12345, updatedProperties.get(key: AttributeKeys.expiration))
        } catch {
            XCTFail()
        }
    }

    // AttributeKeys.signatureType flag

    func testSignatureTypeForPresignURLFlowIsRequestQueryParams() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .PRESIGN_URL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(AWSSignatureType.requestQueryParams, updatedProperties.get(key: AttributeKeys.signatureType))
        } catch {
            XCTFail()
        }
    }

    func testSignatureTypeForNormalFlowIsRequestHeaders() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(AWSSignatureType.requestHeaders, updatedProperties.get(key: AttributeKeys.signatureType))
        } catch {
            XCTFail()
        }
    }

    func testSignatureTypeForPresignRequestFlowIsRequestHeaders() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .PRESIGN_REQUEST)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(AWSSignatureType.requestHeaders, updatedProperties.get(key: AttributeKeys.signatureType))
        } catch {
            XCTFail()
        }
    }

    // AttributeKeys.unsignedBody flag

    func testUnsignedBodyIsFalseWhenUnsignedPayloadTraitFlagAndForceUnsignedBodyFlagAreBothFalse() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.unsignedBody))
        } catch {
            XCTFail()
        }
    }

    func testUnsignedBodyIsTrueWhenUnsignedPayloadTraitFlagIsFalseAndShouldForceUnsignedBodyIsTrue() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "filler")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: true)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.unsignedBody))
        } catch {
            XCTFail()
        }
    }

    func testUnsignedBodyIsTrueWhenUnsignedPayloadTraitFlagIsTrueAndShouldForceUnsignedBodyIsFalse() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .PRESIGN_URL)
            .withOperation(value: "getObject")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.unsignedBody))
        } catch {
            XCTFail()
        }
    }

    // AttributeKeys.signedBodyHeader flag

    func testUseSignedBodyHeaderWhenServiceIsS3AndUseUnsignedBodyIsFalse() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(AWSSignedBodyHeader.contentSha256, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
        } catch {
            XCTFail()
        }
    }

    func testUseSignedBodyHeaderWhenServiceIsGlacierAndUseUnsignedBodyIsFalse() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "Glacier")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(AWSSignedBodyHeader.contentSha256, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
        } catch {
            XCTFail()
        }
    }

    func testUseSignedBodyHeaderWhenServiceIsS3ControlAndUseUnsignedBodyIsFalse() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3 Control")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(AWSSignedBodyHeader.contentSha256, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
        } catch {
            XCTFail()
        }
    }

    func testDontUseSignedBodyHeaderWhenUseUnsignedBodyIsTrue() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: true)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(AWSSignedBodyHeader.none, updatedProperties.get(key: AttributeKeys.signedBodyHeader))
        } catch {
            XCTFail()
        }
    }

    // S3-specific customizations

    // AttributeKeys.useDoubleURIEncode flag

    func testUseDoubleURIEncodeIsFalseWhenServiceIsS3() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.useDoubleURIEncode))
        } catch {
            XCTFail()
        }
    }

    func testUseDoubleURIEncodeIsTrueWhenServiceIsntS3() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "NonS3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.useDoubleURIEncode))
        } catch {
            XCTFail()
        }
    }

    // AttributeKeys.shouldNormalizeURIPath flag

    func testShouldNormalizeURIPathIsFalseWhenServiceIsS3() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "S3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(false, updatedProperties.get(key: AttributeKeys.shouldNormalizeURIPath))
        } catch {
            XCTFail()
        }
    }

    func testShouldNormalizeURIPathIsTrueWhenServiceIsntS3() {
        let context = contextBuilder
            .with(key: AttributeKeys.bidirectionalStreaming, value: false)
            .withServiceName(value: "NonS3")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "filler")
            .withUnsignedPayloadTrait(value: false)
            .build()
        do {
            let updatedProperties = try sigV4AuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
            XCTAssertEqual(true, updatedProperties.get(key: AttributeKeys.shouldNormalizeURIPath))
        } catch {
            XCTFail()
        }
    }
}
