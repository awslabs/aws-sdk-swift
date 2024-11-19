//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public func generateRandomTextData(ofSizeInBytes byteCount: Int) -> Data {
    let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".utf8
    let allowedBytes = Array(allowedCharacters)
    let randomBytes = (0..<byteCount).map { _ in allowedBytes.randomElement()! }
    return Data(randomBytes)
}

public func generateRandomTextData(ofSizeInMB megabytes: Double) -> Data {
    let byteCount = Int(megabytes * 1024 * 1024) // Convert megabytes to bytes
    return generateRandomTextData(ofSizeInBytes: byteCount)
}
