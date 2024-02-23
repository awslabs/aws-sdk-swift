//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

public class SigV4Util {
    // List of services that use signed body heaader.
    static let usesSignedBodyHeader = ["S3", "Glacier", "S3 Control"]
    // Map of service::operation that use unsigned body for presign URL flow.
    static let forceUnsignedBodyForPresigningURL = [
        "S3": ["getObject", "putObject"]
    ]

    /*
     * Determines whether to force an unsigned body based on the service name, operation name, and flow type.
     * - Parameters:
     *   - flow: The type of flow (e.g., presigning a URL, presigning request, normal).
     *   - serviceName: The name of the service (e.g., "S3").
     *   - opName: The name of the operation (e.g., "GetObject").
     * - Returns: A Boolean indicating whether to force an unsigned body for the request.
     */
    static func shouldForceUnsignedBody(flow: FlowType, serviceName: String, opName: String) -> Bool {
        let serviceQualifies = forceUnsignedBodyForPresigningURL.keys.contains(serviceName)
        return serviceQualifies && (flow == .PRESIGN_URL) && forceUnsignedBodyForPresigningURL[serviceName]!.contains(opName)
    }

    // Returns true if service uses a signed body header, false otherwise.
    static func serviceUsesSignedBodyHeader(serviceName: String) -> Bool {
        return usesSignedBodyHeader.contains(serviceName)
    }

    // Sets S3-specific flags on the signing properties.
    static func setS3SpecificFlags(signingProperties: inout Attributes, serviceName: String) {
        let serviceIsS3 = serviceName == "S3"
        // Set useDoubleURIEncode to false IFF service is S3
        signingProperties.set(key: AttributeKeys.useDoubleURIEncode, value: !serviceIsS3)
        // Set shouldNormalizeURIPath to false IFF service is S3
        signingProperties.set(key: AttributeKeys.shouldNormalizeURIPath, value: !serviceIsS3)
        signingProperties.set(key: AttributeKeys.omitSessionToken, value: false)
    }
}
