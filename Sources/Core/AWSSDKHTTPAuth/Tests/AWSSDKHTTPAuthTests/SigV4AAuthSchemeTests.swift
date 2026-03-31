//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyHTTPAuth
import SmithyHTTPAuthAPI
import AWSSDKHTTPAuth
import XCTest
import Smithy

class SigV4AAuthSchemeTests: XCTestCase {
    private var sigV4AAuthScheme: AWSSDKHTTPAuth.SigV4AAuthScheme!

    override func setUp() async throws {
        try await super.setUp()
        sigV4AAuthScheme = SigV4AAuthScheme()
    }

    private func makeContext(
        signingName: String = "testService",
        signingRegion: String = "us-east-1",
        sigV4aSigningRegionSet: [String]? = nil
    ) -> Context {
        var builder = ContextBuilder()
            .withSigningName(value: signingName)
            .withSigningRegion(value: signingRegion)
            .withBidirectionalStreamingEnabled(value: false)
            .withServiceName(value: "testService")
            .withFlowType(value: .NORMAL)
            .withOperation(value: "testOp")
            .withUnsignedPayloadTrait(value: false)
        if let regionSet = sigV4aSigningRegionSet {
            builder = builder.withSigV4aSigningRegionSet(value: regionSet)
        }
        return builder.build()
    }

    // SigningPropertyKeys.signingAlgorithm flag

    func testSigningAlgorithmIsSigV4A() throws {
        let context = makeContext()
        let result = try sigV4AAuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual(.sigv4a, result.get(key: SigningPropertyKeys.signingAlgorithm))
    }

    // SigningPropertyKeys.signingRegion with sigV4aSigningRegionSet

    func testSigningRegionUsesRegionSetFromContext() throws {
        let context = makeContext(sigV4aSigningRegionSet: ["*"])
        let result = try sigV4AAuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual("*", result.get(key: SigningPropertyKeys.signingRegion))
    }

    func testSigningRegionUsesRegionSetFromSigningProperties() throws {
        let context = makeContext()
        var signingProperties = Attributes()
        signingProperties.set(key: SigningPropertyKeys.sigV4aSigningRegionSet, value: ["*"])
        let result = try sigV4AAuthScheme.customizeSigningProperties(signingProperties: signingProperties, context: context)
        XCTAssertEqual("*", result.get(key: SigningPropertyKeys.signingRegion))
    }

    func testSigningPropertiesRegionSetTakesPrecedenceOverContext() throws {
        let context = makeContext(sigV4aSigningRegionSet: ["eu-west-1"])
        var signingProperties = Attributes()
        signingProperties.set(key: SigningPropertyKeys.sigV4aSigningRegionSet, value: ["*"])
        let result = try sigV4AAuthScheme.customizeSigningProperties(signingProperties: signingProperties, context: context)
        XCTAssertEqual("*", result.get(key: SigningPropertyKeys.signingRegion))
    }

    func testFallsBackToSigningRegionWhenNoRegionSet() throws {
        let context = makeContext(signingRegion: "us-west-2")
        let result = try sigV4AAuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual("us-west-2", result.get(key: SigningPropertyKeys.signingRegion))
    }

    func testMultipleRegionsJoinedWithComma() throws {
        let context = makeContext(sigV4aSigningRegionSet: ["us-east-1", "eu-west-1"])
        let result = try sigV4AAuthScheme.customizeSigningProperties(signingProperties: Attributes(), context: context)
        XCTAssertEqual("us-east-1,eu-west-1", result.get(key: SigningPropertyKeys.signingRegion))
    }
}
