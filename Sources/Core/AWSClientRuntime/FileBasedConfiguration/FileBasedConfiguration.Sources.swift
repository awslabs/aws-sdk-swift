//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

extension FileBasedConfiguration {
    struct Sources: Hashable {
        // waqar - Can CRT expose a property/function that returns the resolved file path?
        let configPath: String
        let credentialPath: String
    }
}
