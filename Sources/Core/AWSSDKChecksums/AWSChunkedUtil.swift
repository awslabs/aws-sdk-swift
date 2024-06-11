//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.Attributes
import struct Smithy.AttributeKey
import enum Smithy.ByteStream
import enum Smithy.ClientError
import struct SmithyHTTPAPI.Headers
import class SmithyHTTPAPI.SdkHttpRequestBuilder
import enum SmithyChecksumsAPI.ChecksumAlgorithm

import AwsCommonRuntimeKit

extension SigningConfig {
    public var useAwsChunkedEncoding: Bool {
        switch self.signedBodyValue {
        case .streamingSha256Payload, .streamingSha256PayloadTrailer, .streamingUnSignedPayloadTrailer:
            return true
        default:
            return false
        }
    }
}

extension SdkHttpRequestBuilder {
    public func setAwsChunkedHeaders() throws {

        // Check if self.body is of the case ByteStream.stream(let stream)
        if case .stream(let stream) = self.body {
            // Set the common headers for AWS-chunked encoding
            self.withHeader(name: "Content-Encoding", value: "aws-chunked")
            self.withHeader(name: "Transfer-Encoding", value: "chunked")
            guard let decodedContentLength = stream.length else {
                throw ClientError.dataNotFound("Cannot use aws-chunked encoding with an unknown stream length!")
            }
            self.withHeader(name: "X-Amz-Decoded-Content-Length", value: String(decodedContentLength))
        } else {
            throw ClientError.dataNotFound("aws-chunked encoding requires a streaming payload!")
        }
    }

    public func setAwsChunkedBody(
        signingConfig: SigningConfig,
        signature: String,
        trailingHeaders: Headers,
        checksumString: String? = nil
    ) throws {
        switch self.body {
        case .stream(let stream):

            let chunkedStream = try AWSChunkedStream(
                inputStream: stream,
                signingConfig: signingConfig,
                previousSignature: signature,
                trailingHeaders: trailingHeaders,
                checksumString: checksumString
            )
            self.withBody(ByteStream.stream(chunkedStream))
        default:
            throw ClientError.dataNotFound("Cannot set a non-stream body as an aws-chunked body!")
        }
    }
}

extension SigningConfig {

    func toChunkSigningConfig() -> SigningConfig {
        let modifiedSignatureType = SignatureType.requestChunk
        let modifiedBodyType = SignedBodyValue.empty
        return SigningConfig(
            algorithm: self.algorithm,
            signatureType: modifiedSignatureType,
            service: self.service,
            region: self.region,
            date: self.date,
            credentials: self.credentials,
            credentialsProvider: self.credentialsProvider,
            expiration: self.expiration,
            signedBodyHeader: self.signedBodyHeader,
            signedBodyValue: modifiedBodyType,
            shouldSignHeader: self.shouldSignHeader,
            useDoubleURIEncode: self.useDoubleURIEncode,
            shouldNormalizeURIPath: self.shouldNormalizeURIPath,
            omitSessionToken: self.omitSessionToken
        )
    }

    func toTrailingHeadersSigningConfig() -> SigningConfig {
        let modifiedSignatureType = SignatureType.requestTrailingHeaders
        let modifiedBodyType = SignedBodyValue.empty
        return SigningConfig(
            algorithm: self.algorithm,
            signatureType: modifiedSignatureType,
            service: self.service,
            region: self.region,
            date: self.date,
            credentials: self.credentials,
            credentialsProvider: self.credentialsProvider,
            expiration: self.expiration,
            signedBodyHeader: self.signedBodyHeader,
            signedBodyValue: modifiedBodyType,
            shouldSignHeader: self.shouldSignHeader,
            useDoubleURIEncode: self.useDoubleURIEncode,
            shouldNormalizeURIPath: self.shouldNormalizeURIPath,
            omitSessionToken: self.omitSessionToken
        )
    }

    var isUnsigned: Bool {
        return signedBodyValue == .streamingUnSignedPayloadTrailer
    }
}

extension Int {
    var hexString: String {
        return String(self, radix: 16)
    }
}
