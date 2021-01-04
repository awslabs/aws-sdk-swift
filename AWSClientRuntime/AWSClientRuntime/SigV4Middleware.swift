/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import AwsCommonRuntimeKit

struct SigV4Middleware: Middleware {
    var id: String = "Sigv4Signer"
    
    typealias MInput = SdkHttpRequestBuilder
    
    typealias MOutput = SdkHttpRequest
    
    typealias Context = HttpContext
    
    func handle<H>(context: HttpContext, input: SdkHttpRequestBuilder, next: H) -> Result<SdkHttpRequest, Error> where H: Handler, Self.Context == H.Context, Self.MInput == H.Input, Self.MOutput == H.Output {
        let crtRequest = input.build().toHttpRequest()
        let signer = SigV4HttpRequestSigner()
        let credentialsProvider = context.getCredentialsProvider().crtCredentialsProvider
        let service = context.getServiceName()
        let region = context.getSigningRegion()
        let config = SigningConfig(credentialsProvider: credentialsProvider, expiration: 90, date: AWSDate(), service: service, region: region)
        do {
        let signedRequestResult = try signer.signRequest(request: crtRequest, config: config)
            let signedRequest = try signedRequestResult.get()
            let sdkRequest = signedRequest.toSdkRequest()
            return .success(sdkRequest)
        } catch let err {
            return .failure(err)
        }
    }
}
