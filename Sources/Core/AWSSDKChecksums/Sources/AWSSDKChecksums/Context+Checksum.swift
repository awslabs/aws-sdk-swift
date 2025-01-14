//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import class Smithy.ContextBuilder
import struct Smithy.AttributeKey

public extension Context {
    var requestChecksumCalculation: AWSChecksumCalculationMode {
        get { get(key: requestChecksumCalculationKey) ?? .whenSupported }
        set { set(key: requestChecksumCalculationKey, value: newValue) }
    }

    var responseChecksumValidation: AWSChecksumCalculationMode {
        get { get(key: responseChecksumValidationKey) ?? .whenSupported }
        set { set(key: responseChecksumValidationKey, value: newValue) }
    }
}

public extension ContextBuilder {
    @discardableResult
    func withRequestChecksumCalculation(value: AWSChecksumCalculationMode) -> Self {
        self.attributes.set(key: requestChecksumCalculationKey, value: value)
        return self
    }

    @discardableResult
    func withResponseChecksumValidation(value: AWSChecksumCalculationMode) -> Self {
        self.attributes.set(key: responseChecksumValidationKey, value: value)
        return self
    }
}

private let requestChecksumCalculationKey = AttributeKey<AWSChecksumCalculationMode>(name: "requestChecksumCalculation")
private let responseChecksumValidationKey = AttributeKey<AWSChecksumCalculationMode>(name: "responseChecksumValidation")
