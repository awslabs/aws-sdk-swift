//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSSTS
import ClientRuntime
import protocol SmithyIdentityAPI.Identity
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
import enum Smithy.ClientError
import struct SmithyIdentity.AWSCredentialIdentity

class DefaultAWSCredentialIdentityResolverChainTests: XCTestCase {
    private var stsClient: STSClient!
    private let region = "us-west-2"

    override func setUp() async throws {
        try await super.setUp()
        let stsConfig = try await STSClient.STSClientConfiguration(region: region)
        stsConfig.addInterceptorProvider(XCTestAssertionInterceptorProvider())
        stsClient = STSClient(config: stsConfig)
    }

    func testCredentialsCaching() async throws {
        let input = GetCallerIdentityInput()
        for _ in 1...5 {
            _ = try await stsClient.getCallerIdentity(input: input)
        }
    }

    class XCTestAssertionChecker {
        private var cachedCredentials: AWSCredentialIdentity?

        func checkCredentials(identity: Identity?) async throws {
            let resolvedCredentials = identity as? AWSCredentialIdentity
            guard let resolvedCredentials else {
                XCTFail()
                throw ClientError.dataNotFound("This should never be reached.")
            }
            if let cachedCredentials {
                // Manual checking & XCTFail is used instead of XCTAssertEqual to prevent credential leak when
                //  assertion fails (both values get printed to console upon assertion failure).
                if cachedCredentials.accessKey != resolvedCredentials.accessKey {
                    XCTFail("Cached accessKey and resolved accessKey do not match.")
                }
                if cachedCredentials.secret != resolvedCredentials.secret {
                    XCTFail("Cached secret and resolved secret do not match.")
                }
            } else {
                cachedCredentials = resolvedCredentials
            }
        }
    }

    class XCTestAssertionInterceptorProvider: HttpInterceptorProvider {
        private let checker = XCTestAssertionChecker()
        func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
            return InterceptorContainer(checker: checker)
        }
    }

    struct InterceptorContainer<InputType, OutputType>: Interceptor {
        typealias RequestType = HTTPRequest
        typealias ResponseType = HTTPResponse

        let checker: XCTestAssertionChecker

        func readBeforeTransmit(context: some AfterSerialization<InputType, RequestType>) async throws {
            let identity = context.getAttributes().selectedAuthScheme?.identity
            try await checker.checkCredentials(identity: identity)
        }
    }
}
