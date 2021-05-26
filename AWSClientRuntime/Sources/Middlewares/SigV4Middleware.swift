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

    public typealias MOutput = OperationOutput<OperationStackOutput, OperationStackError>

    public typealias Context = HttpContext

    public func handle<H>(context: HttpContext,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<OperationOutput<OperationStackOutput, OperationStackError>, Error>
    where H: Handler,
          Self.Context == H.Context,
          Self.MInput == H.Input,
          Self.MOutput == H.Output {
        
        let originalRequest = input.build()
        let crtUnsignedRequest = originalRequest.toHttpRequest()
        let signer = SigV4HttpRequestSigner()
        guard let credentialsProvider = context.getCredentialsProvider() else {
            return .failure(ClientError.authError("AwsSigv4Signer requires a credentialsProvider"))
        }

        do {
            let credentials = try credentialsProvider.getCredentials()
            let signedBodyValue: AWSSignedBodyValue = config.unsignedBody ? .unsignedPayload : .empty
            let signingRegion = context.getSigningRegion()
            
            guard let signingName = context.getSigningName() ?? config.signingService else {
                return .failure(ClientError.authError("AwsSigv4Signer requires a signing service"))
                
            }
            
            let flags = SigningFlags(useDoubleURIEncode: config.useDoubleURIEncode,
                                     shouldNormalizeURIPath: config.shouldNormalizeURIPath,
                                     omitSessionToken: config.omitSessionToken)
            
            let signingConfig = AWSSigningConfig(credentials: credentials,
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
            return .failure(CRTError.crtError(error))
        } catch let err {
            return .failure(err)
        }
    }
}
