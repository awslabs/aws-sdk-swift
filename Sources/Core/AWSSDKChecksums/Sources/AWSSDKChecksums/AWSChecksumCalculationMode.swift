//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public enum AWSChecksumCalculationMode: String {
    case whenRequired = "when_required"
    case whenSupported = "when_supported"

    public init?(caseInsensitiveRawValue: String) {
        let lowercasedValue = caseInsensitiveRawValue.lowercased()

        switch lowercasedValue {
        case AWSChecksumCalculationMode.whenRequired.rawValue:
            self = .whenRequired
        case AWSChecksumCalculationMode.whenSupported.rawValue:
            self = .whenSupported
        default:
            return nil
        }
    }
}
