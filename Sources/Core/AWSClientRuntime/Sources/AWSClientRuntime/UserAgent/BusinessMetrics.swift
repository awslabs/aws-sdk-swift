//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import class Smithy.Context
import struct Smithy.AttributeKey

struct BusinessMetrics {
    // Mapping of human readable feature ID to the corresponding metric value
    let features: [String: String]

    init(
        config: UserAgentValuesFromConfig,
        context: Context
    ) {
        setFlagsIntoContext(config: config, context: context)
        self.features = context.businessMetrics
    }
}

extension BusinessMetrics: CustomStringConvertible {
    var description: String {
        var commaSeparatedMetricValues = features.values.sorted().joined(separator: ",")
        // Cut last metric value from string until the
        //  comma-separated list of metric values are at or below 1024 bytes in size
        if commaSeparatedMetricValues.lengthOfBytes(using: .ascii) > 1024 {
            while commaSeparatedMetricValues.lengthOfBytes(using: .ascii) > 1024 {
                commaSeparatedMetricValues = commaSeparatedMetricValues.substringBeforeLast(",")
            }
        }
        return "m/\(commaSeparatedMetricValues)"
    }
}

private extension String {
    func substringBeforeLast(_ separator: String) -> String {
        if let range = self.range(of: separator, options: .backwards) {
            return String(self[..<range.lowerBound])
        } else {
            return self
        }
    }
}

public extension Context {
    var businessMetrics: Dictionary<String, String> {
        get { get(key: businessMetricsKey) ?? [:] }
        set(newPair) {
            var combined = businessMetrics
            combined.merge(newPair) { (_, new) in new }
            set(key: businessMetricsKey, value: combined)
        }
    }
}

public let businessMetricsKey = AttributeKey<Dictionary<String, String>>(name: "BusinessMetrics")

private func setFlagsIntoContext(
    config: UserAgentValuesFromConfig,
    context: Context
) {
    switch config.awsRetryMode {
    case .legacy:
        context.businessMetrics = ["RETRY_MODE_LEGACY": "D"]
    case .standard:
        context.businessMetrics = ["RETRY_MODE_STANDARD": "E"]
    case .adaptive:
        context.businessMetrics = ["RETRY_MODE_ADAPTIVE": "F"]
    }
    if let endpoint = config.endpoint, !endpoint.isEmpty {
        context.businessMetrics = ["ENDPOINT_OVERRIDE": "N"]
    }
    if context.selectedAuthScheme?.schemeID == "aws.auth#sigv4a" {
        context.businessMetrics = ["SIGV4A_SIGNING": "S"]
    }
    switch context.checksum {
    case .crc32:
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_REQ_CRC32": "U"]
    case .crc32c:
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_REQ_CRC32C": "V"]
    case .crc64nvme:
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_REQ_CRC64": "W"]
    case .sha1:
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_REQ_SHA1": "X"]
    case .sha256:
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_REQ_SHA256": "Y"]
    default:
        break
    }
    if config.requestChecksumCalculation == .whenSupported {
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_REQ_WHEN_SUPPORTED": "Z"]
    } else {
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_REQ_WHEN_REQUIRED": "a"]
    }
    if config.responseChecksumValidation == .whenSupported {
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_RES_WHEN_SUPPORTED": "b"]
    } else {
        context.businessMetrics = ["FLEXIBLE_CHECKSUMS_RES_WHEN_REQUIRED": "c"]
    }
}
