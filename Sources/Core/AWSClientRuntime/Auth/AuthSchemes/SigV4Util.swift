//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

public class SigV4Util {
    static let usesSignedBodyHeader = ["S3", "Glacier", "S3 Control"]
    static let forceUnsignedBodyForPresigningURL = [
        "S3": ["getObject", "putObject"]
    ]

    static func shouldForceUnsignedBody(flow: FlowType, serviceName: String, opName: String) -> Bool {
        let serviceQualifies = forceUnsignedBodyForPresigningURL.keys.contains(serviceName)
        let flowQualifies = flow == .PRESIGN_URL
        return serviceQualifies && flowQualifies && forceUnsignedBodyForPresigningURL[serviceName]!.contains(opName)
    }

    static func serviceUsesSignedBodyHeader(serviceName: String) -> Bool {
        return usesSignedBodyHeader.contains(serviceName)
    }

    static func setS3SpecificFlags(signingProperties: inout Attributes, serviceName: String) {
        let serviceIsS3 = serviceName == "S3"
        // Set useDoubleURIEncode to false IFF service is S3
        signingProperties.set(key: AttributeKeys.useDoubleURIEncode, value: !serviceIsS3)
        // Set shouldNormalizeURIPath to false IFF service is S3
        signingProperties.set(key: AttributeKeys.shouldNormalizeURIPath, value: !serviceIsS3)
        signingProperties.set(key: AttributeKeys.omitSessionToken, value: false)
    }
}
