//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

public struct SigV4AuthScheme: ClientRuntime.AuthScheme {
    public let schemeId: String = "aws.auth#sigv4"
    public let signer: any ClientRuntime.Signer = AWSSigV4Signer()
    public let idType: ClientRuntime.IdentityType = .aws
    
    public init() {}
    
    public func customizeSigningProperties(signingProperties: Attributes, config: HttpContext) -> Attributes {
        var copy = signingProperties
        copy.set(key: AttributeKeys.bidirectionalStreaming, value: config.isBidirectionalStreamingEnabled())
        copy.set(key: AttributeKeys.signingRegion, value: config.getSigningRegion())
        return copy
    }
}
