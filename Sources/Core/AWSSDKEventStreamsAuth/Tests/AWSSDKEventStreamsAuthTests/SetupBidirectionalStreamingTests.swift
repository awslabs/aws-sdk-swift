//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct AwsCommonRuntimeKit.CommonRuntimeKit
import AWSSDKEventStreamsAuth
import AWSSDKHTTPAuth
import struct Foundation.Data
import Smithy
import SmithyEventStreamsAPI
import SmithyEventStreamsAuthAPI
import SmithyHTTPAuthAPI
import SmithyIdentity
import XCTest

final class SetupBidirectionalStreamingTests: XCTestCase {
    let credentials = AWSCredentialIdentity(accessKey: "fake access key", secret: "fake secret key")
    let message = Message(
        headers: [Header(name: ":event-type", value: .string("test"))],
        payload: Data("payload".utf8)
    )

    override static func setUp() {
        CommonRuntimeKit.initialize()
    }

    func test_sign_signsMessagesUnderSigV4() async throws {
        let messageSigner = try makeMessageSigner(schemeID: "aws.auth#sigv4")

        let signed = try await messageSigner.sign(message: message)

        XCTAssertNotNil(signed.headers.first { $0.name == ":chunk-signature" })
        let signedEmpty = try await messageSigner.signEmpty()
        XCTAssertNotNil(signedEmpty.headers.first { $0.name == ":chunk-signature" })
    }

    func test_sign_doesNotSignMessagesUnderSigV4a() async throws {
        try await assertUnsigned(schemeID: "aws.auth#sigv4a")
    }

    func test_sign_doesNotSignMessagesUnderNoAuth() async throws {
        try await assertUnsigned(schemeID: "smithy.api#noAuth")
    }

    func test_sign_doesNotSignMessagesUnderBearerAuth() async throws {
        try await assertUnsigned(schemeID: "smithy.api#httpBearerAuth")
    }

    func test_sign_doesNotSignMessagesWithNoSelectedAuthScheme() async throws {
        try await assertUnsigned(schemeID: nil)
    }

    // MARK: - Private methods

    private func assertUnsigned(schemeID: String?, file: StaticString = #filePath, line: UInt = #line) async throws {
        let messageSigner = try makeMessageSigner(schemeID: schemeID)

        let signed = try await messageSigner.sign(message: message)
        XCTAssertEqual(signed, message, file: file, line: line)
        let signedEmpty = try await messageSigner.signEmpty()
        XCTAssertEqual(signedEmpty, Message(), file: file, line: line)
    }

    private func makeMessageSigner(schemeID: String?) throws -> AWSMessageSigner {
        var builder = ContextBuilder()
            .withSigningRegion(value: "us-east-2")
            .withSigningName(value: "test")
            .withRequestSignature(value: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
            .withIdentityResolver(
                value: TestCustomAWSCredentialIdentityResolver(credentials: credentials),
                schemeID: "aws.auth#sigv4"
            )
        if let schemeID {
            builder = builder.withSelectedAuthScheme(value: SelectedAuthScheme(
                schemeID: schemeID,
                identity: credentials,
                signingProperties: Attributes(),
                signer: AWSSigV4Signer()
            ))
        }
        let context = builder.build()
        setupBidirectionalStreaming(context: context)
        return try XCTUnwrap(context.messageSigner as? AWSMessageSigner)
    }
}
