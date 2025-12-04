//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct AwsCommonRuntimeKit.SigningConfig
import enum Smithy.ByteStream
import enum Smithy.ClientError
import class Smithy.Context
import class SmithyChecksums.ChunkedStream
import struct SmithyHTTPAPI.Headers
import class SmithyHTTPAPI.HTTPRequestBuilder

extension HTTPRequestBuilder {

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

    public func setChunkedBody(
        signingConfig: SigningConfig,
        signature: String,
        trailingHeaders: Headers,
        checksumString: String? = nil,
        context: Smithy.Context
    ) throws {
        switch self.body {
        case .stream(let stream):
            let chunkedStream = try ChunkedStream(
                inputStream: stream,
                signingConfig: signingConfig,
                previousSignature: signature,
                trailingHeaders: trailingHeaders,
                checksumString: checksumString,
                context: context
            )
            self.withBody(ByteStream.stream(chunkedStream))
        default:
            throw ClientError.dataNotFound("Cannot set a non-stream body as an aws-chunked body!")
        }
    }
}
