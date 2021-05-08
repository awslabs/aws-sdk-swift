/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import AwsCommonRuntimeKit

public struct SigV4Middleware<OperationStackOutput: HttpResponseBinding,
                              OperationStackError: HttpResponseBinding>: Middleware {
    public let id: String = "Sigv4Signer"

    let unsignedBody: Bool

    public init(unsignedBody: Bool) {
        self.unsignedBody = unsignedBody
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
        let credentialsProvider = context.getCredentialsProvider().crtCredentialsProvider

        let credentialsResult = credentialsProvider.getCredentials()

        do {
            let credentials = try credentialsResult.get()
            let signedBodyValue = unsignedBody ? SignedBodyValue.unsignedPayload : SignedBodyValue.empty
            //TODO: this value should be passed in via some config and able to be overrided in code generation
            // via a customization
            let signedBodyHeaderType = SignedBodyHeaderType.contentSha256
            let signingRegion = context.getSigningRegion()
            let signingName = context.getSigningName()
           
            let config = SigningConfig(credentials: credentials,
                                       date: AWSDate(),
                                       service: signingName,
                                       region: signingRegion,
                                       signedBodyHeader: signedBodyHeaderType,
                                       signedBodyValue: signedBodyValue)

            let result = try signer.signRequest(request: crtUnsignedRequest, config: config)
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
