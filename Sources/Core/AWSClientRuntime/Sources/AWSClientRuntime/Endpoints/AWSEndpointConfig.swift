//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo
import struct Foundation.Locale
@_spi(FileBasedConfig) import AWSSDKCommon

public enum AWSEndpointConfig {
    static func configuredEndpoint(
        sdkID: String,
        ignoreConfiguredEndpointURLs: Bool?,
        fileBasedConfig: FileBasedConfiguration
    ) -> String? {
        // First, resolve disable flag
        let disableFlag = FieldResolver(
            configValue: ignoreConfiguredEndpointURLs,
            envVarName: "AWS_IGNORE_CONFIGURED_ENDPOINT_URLS",
            configFieldName: "ignore_configured_endpoint_urls",
            fileBasedConfig: fileBasedConfig,
            profileName: nil,
            converter: { Bool($0) }
        ).value ?? false

        // Resolve configured endpoint only if disableFlag is false
        if disableFlag {
            return nil
        } else {
            let removedSpaceID = sdkID.replacingOccurrences(of: " ", with: "_")
            // 1. Environment variable
            let env = ProcessInfo.processInfo.environment
            //  a. Service-specific configured endpoint from `AWS_ENDPOINT_URL_<SERVICE>`
            if let val = env["AWS_ENDPOINT_URL_\(removedSpaceID.uppercased(with: Locale(identifier: "en_US")))"] {
                return val
            }
            //  b. Global configured endpoint from `AWS_ENDPOINT_URL`
            if let val = env["AWS_ENDPOINT_URL"] {
                return val
            }
            // 2. Shared config property
            let configuredEndpointKey = FileBasedConfigurationKey(rawValue: "endpoint_url")
            let profileName = env["AWS_PROFILE"] ?? "default"
            //  a. For service-specific configured endpoint.
            //     Profile section => referenced services section => nested subsection with service name
            /* E.g.,
                 [profile dev]
                 services = devServices

                 [services devServices]
                 s3 =
                   endpoint_url = https://abcde:9000
             */
            if let servicesSectionName = fileBasedConfig.section(for: profileName)?.string(for: "services") {
                let servicesSection = fileBasedConfig.section(for: servicesSectionName, type: .profile) // Pending CRT change
                let serviceSubsection = servicesSection?.subproperties(
                    for: FileBasedConfigurationKey(rawValue: removedSpaceID.lowercased(with: Locale(identifier: "en_US")))
                )
                if let val = serviceSubsection?.value(for: configuredEndpointKey) {
                    return val
                }
            }
            //  b. For global configured endpoint. Profile section => property
            /* E.g.,
                  [profile dev]
                  services = devServices
                  endpoint_url = http://localhost:5567
             */
            if let configValue = fileBasedConfig.section(for: profileName)?.string(for: configuredEndpointKey) {
                return configValue
            }
            // 3. Configured endpoint not found anywhere; return nil.
            return nil
        }
    }
}
