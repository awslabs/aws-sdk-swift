//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import class Smithy.ContextBuilder
import enum SmithyHTTPAuthAPI.SigningPropertyKeys

public extension Context {

    var sigV4aSigningRegionSet: [String]? {
        get { get(key: SigningPropertyKeys.sigV4aSigningRegionSet) }
        set { set(key: SigningPropertyKeys.sigV4aSigningRegionSet, value: newValue) }
    }
}

public extension ContextBuilder {

    @discardableResult
    func withSigV4aSigningRegionSet(value: [String]?) -> Self {
        attributes.set(key: SigningPropertyKeys.sigV4aSigningRegionSet, value: value)
        return self
    }
}
