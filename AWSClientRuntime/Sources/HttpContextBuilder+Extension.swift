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
    static let signingName = AttributeKey<String>(name: "SigningName")
    static let signingRegion = AttributeKey<String>(name: "SigningRegion")

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
}
