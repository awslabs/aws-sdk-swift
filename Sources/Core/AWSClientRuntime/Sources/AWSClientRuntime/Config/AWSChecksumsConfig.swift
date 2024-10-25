//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import enum AWSSDKChecksums.AWSChecksumCalculationMode
@_spi(FileBasedConfig) import AWSSDKCommon

public enum AWSChecksumsConfig {
    static func requestChecksumCalculation(
        configValue: AWSChecksumCalculationMode?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) -> AWSChecksumCalculationMode {
        return FieldResolver(
            configValue: configValue,
            envVarName: "AWS_REQUEST_CHECKSUM_CALCULATION",
            configFieldName: "request_checksum_calculation",
            fileBasedConfig: fileBasedConfig,
            profileName: profileName,
            converter: { AWSChecksumCalculationMode(caseInsensitiveRawValue: $0) }
        ).value ?? .whenSupported
    }

    static func responseChecksumValidation(
        configValue: AWSChecksumCalculationMode?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) -> AWSChecksumCalculationMode {
        return FieldResolver(
            configValue: configValue,
            envVarName: "AWS_RESPONSE_CHECKSUM_VALIDATION",
            configFieldName: "response_checksum_validation",
            fileBasedConfig: fileBasedConfig,
            profileName: profileName,
            converter: { AWSChecksumCalculationMode(caseInsensitiveRawValue: $0) }
        ).value ?? .whenSupported
    }
}
