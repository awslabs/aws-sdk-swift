/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime
import AwsCommonRuntimeKit

public struct SigV4Middleware: Middleware {
    public var id: String = "Sigv4Signer"

    let signingName: String

    let unsignedBody: Bool

    let signingRegion: String

    public init(signingName: String, signingRegion: String, unsignedBody: Bool) {
        self.signingName = signingName
        self.signingRegion = signingRegion
        self.unsignedBody = unsignedBody
    }

    public typealias MInput = SdkHttpRequestBuilder

    public typealias MOutput = SdkHttpRequest

    public typealias Context = HttpContext

    public func handle<H>(context: HttpContext,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<SdkHttpRequest, Error> where H: Handler,
                                                                          Self.Context == H.Context,
                                                                          Self.MInput == H.Input,
                                                                          Self.MOutput == H.Output {
        let crtRequest = input.build().toHttpRequest()
        let signer = SigV4HttpRequestSigner()
        let credentialsProvider = context.getCredentialsProvider().crtCredentialsProvider

        let credentialsResult = credentialsProvider.getCredentials()
        do {
            let credentials = try credentialsResult.get()
            let signedBodyValue = unsignedBody ? SignedBodyValue.unsignedPayload : SignedBodyValue.empty
            let config = SigningConfig(credentials: credentials,
                                       date: AWSDate(),
                                       service: signingName,
                                       region: signingRegion,
                                       signedBodyValue: signedBodyValue)

            let signedRequestResult = try signer.signRequest(request: crtRequest, config: config)
            let signedRequest = try signedRequestResult.get()
            let sdkRequest = input.update(from: signedRequest)

            return next.handle(context: context, input: sdkRequest)
        } catch CRTError.crtError(let error) {
            return .failure(CRTError.crtError(error))
        } catch let err {
            return .failure(err)
        }
    }
}
