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
    
    public typealias MError = SdkError<OperationStackError>
    
    public func handle<H>(context: HttpContext,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<OperationOutput<OperationStackOutput>, MError>
    where H: Handler,
    Self.Context == H.Context,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.MError == H.MiddlewareError {
        
        let originalRequest = input.build()
        let crtUnsignedRequest = originalRequest.toHttpRequest()
        let signer = SigV4HttpRequestSigner()
        guard let credentialsProvider = context.getCredentialsProvider() else {
            return .failure(.client(ClientError.authError("AwsSigv4Signer requires a credentialsProvider")))
        }
        
        guard let signingName = context.getSigningName() ?? config.signingService else {
            return .failure(.client(ClientError.authError("AwsSigv4Signer requires a signing service")))
        }
        
        guard let signingRegion = context.getSigningRegion(),
              !signingRegion.isEmpty else {
            return .failure(.client(ClientError.authError("AwsSigv4Signer requires a signing region")))
        }
        
        let flags = SigningFlags(useDoubleURIEncode: config.useDoubleURIEncode,
                                 shouldNormalizeURIPath: config.shouldNormalizeURIPath,
                                 omitSessionToken: config.omitSessionToken)
        let signedBodyValue: AWSSignedBodyValue = config.unsignedBody ? .unsignedPayload : .empty
        
        do {
            let credentialsResult = try credentialsProvider.getCredentials()
            let credentials = try credentialsResult.get()
            let signingConfig = AWSSigningConfig(credentials: credentials,
                                                 expiration: config.expiration,
                                                 signedBodyHeader: config.signedBodyHeader,
                                                 signedBodyValue: signedBodyValue,
                                                 flags: flags,
                                                 date: Date(),
                                                 service: signingName,
                                                 region: signingRegion,
                                                 signatureType: config.signatureType)
            
            let result = try signer.signRequest(request: crtUnsignedRequest,
                                                config: signingConfig.toCRTType())
            let crtSignedRequest = try result.get()
            let sdkSignedRequest = input.update(from: crtSignedRequest, originalRequest: originalRequest)
            
            return next.handle(context: context, input: sdkSignedRequest)
        } catch CRTError.crtError(let error) {
            return .failure(.client(ClientError.crtError(CRTError.crtError(error))))
        } catch let err {
            return .failure(.client(ClientError.unknownError(err.localizedDescription)))
        }
    }
}
