//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

extension HttpContext {
    static let credentialsProvider = AttributeKey<AWSCredentialsProvider>(name: "AWSCredentialsProvider")
    static let region = AttributeKey<String>(name: "Region")

    func getCredentialsProvider() -> AWSCredentialsProvider {
        return attributes.get(key: HttpContext.credentialsProvider)!
    }

    func getRegion() -> String {
        return attributes.get(key: HttpContext.region)!
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
}
