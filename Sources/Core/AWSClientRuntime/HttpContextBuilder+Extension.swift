//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import struct Foundation.Date
import struct Foundation.TimeInterval

extension HttpContext {
    func getCredentialsProvider() -> (any CredentialsProviding)? {
        return attributes.get(key: AttributeKeys.credentialsProvider)
    }

    func getRegion() -> String? {
        return attributes.get(key: AttributeKeys.region)
    }

    func getRequestSignature() -> String {
        return attributes.get(key: AttributeKeys.requestSignature)!
    }

    func getSigningAlgorithm() -> AWSSigningAlgorithm? {
        return attributes.get(key: AttributeKeys.signingAlgorithm)
    }

    func getSigningName() -> String? {
        return attributes.get(key: AttributeKeys.signingName)
    }

    func getSigningRegion() -> String? {
        return attributes.get(key: AttributeKeys.signingRegion)
    }

    /// Returns the signing config for the event stream message
    /// - Returns: `AWSSigningConfig` for the event stream message
    public func makeEventStreamSigningConfig(date: Date = Date().withoutFractionalSeconds())
        async throws -> AWSSigningConfig {
        let credentials = try await getCredentialsProvider()?.getIdentity(identityProperties: Attributes())
        guard let service = getSigningName() else {
            fatalError("Signing name must not be nil, it must be set by the middleware during the request")
        }

        guard let region = getSigningRegion() ?? getRegion() else {
            fatalError("Signing region must not be nil, it must be set by the middleware during the request")
        }

        // default flags
        let flags = SigningFlags(useDoubleURIEncode: false,
                                 shouldNormalizeURIPath: false,
                                 omitSessionToken: false)

        return AWSSigningConfig(credentials: credentials,
                                signedBodyValue: .empty, // there is no body, only payload needs to be signed
                                flags: flags,
                                date: date,
                                service: service,
                                region: region,
                                signatureType: .requestEvent,
                                signingAlgorithm: .sigv4)
    }

    /// Setups context with encoder, decoder and signer for bidirectional streaming
    /// and sets the bidirectional streaming flag
    public func setupBidirectionalStreaming() throws {
        // setup client to server
        let messageEncoder = AWSClientRuntime.AWSEventStream.AWSMessageEncoder()
        let messageSigner = AWSClientRuntime.AWSEventStream.AWSMessageSigner(encoder: messageEncoder) {
            try await self.makeEventStreamSigningConfig()
        } requestSignature: {
            self.getRequestSignature()
        }
        attributes.set(key: AttributeKeys.messageEncoder, value: messageEncoder)
        attributes.set(key: AttributeKeys.messageSigner, value: messageSigner)

        // enable the flag
        attributes.set(key: AttributeKeys.bidirectionalStreaming, value: true)
    }
}

extension HttpContextBuilder {
    @discardableResult
    public func withCredentialsProvider(value: any CredentialsProviding) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKeys.credentialsProvider, value: value)
        return self
    }

    @discardableResult
    public func withRegion(value: String?) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKeys.region, value: value)
        return self
    }

    /// Sets the request signature for the event stream operation
    /// - Parameter value: `String` request signature
    @discardableResult
    public func withRequestSignature(value: String) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKeys.requestSignature, value: value)
        return self
    }

    @discardableResult
    public func withSigningAlgorithm(value: AWSSigningAlgorithm) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKeys.signingAlgorithm, value: value)
        return self
    }

    @discardableResult
    public func withSigningName(value: String) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKeys.signingName, value: value)
        return self
    }

    @discardableResult
    public func withSigningRegion(value: String?) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKeys.signingRegion, value: value)
        return self
    }
}

extension AttributeKeys {
    public static let credentialsProvider = AttributeKey<(any CredentialsProviding)>(name: "CredentialsProvider")
    public static let region = AttributeKey<String>(name: "Region")
    public static let signingAlgorithm = AttributeKey<AWSSigningAlgorithm>(name: "SigningAlgorithm")
    public static let requestSignature = AttributeKey<String>(name: "AWS_HTTP_SIGNATURE")

    // Keys used to store/retrieve AWSSigningConfig fields in/from signingProperties passed to AWSSigV4Signer
    public static let unsignedBody = AttributeKey<Bool>(name: "UnsignedBody")
    public static let expiration = AttributeKey<TimeInterval>(name: "Expiration")
    public static let signedBodyHeader = AttributeKey<AWSSignedBodyHeader>(name: "SignedBodyHeader")
    public static let useDoubleURIEncode = AttributeKey<Bool>(name: "UseDoubleURIEncode")
    public static let shouldNormalizeURIPath = AttributeKey<Bool>(name: "ShouldNormalizeURIPath")
    public static let omitSessionToken = AttributeKey<Bool>(name: "OmitSessionToken")
    public static let signatureType = AttributeKey<AWSSignatureType>(name: "SignatureType")
}
