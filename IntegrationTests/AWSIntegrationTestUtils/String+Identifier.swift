//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.UUID

package extension String {
    
    /// Returns an identifier that contains a UUID and is 63 or less chars in length.
    ///
    /// Size is selected to be compatible with the requirement that bucket names be 63 characters or less.
    /// - Parameter service: The name (or abbreviation) of the service being identified.
    /// May contain only A-Z, a-z, 0-9, and dash(-).  May not be empty.  May not be long enough to result in an
    /// identifier 64 chars or longer.  Uppercase characters in the service will be downcased in the identifier.
    /// - Returns: The identifier.
    static func uniqueID(service: String) -> String {
        let prefix = "sdkinttest-"
        guard !service.isEmpty else {
            fatalError("Service cannot be empty")
        }
        guard service.lowercased().allSatisfy({ "abcdefghijklmnopqrstuvwxyz0123456789-".contains($0) }) else {
            fatalError("Service cannot contain characters other than alphanumeric & dash")
        }
        guard prefix.count + service.count + 36 < 64 else {
            fatalError("Service name is too long.  Limit is \(63 - prefix.count - 36)")
        }
        return (prefix + service + UUID().uuidString).lowercased()
    }
}
