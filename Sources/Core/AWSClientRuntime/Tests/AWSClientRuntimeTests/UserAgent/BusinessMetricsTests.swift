//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
@testable import AWSClientRuntime
import SmithyRetriesAPI
import SmithyHTTPAPI
import SmithyHTTPAuthAPI
import SmithyHTTPAPI
import SmithyIdentity
import SmithyRetriesAPI
import Smithy

class BusinessMetricsTests: XCTestCase {
    var context: Context!
    var config: UserAgentValuesFromConfig!
    var headers: Headers!

    override func setUp() async throws {
        config = UserAgentValuesFromConfig(appID: nil, endpoint: nil, awsRetryMode: .standard, requestChecksumCalculation: .whenSupported, responseChecksumValidation: .whenSupported)
        context = Context(attributes: Attributes())
        headers = Headers()
    }

    // MARK: - Truncation

    func test_business_metrics_section_truncation() {
        context.businessMetrics = ["SHORT_FILLER": "A"]
        let longMetricValue = String(repeating: "F", count: 1025)
        context.businessMetrics = ["LONG_FILLER": longMetricValue]
        config = UserAgentValuesFromConfig(appID: nil, endpoint: nil, awsRetryMode: .standard, requestChecksumCalculation: .whenRequired, responseChecksumValidation: .whenRequired)

        let userAgent = createTestUserAgent()

        // Assert values in context match with values assigned to user agent
        XCTAssertEqual(userAgent.businessMetrics?.features, context.businessMetrics)
        // Assert string gets truncated successfully
        let expectedTruncatedString = "m/A,E"
        XCTAssertEqual(userAgent.businessMetrics?.description, expectedTruncatedString)
    }

    // MARK: - Multiple flags

    func test_multiple_flags_in_context() {
        context.businessMetrics = ["FIRST": "A"]
        context.businessMetrics = ["SECOND": "B"]
        context.setSelectedAuthScheme(SelectedAuthScheme( // S
            schemeID: "aws.auth#sigv4a",
            identity: nil,
            signingProperties: nil,
            signer: nil
        ))

        config = UserAgentValuesFromConfig(appID: nil, endpoint: "test-endpoint", awsRetryMode: .adaptive, requestChecksumCalculation: .whenSupported, responseChecksumValidation: .whenSupported)
        let userAgent = createTestUserAgent()

        // F comes from retry mode being adaptive & N comes from endpoint override
        let expectedString = "m/A,B,F,N,S,Z,b"
        XCTAssertEqual(userAgent.businessMetrics?.description, expectedString)
    }

    // MARK: - AccountIDEndpointMode

    func test_accountIDEndpointMode_recordsPreferredCorrectly() {
        context.accountIDEndpointMode = .preferred

        let userAgent = createTestUserAgent()

        // E comes from retry mode & P comes from preferred account ID endpoint mode
        let expectedString = "m/E,P,Z,b"
        XCTAssertEqual(userAgent.businessMetrics?.description, expectedString)
    }

    func test_accountIDEndpointMode_recordsDisabledCorrectly() {
        context.accountIDEndpointMode = .disabled

        let userAgent = createTestUserAgent()

        // E comes from retry mode & Q comes from disabled account ID endpoint mode
        let expectedString = "m/E,Q,Z,b"
        XCTAssertEqual(userAgent.businessMetrics?.description, expectedString)
    }

    func test_accountIDEndpointMode_recordsRequiredCorrectly() {
        context.accountIDEndpointMode = .required

        let userAgent = createTestUserAgent()

        // E comes from retry mode & R comes from required account ID endpoint mode
        let expectedString = "m/E,R,Z,b"
        XCTAssertEqual(userAgent.businessMetrics?.description, expectedString)
    }

    // MARK: - Private methods

    private func createTestUserAgent() -> AWSUserAgentMetadata {
        AWSUserAgentMetadata.fromConfigAndContext(
            serviceID: "test",
            version: "1.0",
            config: config,
            context: context,
            headers: headers
        )
    }

    private func configureContext(host: String, accountID: String) {
        let selectedAuthScheme = SelectedAuthScheme(schemeID: "aws.auth#sigv4", identity: AWSCredentialIdentity(accessKey: "abc", secret: "def", accountID: accountID), signingProperties: Attributes(), signer: nil)
        context.selectedAuthScheme = selectedAuthScheme
        let uri = URIBuilder().withScheme(.https).withPath("/").withHost(host).build()
    }
}
