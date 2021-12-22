/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import AwsCommonRuntimeKit

public struct SigV4Middleware<OperationStackOutput: HttpResponseBinding,
                              OperationStackError: HttpResponseBinding>: Middleware {
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
        let crtUnsignedRequest = originalRequest.toHttpRequest()
        let signer = SigV4HttpRequestSigner()
        guard let credentialsProvider = context.getCredentialsProvider() else {
            throw SdkError<OperationStackError>.client(
                ClientError.authError("AwsSigv4Signer requires a credentialsProvider"))
        }
        
        guard let signingName = context.getSigningName() ?? config.signingService else {
            throw SdkError<OperationStackError>.client(
                ClientError.authError("AwsSigv4Signer requires a signing service"))
        }
        
        guard let signingRegion = context.getSigningRegion(),
              !signingRegion.isEmpty else {
            throw SdkError<OperationStackError>.client(
                ClientError.authError("AwsSigv4Signer requires a signing region"))
        }
        
        let flags = SigningFlags(useDoubleURIEncode: config.useDoubleURIEncode,
                                 shouldNormalizeURIPath: config.shouldNormalizeURIPath,
                                 omitSessionToken: config.omitSessionToken)
        let signedBodyValue: AWSSignedBodyValue = config.unsignedBody ? .unsignedPayload : .empty
        
        let credentials = try await credentialsProvider.getCredentials()
        let signingConfig = AWSSigningConfig(credentials: credentials,
                                             expiration: config.expiration,
                                             signedBodyHeader: config.signedBodyHeader,
                                             signedBodyValue: signedBodyValue,
                                             flags: flags,
                                             date: Date(),
                                             service: signingName,
                                             region: signingRegion,
                                             signatureType: config.signatureType)
        
        let crtSignedRequest = try await signer.signRequest(request: crtUnsignedRequest,
                                            config: signingConfig.toCRTType())
        let sdkSignedRequest = input.update(from: crtSignedRequest, originalRequest: originalRequest)
        
        return try await next.handle(context: context, input: sdkSignedRequest)
    }
}
