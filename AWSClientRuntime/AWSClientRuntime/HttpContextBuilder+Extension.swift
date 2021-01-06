/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

extension HttpContext {
    func getCredentialsProvider() -> AWSCredentialsProvider {
        return attributes.get(key: AttributeKey<AWSCredentialsProvider>(name: "AWSCredentialsProvider"))!
    }

    func getRegion() -> String {
        return attributes.get(key: AttributeKey<String>(name: "Region"))!
    }

    func getSigningRegion() -> String {
        return attributes.get(key: AttributeKey<String>(name: "SigningRegion"))!
    }
}

extension HttpContextBuilder {

    @discardableResult
    public func withRegion(value: String) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<String>(name: "Region"), value: value)
        return self
    }

    @discardableResult
    public func withCredentialsProvider(value: AWSCredentialsProvider) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<AWSCredentialsProvider>(name: "AWSCredentialsProvider"), value: value)
        return self
    }

    @discardableResult
    public func withSigningRegion(value: String) -> HttpContextBuilder {
        self.attributes.set(key: AttributeKey<String>(name: "SigningRegion"), value: value)
        return self
    }
}
