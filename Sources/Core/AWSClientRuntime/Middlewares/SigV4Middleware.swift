/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import AwsCommonRuntimeKit

public struct SigV4Middleware<OperationStackOutput>: Middleware {
    public let id: String = "Sigv4Signer"

    let config: SigV4Config

    public init(config: SigV4Config) {
        self.config = config
    }

    public typealias MInput = SdkHttpRequestBuilder

    public typealias MOutput = OperationOutput<OperationStackOutput>

    public typealias Context = HttpContext

    public func handle<H>(context: HttpContext,
                          input: SdkHttpRequestBuilder,
                          next: H) async throws -> OperationOutput<OperationStackOutput>
    where H: Handler,
    Self.Context == H.Context,
    Self.MInput == H.Input,
    Self.MOutput == H.Output {

        let originalRequest = input.build()
        let crtUnsignedRequest: HTTPRequestBase
        if context.isBidirectionalStreamingEnabled() {
            crtUnsignedRequest = try originalRequest.toHttp2Request()
        } else {
            crtUnsignedRequest = try originalRequest.toHttpRequest()
        }

        guard let credentialsProvider = context.getCredentialsProvider() else {
            throw ClientError.authError("AwsSigv4Signer requires a credentialsProvider")
        }

        guard let signingName = context.getSigningName() ?? config.signingService else {
            throw ClientError.authError("AwsSigv4Signer requires a signing service")
        }

        guard let signingRegion = context.getSigningRegion(),
              !signingRegion.isEmpty else {
            throw ClientError.authError("AwsSigv4Signer requires a signing region")
        }

        // If the context has a signing algorithm, use that. Otherwise, use the operation config's signing algorithm
        let signingAlgorithm = context.getSigningAlgorithm() ?? config.signingAlgorithm

        let flags = SigningFlags(useDoubleURIEncode: config.useDoubleURIEncode,
                                 shouldNormalizeURIPath: config.shouldNormalizeURIPath,
                                 omitSessionToken: config.omitSessionToken)
        let signedBodyValue: AWSSignedBodyValue = config.unsignedBody ? .unsignedPayload : .empty

        let credentials = try await credentialsProvider.getCredentials()
        let signingConfig = AWSSigningConfig(
            credentials: credentials,
            expiration: config.expiration,
            signedBodyHeader: config.signedBodyHeader,
            signedBodyValue: signedBodyValue,
            flags: flags,
            date: Date(),
            service: signingName,
            region: signingRegion,
            signatureType: config.signatureType,
            signingAlgorithm: signingAlgorithm
        )

        let crtSignedRequest = try await Signer.signRequest(
            request: crtUnsignedRequest,
            config: signingConfig.toCRTType()
        )

        context.attributes.set(key: HttpContext.requestSignature, value: crtSignedRequest.signature)

        let sdkSignedRequest = input.update(from: crtSignedRequest, originalRequest: originalRequest)

        return try await next.handle(context: context, input: sdkSignedRequest)
    }
}
