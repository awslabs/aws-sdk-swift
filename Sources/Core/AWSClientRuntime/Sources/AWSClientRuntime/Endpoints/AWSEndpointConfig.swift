//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

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
}
