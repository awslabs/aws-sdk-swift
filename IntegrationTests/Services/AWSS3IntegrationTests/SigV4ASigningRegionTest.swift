//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import AWSSDKHTTPAuth
import ClientRuntime
import Smithy
import SmithyHTTPAPI
import SmithyHTTPAuthAPI
import SmithyTestUtil
import XCTest

// Checks that S3's rules-based SigV4A operations resolve signing region to "*" using PutObject with MRAP ARN.
class SigV4ASigningRegionTest: XCTestCase {
    private var sigv4aClient: S3Client!
    private var sigv4aConfig: S3Client.S3ClientConfiguration!

    override func setUp() async throws {
        sigv4aConfig = try await S3Client.S3ClientConfiguration(region: "dummy-region")
        sigv4aConfig.authSchemes = [SigV4AAuthScheme()]
        sigv4aConfig.httpClientEngine = ProtocolTestClient() // Mock HTTP client that doesn't actually send a request
        sigv4aConfig.addInterceptorProvider(SigningRegionAssertInterceptorProvider())
        sigv4aClient = S3Client(config: sigv4aConfig)
    }

    func testResolvedSigningRegionIsAsterisk() async throws {
        do {
            // Providing input.bucket value in the format of MRAP ARN causes endpoint to resolve to MRAP endpoint with
            //  auth schemes property that has SigV4A.
            // Then, when signing properties are resolved by the auth scheme, signing region resolved by the service's
            //  AuthSchemeResolver, saved in AuthOption, supersedes the one provided in config, saved in context.
            _ = try await sigv4aClient.putObject(input: PutObjectInput(
                body: ByteStream.data(Data()),
                bucket: "arn:aws:s3::123456789012:accesspoint/mfzwi23gnjvgw.mrap", // Dummy ARN for MRAP
                key: "dummy-key"
            ))
        } catch is TestCheckError {
            // This is the expected error thrown by Mock HTTP client; no-op.
        }
    }
}

class SigningRegionAssertInterceptor<InputType, OutputType>: Interceptor {
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    func readBeforeSigning(context: some AfterSerialization<InputType, RequestType>) async throws {
        let resolvedSigningRegion = context.getAttributes().selectedAuthScheme?.signingProperties?.get(
            key: SigningPropertyKeys.signingRegion
        )
        XCTAssertNotNil(resolvedSigningRegion)
        XCTAssertEqual(resolvedSigningRegion!, "*") // Assert that the resolved signing region is "*", as expected.
    }
}

class SigningRegionAssertInterceptorProvider: HttpInterceptorProvider {
  func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
      return SigningRegionAssertInterceptor()
  }
}
