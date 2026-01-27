//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import XCTest
import AWSS3
import ClientRuntime
import SmithyHTTPAPI
import SmithyHTTPAuthAPI
import SmithyTestUtil
import AWSSDKIdentity
import AWSSDKIdentityAPI
import AWSSDKHTTPAuth

// These tests confirm that the disableS3ExpressSessionAuth option
// works as expected and that the SDK selects the correct auth option
// based on bucket name.
//
// This test makes no connections to S3, either for the GetObject operation
// being tested, or to obtain S3 Express credentials.
//
// Tests set up an initial S3 client config and GetObject input params.
// An interceptor is used to determine that the correct auth scheme was
// selected based on the inputs.
//
// The ProtocolTestClient is used in place of a live HTTP client
// to prevent real HTTP requests from being made.
final class S3ExpressConfigTests: XCTestCase {
    let region = "us-east-1"

    // This bucket name maps to a "general purpose" (i.e. non-S3 Express) bucket.
    let ordinaryBucket = "testbucket"

    // This bucket name fits the S3 Express / directory bucket name pattern
    let s3ExpressBucket = "testbucket--use1-az1--x-s3"

    var config: S3Client.S3ClientConfiguration!

    override func setUp() async throws {
        try await super.setUp()
        self.config = try await S3Client.Config(
            s3ExpressIdentityResolver: MockS3ExpressIdentityResolver(),
            region: region,
            httpClientEngine: ProtocolTestClient()
        )
    }

    func test_config_usesSigV4ForGeneralPurposeBucketByDefault() async throws {
        self.config.addInterceptorProvider(CheckSelectedAuthSchemeProvider(expected: SigV4AuthScheme()))
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: ordinaryBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_usesSigV4ForGeneralPurposeBucketWhenS3ExpressEnabled() async throws {
        self.config.disableS3ExpressSessionAuth = false
        self.config.addInterceptorProvider(CheckSelectedAuthSchemeProvider(expected: SigV4AuthScheme()))
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: ordinaryBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_enablesS3ExpressByDefaultForS3ExpressBucket() async throws {
        self.config.addInterceptorProvider(CheckSelectedAuthSchemeProvider(expected: SigV4S3ExpressAuthScheme()))
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: s3ExpressBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_enablesS3ExpressExplicitlyForS3ExpressBucket() async throws {
        self.config.disableS3ExpressSessionAuth = false
        self.config.addInterceptorProvider(CheckSelectedAuthSchemeProvider(expected: SigV4S3ExpressAuthScheme()))
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: s3ExpressBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_disablesS3ExpressForS3ExpressBucket() async throws {
        self.config.disableS3ExpressSessionAuth = true
        self.config.addInterceptorProvider(CheckSelectedAuthSchemeProvider(expected: SigV4AuthScheme()))
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: s3ExpressBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }
}

class CheckSelectedAuthScheme<InputType, OutputType>: Interceptor {
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    let expectedAuthScheme: AuthScheme

    init(expected expectedAuthScheme: AuthScheme) {
        self.expectedAuthScheme = expectedAuthScheme
    }

    func readBeforeSigning(context: some AfterSerialization<InputType, RequestType>) async throws {
        // Get the auth scheme and check that it matches expected
        guard let selectedAuthScheme = context.getAttributes().selectedAuthScheme else {
            XCTFail("No auth scheme selected"); return
        }
        XCTAssertEqual(selectedAuthScheme.schemeID, expectedAuthScheme.schemeID)
    }
}

class CheckSelectedAuthSchemeProvider: HttpInterceptorProvider {

    let expectedAuthScheme: AuthScheme

    init(expected expectedAuthScheme: AuthScheme) {
        self.expectedAuthScheme = expectedAuthScheme
    }

    func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return CheckSelectedAuthScheme(expected: expectedAuthScheme)
    }
}

// Real S3 credentials are not needed for this test so a mock credential resolver
// is used to prevent obtaining credentials from live S3.
//
// The mock also prevents the interceptors above from needing logic to ignore the
// CreateSession call before the GetObject.
private actor MockS3ExpressIdentityResolver: S3ExpressIdentityResolver {

    func getIdentity(identityProperties: Smithy.Attributes?) async throws -> S3ExpressIdentity {
        return S3ExpressIdentity(
            accessKeyID: "AKIAIOSFODNN7EXAMPLE",
            secretAccessKey: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
            sessionToken: "abcdef",
            expiration: Date().addingTimeInterval(300.0)
        )
    }
}
