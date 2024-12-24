//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import Smithy
import SmithyIdentity
import SmithyHTTPAPI
import SmithyHTTPAuth
import SmithyHTTPAuthAPI
import ClientRuntime
import class AWSSDKHTTPAuth.AWSSigV4Signer
import struct Foundation.Date
import struct Foundation.TimeInterval

@_spi(AuthTokenGenerator)
public class AuthTokenGenerator {
    public var awsCredentialIdentity: AWSCredentialIdentity

    public init(awsCredentialIdentity: AWSCredentialIdentity) {
        self.awsCredentialIdentity = awsCredentialIdentity
    }

    public init(awsCredentialIdentityResolver: any AWSCredentialIdentityResolver) async  throws {
        self.awsCredentialIdentity = try await awsCredentialIdentityResolver.getIdentity()
    }

    public func generateAuthToken(
        endpoint: String,
        port: Int16,
        region: String,
        username: String,
        expiration: TimeInterval = 900
    ) async throws -> String {
        CommonRuntimeKit.initialize()
        let requestBuilder = HTTPRequestBuilder()
        requestBuilder.withHost(endpoint)
        requestBuilder.withPort(port)

        // Add the Host header and the required query items.
        requestBuilder.withHeader(name: "Host", value: "\(endpoint):\(port)")
        requestBuilder.withQueryItem(URIQueryItem(name: "Action", value: "connect"))
        requestBuilder.withQueryItem(URIQueryItem(name: "DBUser", value: username))

        let signingConfig = AWSSigningConfig(
            credentials: self.awsCredentialIdentity,
            expiration: expiration,
            signedBodyValue: .empty,
            flags: SigningFlags(
                useDoubleURIEncode: true,
                shouldNormalizeURIPath: true,
                omitSessionToken: false
            ),
            date: Date(),
            service: "rds-db",
            region: region,
            signatureType: .requestQueryParams,
            signingAlgorithm: .sigv4
        )

        let signedRequest = await AWSSigV4Signer().sigV4SignedRequest(
            requestBuilder: requestBuilder,
            signingConfig: signingConfig
        )

        guard let presignedURL = signedRequest?.destination.url else {
            throw ClientError.authError("Failed to generate auth token for RDS.")
        }

        // Remove https:// from the presigned URL to get final value for RDS auth token.
        let startIndex = presignedURL.absoluteString.index(presignedURL.absoluteString.startIndex, offsetBy: 8)
        let rdsAuthToken = String(presignedURL.absoluteString[startIndex...])

        return rdsAuthToken
    }
}
