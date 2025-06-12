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

final class S3ExpressConfigTests: XCTestCase {
    let ordinaryBucket = "testbucket"
    let s3ExpressBucket = "testbucket--use1-az1--x-s3"  // fits the S3 Express / directory bucket name pattern
    let region = "us-east-1"

    var config: S3Client.S3ClientConfiguration!

    override func setUp() async throws {
        try await super.setUp()
        self.config = try await S3Client.Config(
            s3ExpressIdentityResolver: MockS3ExpressIdentityResolver(),
            region: region,
            httpClientEngine: ProtocolTestClient()
        )
    }

    func test_config_usesSigV4ForOrdinaryBucketByDefault() async throws {
        self.config.addInterceptorProvider(CheckSigV4SignatureProvider())
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: ordinaryBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_usesSigV4ForOrdinaryBucketWhenS3ExpressEnabled() async throws {
        self.config.disableS3ExpressSessionAuth = false
        self.config.addInterceptorProvider(CheckSigV4SignatureProvider())
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: ordinaryBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_enablesS3ExpressByDefault() async throws {
        self.config.addInterceptorProvider(CheckS3ExpressSignatureProvider())
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: s3ExpressBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_enablesS3ExpressExplicitly() async throws {
        self.config.disableS3ExpressSessionAuth = false
        self.config.addInterceptorProvider(CheckS3ExpressSignatureProvider())
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: s3ExpressBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }

    func test_config_disablesS3Express() async throws {
        self.config.disableS3ExpressSessionAuth = true
        self.config.addInterceptorProvider(CheckSigV4SignatureProvider())
        let client = S3Client(config: config)
        let input = GetObjectInput(bucket: s3ExpressBucket, key: "text")
        do {
            _ = try await client.getObject(input: input)
        } catch is TestCheckError {
            // no-op
        }
    }
}

class CheckSigV4Signature<InputType, OutputType>: Interceptor {
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    func readBeforeSigning(context: some AfterSerialization<InputType, RequestType>) async throws {
        // Get the auth scheme and check that it's sigv4
        guard let schemeID = context.getAttributes().selectedAuthScheme?.schemeID else {
            XCTFail("No auth scheme selected"); return
        }
        XCTAssertEqual(schemeID, "aws.auth#sigv4")
    }
}

class CheckSigV4SignatureProvider: HttpInterceptorProvider {
    func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return CheckSigV4Signature()
    }
}

class CheckS3ExpressSignature<InputType, OutputType>: Interceptor {
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    func readBeforeSigning(context: some AfterSerialization<InputType, RequestType>) async throws {
        // Get the auth scheme and check that it's sigv4-s3express
        guard let schemeID = context.getAttributes().selectedAuthScheme?.schemeID else {
            XCTFail("No auth scheme selected"); return
        }
        XCTAssertEqual(schemeID, "aws.auth#sigv4-s3express")
    }
}

class CheckS3ExpressSignatureProvider: HttpInterceptorProvider {
    func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return CheckS3ExpressSignature()
    }
}

// Real S3 credentials are not needed for this test so a mock credential resolver is used to prevent
// obtaining credentials from S3.
//
// The mock also prevents the interceptors above from having to screen out the CreateSession call before
// the GetObject.
actor MockS3ExpressIdentityResolver: S3ExpressIdentityResolver {

    func getIdentity(identityProperties: Smithy.Attributes?) async throws -> AWSSDKIdentity.S3ExpressIdentity {
        return S3ExpressIdentity(
            accessKeyID: "AKIAIOSFODNN7EXAMPLE",
            secretAccessKey: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
            sessionToken: "abcdef",
            expiration: Date().addingTimeInterval(300.0)
        )
    }
}
