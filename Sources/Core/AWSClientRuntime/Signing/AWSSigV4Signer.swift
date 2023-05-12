//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

public class AWSSigV4Signer {
    static let logger: SwiftLogger = SwiftLogger(label: "AWSSigV4Signer")

    public static func sigV4SignedURL(
        requestBuilder: SdkHttpRequestBuilder,
        credentialsProvider: CredentialsProviding,
        signingName: Swift.String,
        signingRegion: Swift.String,
        date: ClientRuntime.Date,
        expiration: TimeInterval,
        signingAlgorithm: AWSSigningAlgorithm
    ) async -> ClientRuntime.URL? {
        do {
            let credentials = try await credentialsProvider.getCredentials()
            let flags = SigningFlags(useDoubleURIEncode: true,
                                     shouldNormalizeURIPath: true,
                                     omitSessionToken: false)
            let signedBodyHeader: AWSSignedBodyHeader = .none
            let signedBodyValue: AWSSignedBodyValue = .empty
            let signingConfig = AWSSigningConfig(
                credentials: credentials,
                expiration: expiration,
                signedBodyHeader: signedBodyHeader,
                signedBodyValue: signedBodyValue,
                flags: flags,
                date: date,
                service: signingName,
                region: signingRegion,
                signatureType: .requestQueryParams,
                signingAlgorithm: signingAlgorithm
            )
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

    /// Signs the event payload and returns the signed event with :date and :chunk-signature headers
    /// - Parameters:
    ///   - payload: The event payload to sign
    ///   - previousSignature: The signature of the previous event, this is used to calculate the signature of
    ///                        the current event payload like a rolling signature calculation.
    ///   - signingConfig: The signing configuration
    /// - Returns: The signed event with :date and :chunk-signature headers
    static func signEvent(payload: Data,
                          previousSignature: String,
                          signingConfig: AWSSigningConfig) async throws -> SigningResult<EventStream.Message> {
        let signature = try await Signer.signEvent(event: payload,
                                                   previousSignature: previousSignature,
                                                   config: try signingConfig.toCRTType())
        let binarySignature = signature.hexaData

        let message = EventStream.Message(headers: [ .init(name: ":date",
                                                           value: .timestamp(signingConfig.date)),
                                                     .init(name: ":chunk-signature",
                                                           value: .byteArray(binarySignature))],
                                           payload: payload)

        return SigningResult(output: message, signature: signature)
    }

    public static func sigV4SignedRequest(
        requestBuilder: SdkHttpRequestBuilder,
        signingConfig: AWSSigningConfig
    ) async -> SdkHttpRequest? {
        let originalRequest = requestBuilder.build()
        do {
            let crtUnsignedRequest = try originalRequest.toHttpRequest()

            let crtSignedRequest = try await Signer.signRequest(
                request: crtUnsignedRequest,
                config: signingConfig.toCRTType()
            )
            let sdkSignedRequest = requestBuilder.update(from: crtSignedRequest, originalRequest: originalRequest)
            return sdkSignedRequest.build()
        } catch CommonRunTimeError.crtError(let crtError) {
            logger.error("Failed to sign request (CRT): \(crtError)")
            return nil
        } catch let err {
            logger.error("Failed to sign request: \(err)")
            return nil
        }
    }
}

public struct SigningResult<T> {
    public let output: T
    public let signature: String
}
