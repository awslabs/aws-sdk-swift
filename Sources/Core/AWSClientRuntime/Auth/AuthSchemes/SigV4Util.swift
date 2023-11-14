//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

public class SigV4Util {
    static let unsignedBodyHeader = ["S3", "Glacier"]
    static let forceUnsignedBodyForPresigningURL = [
        "S3": ["getObject", "putObject"]
    ]
    // Update the presignURL variable in this helper function to add support for presigned URL
    //  to a new operation in a service.
    static let presignURL = [
        "S3": ["getObject", "putObject"],
        "Polly": ["synthesizeSpeech"]
    ]

    static func shouldForceUnsignedBody(flow: FlowType, serviceName: String, opName: String) -> Bool {
        let serviceQualifies = forceUnsignedBodyForPresigningURL.keys.contains(serviceName)
        let flowQualies = flow == .PRESIGN_URL
        return serviceQualifies && flowQualies && forceUnsignedBodyForPresigningURL[serviceName]!.contains(opName)
    }

    static func shouldPresignURL(serviceName: String, opName: String) -> Bool {
        let serviceQualifies = presignURL.keys.contains(serviceName)
        return serviceQualifies && presignURL[serviceName]!.contains(opName)
    }

    static func serviceUsesUnsignedBodyHeader(serviceName: String) -> Bool {
        return unsignedBodyHeader.contains(serviceName)
    }
}
