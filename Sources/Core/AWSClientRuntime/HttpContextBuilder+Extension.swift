//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

extension HttpContext {
    static let credentialsProvider = AttributeKey<CredentialsProvider>(name: "CredentialsProvider")
    static let region = AttributeKey<String>(name: "Region")
    public static let signingName = AttributeKey<String>(name: "SigningName")
    public static let signingRegion = AttributeKey<String>(name: "SigningRegion")
    public static let signingAlgorithm = AttributeKey<String>(name: "SigningAlgorithm")

    func getCredentialsProvider() -> CredentialsProvider? {
        return attributes.get(key: HttpContext.credentialsProvider)
    }

    func getRegion() -> String? {
        return attributes.get(key: HttpContext.region)
    }

    func getSigningName() -> String? {
        return attributes.get(key: HttpContext.signingName)
    }

    func getSigningRegion() -> String? {
        return attributes.get(key: HttpContext.signingRegion)
    }

    func getSigningAlgorithm() -> AWSSigningAlgorithm? {
        guard let algorithmRawValue = attributes.get(key: HttpContext.signingAlgorithm) else {
            return nil
        }
        return AWSSigningAlgorithm(rawValue: algorithmRawValue)
    }

    /// Returns the request signature for the event stream operation
    /// - Returns: `String` request signature
    func getRequestSignature() -> String? {
        return attributes.get(key: AttributeKey<String>(name: "AWS_HTTP_SIGNATURE"))
    }

    /// Returns the signing config for the event stream message
    /// - Returns: `AWSSigningConfig` for the event stream message
    func makeEventStreamSigningConfig(date: Date = Date().withoutFractionalSeconds()) async throws -> AWSSigningConfig {
        let credentials = try await getCredentialsProvider()?.getCredentials()
        guard let service = getSigningName() else {
            fatalError("""
                Signing name must not be nil,
                it must be set by the middleware during the request
            """)
        }

        guard let region = getSigningRegion() ?? getRegion() else {
            fatalError("""
                Signing region must not be nil,
                it must be set by the middleware during the request
            """)
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
}

extension HttpContextBuilder {

    @discardableResult
    public func withRegion(value: String?) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<String>(name: "Region"), value: value)
        return self
    }

    @discardableResult
    public func withCredentialsProvider(value: CredentialsProvider) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<CredentialsProvider>(name: "CredentialsProvider"), value: value)
        return self
    }

    @discardableResult
    public func withSigningName(value: String) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<String>(name: "SigningName"), value: value)
        return self
    }

    @discardableResult
    public func withSigningRegion(value: String?) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<String>(name: "SigningRegion"), value: value)
        return self
    }

    @discardableResult
    public func withSigningAlgorithm(value: AWSSigningAlgorithm?) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<String>(name: "SigningAlgorithm"), value: value?.rawValue)
        return self
    }

    /// Sets the request signature for the event stream operation
    /// - Parameter value: `String` request signature
    @discardableResult
    public func withRequestSignature(value: String) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<String>(name: "AWS_HTTP_SIGNATURE"), value: value)
        return self
    }
}
