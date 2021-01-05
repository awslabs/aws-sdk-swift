/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import AwsCommonRuntimeKit

struct SigV4Middleware: Middleware {
    var id: String = "Sigv4Signer"
    
    let signingName: String
    
    let unsignedBody: Bool
    
    let siginingRegion: String
    
    public init(signingName: String, signingRegion: String, unsignedBody: Bool) {
        self.signingName = signingName
        self.siginingRegion = signingRegion
        self.unsignedBody = unsignedBody
    }
    
    typealias MInput = SdkHttpRequestBuilder
    
    typealias MOutput = SdkHttpRequest
    
    typealias Context = HttpContext
    
    func handle<H>(context: HttpContext, input: SdkHttpRequestBuilder, next: H) -> Result<SdkHttpRequest, Error> where H: Handler, Self.Context == H.Context, Self.MInput == H.Input, Self.MOutput == H.Output {
        let crtRequest = input.build().toHttpRequest()
        let signer = SigV4HttpRequestSigner()
        let credentialsProvider = context.getCredentialsProvider().crtCredentialsProvider
        let signedBodyValue = unsignedBody ? SignedBodyValue.unsignedPayload : SignedBodyValue.empty
        let config = SigningConfig(credentialsProvider: credentialsProvider,
                                   expiration: 90,
                                   date: AWSDate(),
                                   service: signingName,
                                   region: siginingRegion,
                                   signedBodyValue: signedBodyValue)
        do {
        let signedRequestResult = try signer.signRequest(request: crtRequest, config: config)
            let signedRequest = try signedRequestResult.get()
            let sdkRequest = input.update(from: signedRequest)
            
            return next.handle(context: context, input: sdkRequest)
        } catch let err {
            return .failure(err)
        }
    }
}
