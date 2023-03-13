//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct Error: LocalizedError {
    var message: String
    var errorDescription: String? { message }
    
    init(_ message: String) {
        self.message = message
    }
}
