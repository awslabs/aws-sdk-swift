//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon





enum AuthSchemeConfig {

    /// Determines the auth scheme prioritization to be used from the given config, if any.
    /// - Parameters:
    ///   - configValue: The auth scheme priority list passed at client construction, or `nil` if none was passed.
    ///   - profileName: The profile name passed at client construction.  If `nil` is passed, the SDK will resolve the profile to be used.
    ///   - fileBasedConfig: The file-based config from which to load configuration, if needed.
    /// - Returns: The auth scheme priority that was resolved, or `nil` if none was resolved.
    static func authSchemePreference(
        configValue: [String]?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) -> [String]? {
        return FieldResolver(
            configValue: configValue,
            envVarName: "AWS_AUTH_SCHEME_PREFERENCE",
            configFieldName: "auth_scheme_preference",
            fileBasedConfig: fileBasedConfig,
            profileName: profileName,
            converter: { value in
                let normalized = normalizeSchemes(value)
                return normalized.isEmpty ? nil : normalized
            }
        ).value
    }

    static func normalizeSchemes(_ input: String) -> [String] {
        return input
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }
}
