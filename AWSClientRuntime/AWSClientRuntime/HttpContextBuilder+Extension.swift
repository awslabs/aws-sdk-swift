//
//  File.swift
//  
//
//  Created by Stone, Nicki on 1/3/21.
//

import ClientRuntime

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
