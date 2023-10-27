//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import struct Foundation.Date

extension HttpContext {
    static let credentialsProvider = AttributeKey<CredentialsProviding>(name: "CredentialsProvider")
    static let region = AttributeKey<String>(name: "Region")
    public static let signingName = AttributeKey<String>(name: "SigningName")
    public static let signingRegion = AttributeKey<String>(name: "SigningRegion")
    public static let signingAlgorithm = AttributeKey<String>(name: "SigningAlgorithm")
    public static let requestSignature = AttributeKey<String>(name: "AWS_HTTP_SIGNATURE")

    func getCredentialsProvider() -> CredentialsProviding? {
        return attributes.get(key: HttpContext.credentialsProvider)
    }

    func getRegion() -> String? {
        return attributes.get(key: Self.region)
    }

    func getSigningName() -> String? {
        return attributes.get(key: Self.signingName)
    }

    func getSigningRegion() -> String? {
        return attributes.get(key: Self.signingRegion)
    }

    func getSigningAlgorithm() -> AWSSigningAlgorithm? {
        guard let algorithmRawValue = attributes.get(key: Self.signingAlgorithm) else {
            return nil
        }
        return AWSSigningAlgorithm(rawValue: algorithmRawValue)
    }

    /// Returns the request signature for the event stream operation
    /// - Returns: `String` request signature
    public func getRequestSignature() -> String {
        return attributes.get(key: Self.requestSignature)!
    }

    /// Returns the signing config for the event stream message
    /// - Returns: `AWSSigningConfig` for the event stream message
    public func makeEventStreamSigningConfig(date: Date = Date().withoutFractionalSeconds())
        async throws -> AWSSigningConfig {
        let credentials = try await getCredentialsProvider()?.getCredentials()
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
        attributes.set(key: HttpContext.messageEncoder, value: messageEncoder)
        attributes.set(key: HttpContext.messageSigner, value: messageSigner)

        // enable the flag
        attributes.set(key: HttpContext.bidirectionalStreaming, value: true)
    }
}

extension HttpContextBuilder {

    @discardableResult
    public func withRegion(value: String?) -> HttpContextBuilder {
        self.attributes.set(key: HttpContext.region, value: value)
        return self
    }

    @discardableResult
    public func withCredentialsProvider(value: CredentialsProviding) -> HttpContextBuilder {
        self.attributes.set(key: HttpContext.credentialsProvider, value: value)
        return self
    }

    @discardableResult
    public func withSigningName(value: String) -> HttpContextBuilder {
        self.attributes.set(key: HttpContext.signingName, value: value)
        return self
    }

    @discardableResult
    public func withSigningRegion(value: String?) -> HttpContextBuilder {
        self.attributes.set(key: HttpContext.signingRegion, value: value)
        return self
    }

    @discardableResult
    public func withSigningAlgorithm(value: AWSSigningAlgorithm?) -> HttpContextBuilder {
        self.attributes.set(key: HttpContext.signingAlgorithm, value: value?.rawValue)
        return self
    }

    /// Sets the request signature for the event stream operation
    /// - Parameter value: `String` request signature
    @discardableResult
    public func withRequestSignature(value: String) -> HttpContextBuilder {
        self.attributes.set(key: HttpContext.requestSignature, value: value)
        return self
    }
}
