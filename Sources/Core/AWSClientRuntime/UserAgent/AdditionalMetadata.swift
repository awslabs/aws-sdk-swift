//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct AdditionalMetadata {
    let name: String
    let value: String
}

extension AdditionalMetadata: CustomStringConvertible {

    var description: String {
        "md/\(name.userAgentTokenNoHash)#\(value.userAgentToken)"
    }
}
