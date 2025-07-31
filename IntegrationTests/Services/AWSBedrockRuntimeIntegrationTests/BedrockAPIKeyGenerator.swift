//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct AwsCommonRuntimeKit.CommonRuntimeKit
import struct Foundation.TimeInterval
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import protocol SmithyIdentityAPI.IdentityResolver
import class AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain
import class SmithyHTTPAPI.HTTPRequestBuilder
import struct SmithyHTTPAPI.Headers
import struct Smithy.URIQueryItem
import struct Smithy.Attributes
import enum SmithyHTTPAuthAPI.SigningPropertyKeys
import class SmithyHTTPAuth.SigV4Signer
import InternalAWSSTS

/// Generates API keys for use with Bedrock services.
///
/// Token signing region and duration are configurable.
///
/// Token creation requires that valid AWS credentials are sourced by the generator.  An AWS credential resolver may be
/// provided if desired, if none is provided, the AWS SDK for Swift's default credential chain is used.
///
/// Created tokens have the same permissions as the AWS credentials they were created from.
///
/// Based on the Python implementation in: https://github.com/aws/aws-bedrock-token-generator-python
struct BedrockAPIKeyGenerator {
    let tokenPrefix = "bedrock-api-key-"
    let signingName = "bedrock"
    let host = "bedrock.amazonaws.com"

    let region: String
    let duration: TimeInterval
    let awsCredentialIdentityResolver: any AWSCredentialIdentityResolver

    /// Creates a generator for Bedrock API Keys.
    /// - Parameters:
    ///   - region: The AWS region to use for signing the Bedrock API Key.  Must be a valid AWS region, i.e. `us-east-1`.
    ///   - duration: The time, in seconds from token creation, that the Bedrock API Key should remain valid.  Defaults to 12 hrs.
    ///   - awsCredentialIdentityResolver: The AWS credential identity resolver to use when resolving the AWS credentials
    ///   that are used to sign the key.  Defaults to the AWS SDK for Swift's default identity resolver chain.
    init(
        region: String,
        duration: TimeInterval = 43200.0,  // 12 hrs
        awsCredentialIdentityResolver: any AWSCredentialIdentityResolver =
            DefaultAWSCredentialIdentityResolverChain()
    ) {
        self.region = region
        self.duration = duration
        self.awsCredentialIdentityResolver = awsCredentialIdentityResolver
    }
    
    /// Resolves AWS credentials, then uses those to create a new Bedrock API Key.
    ///
    /// The Bedrock API Key will be configured with the signing region & duration that were configured at
    /// token generator creation.
    /// - Returns: A `String` bearer token suitable for use with AWS Bedrock.
    func generate() async throws -> String {

        // Create a request builder to be signed as a presigned URL in the form:
        // POST https://bedrock.amazonaws.com/?Action=CallWithBearerToken
        // host header is set because it is required to be included in signature when presigning a URL
        let inputBuilder = HTTPRequestBuilder()
            .withMethod(.post)
            .withHost(host)
            .withHeaders(Headers(["host": host]))
            .withQueryItem(URIQueryItem(name: "Action", value: "CallWithBearerToken"))

        // Create signing properties for presigning a URL
        var signingProperties = Attributes()
        signingProperties.set(key: SigningPropertyKeys.bidirectionalStreaming, value: false)
        signingProperties.set(key: SigningPropertyKeys.unsignedBody, value: false)
        signingProperties.set(key: SigningPropertyKeys.signingName, value: signingName)
        signingProperties.set(key: SigningPropertyKeys.signingRegion, value: region)
        signingProperties.set(key: SigningPropertyKeys.signingAlgorithm, value: .sigv4)
        signingProperties.set(key: SigningPropertyKeys.signatureType, value: .requestQueryParams)
        signingProperties.set(key: SigningPropertyKeys.expiration, value: duration)

        // Resolve the AWS credentials to be used for presigning
        let awsCredentialIdentity = try await awsCredentialIdentityResolver
            .getIdentity(identityProperties: Attributes())

        // Perform the URL presigning, a new request builder is returned with signature applied
        CommonRuntimeKit.initialize()
        let signedRequestBuilder = try await SigV4Signer().signRequest(
            requestBuilder: inputBuilder,
            identity: awsCredentialIdentity,
            signingProperties: signingProperties
        )

        // Create a presigned URL
        let signedRequest = signedRequestBuilder.build()
        let url = signedRequest.endpoint.uri.url!

        // Strip https:// from the front of the URL & add the query param `&Version=1` to the end
        // This results in the raw token string.
        let tokenString = url.absoluteString.removePrefix("https://") + "&Version=1"

        // Base-64 encode the raw token string and then add the `bedrock-api-key-` prefix to it.
        // This results in a complete Bedrock API token.
        return try tokenPrefix + tokenString.base64EncodedString()
    }
}
