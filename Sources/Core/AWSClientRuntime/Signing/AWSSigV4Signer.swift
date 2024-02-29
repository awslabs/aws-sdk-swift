//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

public class AWSSigV4Signer: ClientRuntime.Signer {
    public func signRequest<IdentityT: Identity>(
        requestBuilder: SdkHttpRequestBuilder,
        identity: IdentityT,
        signingProperties: ClientRuntime.Attributes
    ) async throws -> SdkHttpRequestBuilder {
        guard let isBidirectionalStreamingEnabled = signingProperties.get(
            key: AttributeKeys.bidirectionalStreaming
        ) else {
            throw ClientError.authError(
                "Signing properties passed to the AWSSigV4Signer must contain T/F flag for bidirectional streaming."
            )
        }

        guard let identity = identity as? AWSCredentialIdentity else {
            throw ClientError.authError(
                "Identity passed to the AWSSigV4Signer must be of type Credentials."
            )
        }

        var signingConfig = try constructSigningConfig(identity: identity, signingProperties: signingProperties)

        // Used to fix signingConfig.date for testing signRequest().
        if let date = signingProperties.get(key: AttributeKey<Date>(name: "SigV4AuthSchemeTests")) {
            signingConfig = fixDateForTests(signingConfig, date)
        }

        let unsignedRequest = requestBuilder.build()
        let crtUnsignedRequest: HTTPRequestBase = isBidirectionalStreamingEnabled ?
            try unsignedRequest.toHttp2Request() :
            try unsignedRequest.toHttpRequest()

        let crtSigningConfig = try signingConfig.toCRTType()

        let crtSignedRequest = try await Signer.signRequest(
            request: crtUnsignedRequest,
            config: crtSigningConfig
        )

        let sdkSignedRequest = requestBuilder.update(from: crtSignedRequest, originalRequest: unsignedRequest)

        if crtSigningConfig.useAwsChunkedEncoding {
            guard let requestSignature = crtSignedRequest.signature else {
                throw ClientError.dataNotFound("Could not get request signature!")
            }

            // Set streaming body to an AwsChunked wrapped type
            try sdkSignedRequest.setAwsChunkedBody(
                signingConfig: crtSigningConfig,
                signature: requestSignature,
                trailingHeaders: unsignedRequest.trailingHeaders,
                checksumAlgorithm: signingProperties.get(key: AttributeKeys.checksum)
            )
        }

        // Return signed request
        return sdkSignedRequest
    }

    private func constructSigningConfig(
        identity: AWSCredentialIdentity,
        signingProperties: ClientRuntime.Attributes
    ) throws -> AWSSigningConfig {
        guard let unsignedBody = signingProperties.get(key: AttributeKeys.unsignedBody) else {
            throw ClientError.authError(
                "Signing properties passed to the AWSSigV4Signer must contain T/F flag for unsigned body."
            )
        }
        guard let signingName = signingProperties.get(key: AttributeKeys.signingName) else {
            throw ClientError.authError(
                "Signing properties passed to the AWSSigV4Signer must contain signing name."
            )
        }
        guard let signingRegion = signingProperties.get(key: AttributeKeys.signingRegion) else {
            throw ClientError.authError(
                "Signing properties passed to the AWSSigV4Signer must contain signing region."
            )
        }
        guard let signingAlgorithm = signingProperties.get(key: AttributeKeys.signingAlgorithm) else {
            throw ClientError.authError(
                "Signing properties passed to the AWSSigV4Signer must contain signing algorithm."
            )
        }

        let expiration: TimeInterval = signingProperties.get(key: AttributeKeys.expiration) ?? 0
        let signedBodyHeader: AWSSignedBodyHeader = signingProperties.get(key: AttributeKeys.signedBodyHeader) ?? .none

        // Determine signed body value
        let checksum = signingProperties.get(key: AttributeKeys.checksum)
        let isChunkedEligibleStream = signingProperties.get(key: AttributeKeys.isChunkedEligibleStream) ?? false

        let signedBodyValue: AWSSignedBodyValue = determineSignedBodyValue(
            checksum: checksum,
            isChunkedEligbleStream: isChunkedEligibleStream,
            isUnsignedBody: unsignedBody
        )

        let flags: SigningFlags = SigningFlags(
            useDoubleURIEncode: signingProperties.get(key: AttributeKeys.useDoubleURIEncode) ?? true,
            shouldNormalizeURIPath: signingProperties.get(key: AttributeKeys.shouldNormalizeURIPath) ?? true,
            omitSessionToken: signingProperties.get(key: AttributeKeys.omitSessionToken) ?? false
        )
        let signatureType: AWSSignatureType = signingProperties.get(key: AttributeKeys.signatureType) ?? .requestHeaders

        return AWSSigningConfig(
            credentials: identity,
            expiration: expiration,
            signedBodyHeader: signedBodyHeader,
            signedBodyValue: signedBodyValue,
            flags: flags,
            date: Date(),
            service: signingName,
            region: signingRegion,
            signatureType: signatureType,
            signingAlgorithm: signingAlgorithm
        )
    }

    public func signEvent(
        payload: Data,
        previousSignature: String,
        signingProperties: Attributes
    ) async throws -> SigningResult<EventStream.Message> {
        let signingConfig = signingProperties.get(key: AWSEventStream.AWSMessageSigner.signingConfigKey)
        guard let signingConfig else {
            throw ClientError.dataNotFound("Failed to sign event stream message due to missing signing config.")
        }
        return try await signEvent(payload: payload, previousSignature: previousSignature, signingConfig: signingConfig)
    }

    static let logger: SwiftLogger = SwiftLogger(label: "AWSSigV4Signer")

    public static func sigV4SignedURL(
        requestBuilder: SdkHttpRequestBuilder,
        awsCredentialIdentityResolver: any AWSCredentialIdentityResolver,
        signingName: Swift.String,
        signingRegion: Swift.String,
        date: ClientRuntime.Date,
        expiration: TimeInterval,
        signingAlgorithm: AWSSigningAlgorithm
    ) async -> ClientRuntime.URL? {
        do {
            let credentials = try await awsCredentialIdentityResolver.getIdentity(
                identityProperties: Attributes()
            )
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
    public func signEvent(payload: Data,
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

    private func fixDateForTests(_ signingConfig: AWSSigningConfig, _ fixedDate: Date) -> AWSSigningConfig {
        return AWSSigningConfig(
            credentials: signingConfig.credentials,
            expiration: signingConfig.expiration,
            signedBodyHeader: signingConfig.signedBodyHeader,
            signedBodyValue: signingConfig.signedBodyValue,
            flags: signingConfig.flags,
            date: fixedDate,
            service: signingConfig.service,
            region: signingConfig.region,
            signatureType: signingConfig.signatureType,
            signingAlgorithm: signingConfig.signingAlgorithm
        )
    }

    private func determineSignedBodyValue(
        checksum: ChecksumAlgorithm?,
        isChunkedEligbleStream: Bool,
        isUnsignedBody: Bool
    ) -> AWSSignedBodyValue {
        if !isChunkedEligbleStream {
            // Normal Payloads, Event Streams, etc.
            return isUnsignedBody ? .unsignedPayload : .empty
        }

        // streaming + eligible for chunked transfer
        if checksum == nil {
            return isUnsignedBody ? .unsignedPayload : .streamingSha256Payload
        } else {
            // checksum is present
            return isUnsignedBody ? .streamingUnsignedPayloadTrailer : .streamingSha256PayloadTrailer
        }
    }
}
