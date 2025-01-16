//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo
import enum Smithy.ClientError
import struct Foundation.Locale
import struct Smithy.SwiftLogger
@_spi(FileBasedConfig) import AWSSDKCommon

public enum AWSEndpointConfig {

    static func accountIDEndpointMode(
        configValue: AccountIDEndpointMode?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) -> AccountIDEndpointMode {
        FieldResolver(
            configValue: configValue,
            envVarName: "AWS_ACCOUNT_ID_ENDPOINT_MODE",
            configFieldName: "account_id_endpoint_mode",
            fileBasedConfig: fileBasedConfig,
            profileName: profileName,
            converter: { AccountIDEndpointMode(rawValue: $0) }
        ).value ?? .preferred
    }

    static func configuredEndpoint(
        sdkID: String,
        ignoreConfiguredEndpointURLs: Bool?,
        fileBasedConfig: FileBasedConfiguration
    ) throws -> String? {
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
            let logger = SwiftLogger(label: "ConfiguredEndpointResolver")
            let removedSpaceID = sdkID.replacingOccurrences(of: " ", with: "_")
            // 1. Environment variable
            let env = ProcessInfo.processInfo.environment
            //  a. Service-specific configured endpoint from `AWS_ENDPOINT_URL_<SERVICE>`
            let uppercasedID = removedSpaceID.uppercased(with: Locale(identifier: "en_US"))
            if let val = env["AWS_ENDPOINT_URL_\(uppercasedID)"], val != "" {
                logger.trace("Resolved configured endpoint from AWS_ENDPOINT_URL_\(uppercasedID): \(val)")
                return val
            }
            //  b. Global configured endpoint from `AWS_ENDPOINT_URL`
            if let val = env["AWS_ENDPOINT_URL"], val != "" {
                logger.trace("Resolved configured endpoint from AWS_ENDPOINT_URL: \(val)")
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
                guard let servicesSection = fileBasedConfig.section(for: servicesSectionName, type: .services) else {
                    throw ClientError.dataNotFound(
                        "The [services \(servicesSectionName)] section doesn't exist!"
                    )
                }
                let serviceSubsection = servicesSection.subproperties(
                    for: FileBasedConfigurationKey(
                        rawValue: removedSpaceID.lowercased(with: Locale(identifier: "en_US"))
                    )
                )
                if let val = serviceSubsection?.value(for: configuredEndpointKey), val != "" {
                    logger.trace(
                        "Resolved configured endpoint from service-specific field in shared config file: \(val)"
                    )
                    return val
                }
            }
            //  b. For global configured endpoint. Profile section => property
            /* E.g.,
                  [profile dev]
                  services = devServices
                  endpoint_url = http://localhost:5567
             */
            if let val = fileBasedConfig.section(for: profileName)?.string(for: configuredEndpointKey), val != "" {
                logger.trace("Resolved configured endpoint from global field in shared config file: \(val)")
                return val
            }
            // 3. Configured endpoint not found anywhere; return nil.
            logger.trace("No configured endpoint found. Defaulting to SDK logic for resolving endpoint...")
            return nil
        }
    }
}
