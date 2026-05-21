//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
import class Foundation.ProcessInfo
import enum Smithy.ClientError

public enum AWSRetryConfig {

    /// Determines the retry mode to be used from the given config.  If none can be determined, `legacy` will be used as a default.
    /// - Parameters:
    ///   - configValue: The retry mode passed at client construction, or `nil` if none was passed.
    ///   - profileName: The profile name passed at client construction.  If `nil` is passed, the SDK will resolve the profile to be used.
    ///   - fileBasedConfig: The file-based config from which to load configuration, if needed.
    /// - Returns: The retry mode that was resolved.
    /// - Throws: `ClientError.invalidValue` if `AWS_RETRY_MODE` or the `retry_mode` config field is set but unparseable.
    static func retryMode(
        configValue: AWSRetryMode?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) throws -> AWSRetryMode {
        if let configValue { return configValue }
        if let raw = ProcessInfo.processInfo.environment["AWS_RETRY_MODE"] {
            guard let mode = AWSRetryMode(rawValue: raw) else {
                throw ClientError.invalidValue("Invalid AWS_RETRY_MODE: \"\(raw)\". Expected one of: legacy, standard, adaptive.")
            }
            return mode
        }
        let envProfileName = ProcessInfo.processInfo.environment["AWS_PROFILE"]
        let sectionName = profileName ?? envProfileName ?? "default"
        let key = FileBasedConfigurationKey(rawValue: "retry_mode")
        if let raw = fileBasedConfig.section(for: sectionName)?.string(for: key) {
            guard let mode = AWSRetryMode(rawValue: raw) else {
                throw ClientError.invalidValue("Invalid retry_mode in config file: \"\(raw)\". Expected one of: legacy, standard, adaptive.")
            }
            return mode
        }
        return .standard
    }

    /// Determines the max attempts (for retry purposes) to be used from the given config.  If none can be determined, `3` will be used as a default.
    ///
    /// Max attempts must be a positive, nonzero integer.
    /// - Parameters:
    ///   - configValue: The max attempts passed at client construction, or `nil` if none was passed.
    ///   - profileName: The profile name passed at client construction.  If `nil` is passed, the SDK will resolve the profile to be used.
    ///   - fileBasedConfig: The file-based config from which to load configuration, if needed.
    /// - Returns: The max attempts that was resolved.
    static func maxAttempts(
        configValue: Int?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) -> Int {
        return FieldResolver(
            configValue: configValue,
            envVarName: "AWS_MAX_ATTEMPTS",
            configFieldName: "max_attempts",
            fileBasedConfig: fileBasedConfig,
            profileName: profileName,
            converter: { Int($0) }
        ).value ?? 3
    }
}
