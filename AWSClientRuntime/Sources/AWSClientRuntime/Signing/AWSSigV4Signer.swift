//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import AwsCommonRuntimeKit

public class AWSSigV4Signer {
    static let logger: SwiftLogger = SwiftLogger(label: "AWSSigV4Signer")
    
    public static func sigV4SignedURL(requestBuilder: SdkHttpRequestBuilder,
                                      credentialsProvider: CredentialsProvider,
                                      signingName: Swift.String,
                                      signingRegion: Swift.String,
                                      date: ClientRuntime.Date,
                                      expiration: Int64) async -> ClientRuntime.URL? {
        do {
            let credentials = try await credentialsProvider.getCredentials()
            let flags = SigningFlags(useDoubleURIEncode: true,
                                     shouldNormalizeURIPath: true,
                                     omitSessionToken: false)
            let signedBodyHeader: AWSSignedBodyHeader = .none
            let signedBodyValue: AWSSignedBodyValue = .empty
            let signingConfig = AWSSigningConfig(credentials: credentials,
                                                 expiration: expiration,
                                                 signedBodyHeader: signedBodyHeader,
                                                 signedBodyValue: signedBodyValue,
                                                 flags: flags,
                                                 date: date,
                                                 service: signingName,
                                                 region: signingRegion,
                                                 signatureType: .requestQueryParams)
            let builtRequest = await sigV4SignedRequest(requestBuilder: requestBuilder, signingConfig: signingConfig)
            guard let presignedURL = builtRequest?.endpoint.url else {
                logger.error("Failed to generate presigend url")
                return nil
            }
            return presignedURL
        } catch let err {
            logger.error("Failed to generate presigned url: \(err)")
            return nil
        }
    }
    
    public static func sigV4SignedRequest(requestBuilder: SdkHttpRequestBuilder,
                                          signingConfig: AWSSigningConfig) async -> SdkHttpRequest? {
        let originalRequest = requestBuilder.build()
        let crtUnsignedRequest = originalRequest.toHttpRequest()
        let signer = SigV4HttpRequestSigner()
        do {
            let crtSignedRequest = try await signer.signRequest(request: crtUnsignedRequest,
                                                                config: signingConfig.toCRTType())
            let sdkSignedRequest = requestBuilder.update(from: crtSignedRequest, originalRequest: originalRequest)
            return sdkSignedRequest.build()
        } catch CRTError.crtError(let crtError) {
            logger.error("Failed to sign request (CRT): \(crtError)")
            return nil
        } catch let err {
            logger.error("Failed to sign request: \(err)")
            return nil
        }
    }
}
