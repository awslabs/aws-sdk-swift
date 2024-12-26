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

/// A utility class with a single utility method that generates IAM authentication token used for connecting to RDS.
@_spi(AuthTokenGenerator)
public class AuthTokenGenerator {
    public var awsCredentialIdentity: AWSCredentialIdentity

    /// The initializer that takes in AWSCredentialIdentity struct to use to generate the IAM authentication token.
    public init(awsCredentialIdentity: AWSCredentialIdentity) {
        self.awsCredentialIdentity = awsCredentialIdentity
    }

    /// The initializer that takes in a specific AWSCredentialIdentityResolver, used to resolve the AWSCredentialIdentity used to generate the IAM authentication token.
    public init(awsCredentialIdentityResolver: any AWSCredentialIdentityResolver) async  throws {
        self.awsCredentialIdentity = try await awsCredentialIdentityResolver.getIdentity()
    }

    /// Updates the AWS credentials used to generate the IAM auth token.
    public func updateCredentials(newAWSCredentialIdentity: AWSCredentialIdentity) {
        self.awsCredentialIdentity = newAWSCredentialIdentity
    }

    /// Updates the AWS credentials used to generate the IAM auth token by resolving credentials from passed in resolver.
    public func updateCredentials(awsCredentialIdentityResolver: any AWSCredentialIdentityResolver) async throws {
        self.awsCredentialIdentity = try await awsCredentialIdentityResolver.getIdentity()
    }

    /// Generates authenetication token using given inputs to the method and credential identity instance variable.
    ///
    /// - Parameters:
    ///   - endpoint: The endpoint of the RDS instance. E.g., `rdsmysql.123456789012.us-west-2.rds.amazonaws.com`
    ///   - port: The port of the RDS instance to connect to. E.g., `3306`
    ///   - region: The region that RDS instance is located in. E.g., `us-west-2`
    ///   - username: The username of the RDS database user. E.g., `admin`
    ///   - expiration: The expiration for the token in seconds. Default is 900 seconds (15 minutes).
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

        // Add the Host header and the required query items for the desired presigned URL.
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
