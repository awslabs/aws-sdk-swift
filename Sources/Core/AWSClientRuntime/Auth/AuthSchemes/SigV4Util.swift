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
        let flowQualies = flow == .PRESIGN_URL
        return serviceQualifies && flowQualies && forceUnsignedBodyForPresigningURL[serviceName]!.contains(opName)
    }

    static func serviceUsesSignedBodyHeader(serviceName: String) -> Bool {
        return usesSignedBodyHeader.contains(serviceName)
    }
}
